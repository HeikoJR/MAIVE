# Feasibility Check — Idea 3: Bank Credit vs. VC for Young Firms (ECB SAFE microdata)

Verified via web sweep, July 2026. Verdict: **feasible, cheap, and the
specific firm-level question appears to be open** — with one real risk
(few equity-financed firms per wave) and known mitigations.

---

## 1. Data access — CONFIRMED, free

- Anonymised SAFE microdata are available to researchers on request:
  fill in the [confidentiality declaration](https://www.ecb.europa.eu/stats/pdf/surveys/sme/Confidentiality_declaration.pdf)
  and email it to **survey.accesstofinance@ecb.europa.eu**
  ([SAFE main page](https://www.ecb.europa.eu/stats/ecb_surveys/safe/html/index.en.html),
  [ECB Data Portal methodology](https://data.ecb.europa.eu/methodology/survey-access-finance-enterprises-safe)).
- Coverage: since 2009, semi-annual/annual waves; **quarterly since 2024 Q1**.
  Euro-area waves run by the ECB; one wave per year with the European
  Commission covers all EU countries.
- There is a panel component: ECB researchers have built firm panels from
  SAFE (e.g. [ECB WP 2126](https://www.ecb.europa.eu/pub/pdf/scpwps/ecb.wp2126.en.pdf)
  uses ~5,000 SMEs observed 2014–2016).

## 2. Required variables — CONFIRMED

- The questionnaire covers **equity as a financing source and explicitly
  references "venture capital enterprises or business angels"** — both
  relevance ("is this source relevant to your firm") and actual use in the
  reference period (see the current
  [questionnaire PDF](https://www.ecb.europa.eu/stats/accesstofinancesofenterprises/pdf/questionnaire/ecb.safeq202507.en.pdf)).
- Firm characteristics: age classes (incl. <2y, 2–5y — the entrepreneurship
  margin), size class, sector, country, ownership (incl. VC/angel-owned as
  an ownership category), financial autonomy, innovation activity, growth.
- Bank-credit side within the same survey: loan applications, rejections,
  discouraged borrowers, perceived willingness of banks to lend — so demand
  and denial are observed at the firm level, not inferred.
- Caveat: since the 2024 move to quarterly, the detailed financing-
  instrument questions run on the **half-yearly subsample** only — the
  equity questions are there, but not in every quarterly wave.

## 3. Is the question taken? — Apparently NOT at the firm level

What exists (and what to cite/position against):

- Credit-constraint literature on SAFE: young/innovative SMEs face more
  loan obstacles and are more often discouraged
  ([ECB WP 1577](https://www.ecb.europa.eu/pub/pdf/scpwps/ecbwp1577.pdf);
  [ECB Economic Bulletin 2020](https://www.ecb.europa.eu/press/economic-bulletin/articles/2020/html/ecb.ebart202004_02~80dcc6a564.en.html);
  [Corbisiero & Faccia, Central Bank of Ireland](https://www.centralbank.ie/docs/default-source/publications/research-technical-papers/12rt19-firms-or-banks-weakness-access-to-finance-since-the-european-sovereign-debt-crisis-(corbisiero-and-faccia).pdf?sfvrsn=6)).
- Financing-pattern taxonomies (cluster analyses, one/two waves):
  [Moritz, Block & Heinz 2016](https://www.eif.org/files/records/Financing-patterns-of-European-SMEs---EIF-working-paper-2015-30.pdf);
  [Masiak, Moritz & Lang 2017](https://www.eif.org/news_centre/publications/eif_wp_40.pdf).
- Market-based finance and SME growth
  ([Small Business Economics 2024](https://link.springer.com/article/10.1007/s11187-024-00918-y)).
- Macro/cross-country substitution between VC availability and bank credit
  ([J. Int. Entrepreneurship 2025](https://link.springer.com/article/10.1007/s10843-025-00386-9)).
- Instrument substitution using SAFE exists for **debt securities vs. bank
  loans** (ECB Economic Bulletin 2023) — but no paper found that estimates
  the **bank-credit → VC/equity substitution for young firms at the firm
  level with identification from credit-supply shocks**. That is the gap.

## 4. Design (sharpened)

Outcome: young firm reports equity/VC as relevant, used, or sought.
Treatment: bank-credit supply tightening — identified from
(a) country×wave Bank Lending Survey standards for small firms,
(b) firm-level rejection/discouragement instrumented by bank-health
exposure, following the identification style of the
[SAFE monetary-policy literature](https://pmc.ncbi.nlm.nih.gov/articles/PMC9938349/).
Heterogeneity: firm age (<5y vs older), innovation status, sector VC
intensity. Complement with country-level VC volumes (Invest Europe /
Dealroom) to show aggregate consistency.

## 5. Risks and mitigations

| Risk | Assessment | Mitigation |
|---|---|---|
| Few equity users per wave (equity use is a small share of SME financing) | Real — the main risk | Pool all waves 2009–2026 (~30+ waves × ~10–15k firms); use "relevance" and "discouraged from equity" margins, not only use; focus on the EC all-EU waves for extra countries |
| Equity category mixes VC, angels, other equity | Moderate | Ownership question separately identifies VC/angel-owned firms; frame as "external equity" |
| Instrument questions only half-yearly since 2024 | Minor | The 2009–2023 backbone is unaffected |
| Repeated cross-section rather than full panel | Moderate | Partial panel exists; country×age-cohort pseudo-panels as fallback |

## 6. Concrete next steps

1. Email the signed confidentiality declaration to
   survey.accesstofinance@ecb.europa.eu (turnaround is typically fast; no fee).
2. While waiting: download the public aggregate SAFE series from the
   [ECB Data Portal](https://data.ecb.europa.eu/data/datasets/SAFE/publications)
   and tabulate equity relevance/use by firm age × country × wave to
   power-check the design before touching microdata.
3. Request the latest
   [methodology & user guide](https://www.ecb.europa.eu/stats/pdf/surveys/sme/ecb.safemi.en.pdf)
   for the exact variable list per wave (blocked from this environment;
   downloads fine from a normal browser).
