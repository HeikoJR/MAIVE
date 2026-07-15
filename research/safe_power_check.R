# -------------------------------------------------------------------------
# Power check for Idea 3: bank credit vs. VC/equity for young firms (SAFE)
#
# Downloads the public aggregate SAFE dataset from the ECB Data Portal,
# tabulates equity-related items by breakdown (firm age/size) x country x
# wave, and runs a back-of-envelope minimum-detectable-effect calculation.
#
# Usage:   Rscript research/safe_power_check.R
# Output:  research/output/safe_equity_by_breakdown.csv
#          research/output/safe_equity_timeseries.csv
#          research/output/safe_power_summary.txt
#
# Note: run this on a machine with normal internet access; the ECB Data
# Portal (data-api.ecb.europa.eu) is not reachable from every environment.
# -------------------------------------------------------------------------

out_dir <- file.path("research", "output")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

# Series-key structure (decoded from the 2026Q1 chart pack, see
# research/output/README_safe_data.md):
#   SAFE.H.U2.SME.A.0.0.0.Q9.FBLN.NN.AL.WP
#   = FREQ.AREA.SIZE.(A).sector.age.ownership.ITEM.INSTRUMENT.RESPONSE.(AL).WP
# The '0' slots are breakdown dimensions (0 = all firms); firm-age series
# have non-zero codes there. Known instruments: FBLN bank loans, FOVD
# overdrafts, FTCR trade credit; the equity code is identified below by
# matching labels rather than hard-coding.

# --- 1. Download the full SAFE aggregate dataset as CSV -------------------
# The SDMX csvdata format includes one column per dimension, so we do not
# need to hard-code the series-key structure.
safe_url  <- "https://data-api.ecb.europa.eu/service/data/SAFE?format=csvdata"
safe_file <- file.path(out_dir, "safe_full.csv")

if (!file.exists(safe_file)) {
  message("Downloading SAFE dataset (this can take a few minutes) ...")
  ok <- tryCatch({
    download.file(safe_url, safe_file, mode = "wb", quiet = FALSE)
    TRUE
  }, error = function(e) FALSE)
  if (!ok || file.size(safe_file) < 1e4) {
    stop(paste0(
      "Automatic download failed. Download manually from the ECB Data\n",
      "Portal (https://data.ecb.europa.eu/data/datasets/SAFE) using the\n",
      "'Download full dataset' (CSV) option and save it as:\n  ", safe_file))
  }
}

safe <- read.csv(safe_file, stringsAsFactors = FALSE, check.names = FALSE)
message(sprintf("Loaded %d rows, %d columns.", nrow(safe), ncol(safe)))
message("Columns: ", paste(names(safe), collapse = ", "))

# --- 2. Identify equity-related survey items ------------------------------
# Match on any label/title column so this survives dimension renamings.
label_cols <- names(safe)[sapply(safe, function(x)
  is.character(x) && any(grepl("equity", x, ignore.case = TRUE)))]
if (length(label_cols) == 0)
  stop("No column mentions 'equity' - inspect names(safe) and adjust.")

is_equity <- Reduce(`|`, lapply(label_cols, function(cl)
  grepl("equity", safe[[cl]], ignore.case = TRUE)))
eq <- safe[is_equity, ]
message(sprintf("Equity-related rows: %d (matched in: %s)",
                nrow(eq), paste(label_cols, collapse = ", ")))

# --- 3. Tabulate by breakdown x country x wave -----------------------------
# Guess the standard SDMX-CSV columns; adjust here if the portal renames.
pick <- function(cands) { hit <- intersect(cands, names(eq)); if (length(hit)) hit[1] else NA }
col_period  <- pick(c("TIME_PERIOD", "time_period"))
col_value   <- pick(c("OBS_VALUE", "obs_value"))
col_country <- pick(c("REF_AREA", "ref_area", "SAFE_AREA"))
col_break   <- pick(c("SAFE_BREAKDOWN", "BREAKDOWN", "SAFE_ENTERPRISE",
                      "ENTERPRISE_SIZE", "SIZE", "FIRM_AGE"))
col_item    <- pick(c("SAFE_ITEM", "SAFE_QUESTION", "ITEM", "TITLE"))

stopifnot(!is.na(col_period), !is.na(col_value))

# Flag whether the aggregate data carries a firm-age breakdown at all:
# if not, the age dimension only exists in the microdata (still fine,
# but the public power check then runs on size classes instead).
if (!is.na(col_break)) {
  age_vals <- grepl("year|age", unique(eq[[col_break]]), ignore.case = TRUE)
  message(sprintf("Breakdown column '%s': %d values, of which age-related: %d",
                  col_break, length(unique(eq[[col_break]])), sum(age_vals)))
} else {
  message("No breakdown column found - only country/size aggregates public.")
}

grp_cols <- na.omit(c(col_item, col_break, col_country, col_period))
tab <- aggregate(eq[[col_value]], by = eq[grp_cols], FUN = mean, na.rm = TRUE)
names(tab)[ncol(tab)] <- "value"
write.csv(tab, file.path(out_dir, "safe_equity_by_breakdown.csv"), row.names = FALSE)

ts <- aggregate(eq[[col_value]], by = eq[na.omit(c(col_item, col_period))],
                FUN = mean, na.rm = TRUE)
names(ts)[ncol(ts)] <- "value"
write.csv(ts, file.path(out_dir, "safe_equity_timeseries.csv"), row.names = FALSE)

# --- 4. Back-of-envelope power calculation ---------------------------------
# MDE (percentage points) for a two-group comparison of a binary outcome,
# alpha = .05, power = .80:  mde = 2.8 * sqrt(2 * p*(1-p) / n_per_cell)
mde <- function(p, n) 2.8 * sqrt(2 * p * (1 - p) / n)

waves            <- 30      # semi-annual 2009-2023 + quarterly 2024-
firms_per_wave   <- 11000   # euro-area rounds (EC rounds are larger)
share_young      <- 0.10    # firms < 5 years old (adjust from microdata)
p_eq_relevant    <- 0.10    # equity 'relevant' margin (~10%, check output)
p_eq_used        <- 0.02    # equity 'used' margin (~2% per ECB SAFE 2021H2)

n_young_total <- waves * firms_per_wave * share_young
half          <- n_young_total / 2   # treated vs control split

summary_txt <- c(
  sprintf("Pooled young-firm observations (assumed): %.0f", n_young_total),
  sprintf("MDE on 'equity relevant' (p=%.2f): %.2f pp", p_eq_relevant,
          100 * mde(p_eq_relevant, half)),
  sprintf("MDE on 'equity used'     (p=%.2f): %.2f pp", p_eq_used,
          100 * mde(p_eq_used, half)),
  "",
  "Rule of thumb: the design is powered if the MDE is comfortably below",
  "the effect size you expect (e.g. a 1-2 pp shift in equity relevance",
  "after a credit-supply tightening). Re-run with the actual young-firm",
  "share and margins from the tabulated output above."
)
writeLines(summary_txt, file.path(out_dir, "safe_power_summary.txt"))
cat(paste(summary_txt, collapse = "\n"), "\n")
