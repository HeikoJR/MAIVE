# SAFE data notes (power check, Idea 3)

## What we have so far

`safe_2026q1_chartpack_extract.csv` — tidy extract (2,991 obs, 246 series)
of the ECB **SAFE 2026Q1 chart pack** (`SAFE_series_2026Q1.xlsx`).
Contents: euro-area aggregates, recent waves only (2022Q4–2026Q1),
size classes ALL/SME/LAR. Instruments covered: bank loans (FBLN),
overdrafts (FOVD), trade credit (FTCR). **No equity series, no firm-age
breakdown** — the quarterly report does not cover the financing-sources
(equity/VC) questions, which run on the half-yearly subsample.

Useful anyway: Q5 (needs) / Q9 (availability) / Q7A (applications) /
FOB (obstacles) for bank loans = the treatment-side (credit-supply)
variables of the design.

## Decoded ECB Data Portal series-key structure

`SAFE.H.U2.SME.A.0.0.0.Q9.FBLN.NN.AL.WP`
 = FREQ . REF_AREA . SIZE . (A) . sector . age . ownership? . ITEM .
   INSTRUMENT . RESPONSE . (AL) . WP (weighted %).

The three `0.0.0` slots are breakdown dimensions (sector / firm age /
ownership) — `0` = all firms. Firm-age breakdowns therefore exist in the
full dataset under non-zero codes in that slot. Dimension code lists:
https://data.ecb.europa.eu/data/datasets/SAFE/structure

## What to download to finish the power check

Option A (best): ECB Data Portal → dataset SAFE →
"Download full dataset" (CSV). Then run `research/safe_power_check.R`
(point it at the file), or upload the zip to the assistant session —
the tabulation code is ready.

Option B: on the portal's SAFE page, filter
Instrument = equity, and export only those series (much smaller file).

Option C: the half-yearly chart pack / EC annual SAFE analytical report
contains the financing-sources chart (equity relevance) and firm-age
breakdowns in its annex.
