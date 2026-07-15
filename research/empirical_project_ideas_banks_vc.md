# Empirical Project Ideas: Banks, VC, and Entrepreneurship

Concrete empirical designs for the research line with Ming-Jin Jiang,
building on "Banks in the Venture Capital Market" (Jiang, 2015).
Compiled from a web sweep, July 2026.

---

## Idea 1 (recommended): The 2020 Volcker VC exclusion as a natural experiment

**Question.** What happens to startup financing when banks are allowed back
into venture capital? Does the strategic-complementarity mechanism of
Hellmann, Lindsey & Puri (RFS 2008) — banks invest in VC to build lending
relationships — reactivate?

**Setting.** The Volcker Rule forced US banking entities out of covered
funds (conformance ~2014–2017). On October 1, 2020, regulators
[excluded qualifying venture capital funds](https://www.federalregister.gov/documents/2020/07/31/2020-15525/prohibitions-and-restrictions-on-proprietary-trading-and-certain-interests-in-and-relationships-with)
from the covered-fund definition, letting banks invest in VC funds again
([Volcker 2.0 summary](https://corpgov.law.harvard.edu/2020/07/11/final-volcker-2-0-summary-for-fund-activities/),
[Carta overview](https://carta.com/blog/volcker-rule-reform-unlocking-capital-for-venture-funds/),
[BU Review of Banking & Financial Law note](https://www.bu.edu/rbfl/2021/02/15/changes-to-the-volcker-rule-and-the-venture-capital-exception/)).
Two clean policy shocks: forced exit (~2014) and permitted re-entry (2020).

**Why it's attractive.** A July 2026 web sweep finds regulatory and
practitioner commentary but no published academic paper exploiting the 2020
exclusion — this looks like an open gap.

**Design.**
- Diff-in-diff around Oct 2020: VC funds by pre-Volcker propensity to have
  bank LPs / bank affiliation (treatment intensity) vs. purely independent
  funds. Outcomes: fundraising success, fund size, deal flow.
- Startup level: companies backed by re-entering bank-affiliated funds vs.
  matched startups — subsequent loan relationships, venture debt take-up,
  exit outcomes. This directly re-tests the cross-selling mechanism.
- Symmetric analysis of the ~2014 forced-exit period as validation.

**Data.** PitchBook or Preqin for fund LP composition and bank affiliation;
Crunchbase for startup outcomes; DealScan / SEC filings for subsequent loans.

## Idea 2: The SVB collapse (March 2023) as a shock to venture banking

**Question.** How much do startups depend on specialized banks? What happens
to entrepreneurship when the dominant venture bank disappears?

**Setting.** In 2021 roughly half of US venture-backed tech and life-science
companies banked with SVB, the largest venture-debt provider
([overview](https://en.wikipedia.org/wiki/Collapse_of_Silicon_Valley_Bank)).
Its collapse is a sharp, plausibly exogenous (to any single startup) shock
to the bank–startup relationship. Existing work is mostly case-study /
descriptive ([example](https://www.ijfmr.com/papers/2024/5/29535.pdf)); a
careful micro DiD on startup outcomes still has room.

**Design.** DiD comparing SVB-exposed startups (identifiable from press
releases, payroll-crisis lists, venture-debt deal records) to matched
non-exposed startups: survival, follow-on VC rounds, venture-debt terms,
hiring (LinkedIn/Revelio), relocation of banking relationships.
Heterogeneity: pre-shock cash runway, VC backing quality, sector.

**Data.** Crunchbase/PitchBook (rounds, outcomes), venture debt from
PitchBook or SEC filings, SVB client exposure hand-collected/scraped.

## Idea 3: Bank credit vs. VC for young firms in Europe (SAFE microdata)

**Question.** Substitutes or complements? How does bank-credit tightening
shift young innovative firms toward (or away from) equity/VC financing?

**Setting.** The ECB/EC [SAFE survey](https://www.ecb.europa.eu/stats/ecb_surveys/safe/html/index.en.html)
(quarterly since 2024, semi-annual back to 2009) covers financing conditions
of EU firms with breakdowns by firm age — anonymized microdata are available
to researchers on application. Recent waves report
[tightened lending conditions](https://www.ecb.europa.eu/press/pr/date/2026/html/ecb.pr260427~039951e152.en.html).
Cross-country evidence of a VC–bank-credit substitution effect exists at the
macro level ([J. Int. Entrepreneurship 2025](https://link.springer.com/article/10.1007/s10843-025-00386-9))
but firm-level microevidence for Europe is thin.

**Design.** Firm-level panel from SAFE microdata: young/innovative firms'
reported use of and demand for bank loans vs. equity, identified off
country-time variation in bank lending standards (BLS survey) or bank
health shocks. Merge with Dealroom/VICO VC-deal data at country-sector
level for actual VC outcomes.

**Data.** SAFE anonymized microdata (free, application to ECB); ECB Bank
Lending Survey; Dealroom or Invest Europe for VC volumes. Cheapest of the
three ideas — no commercial data license strictly required.

## Idea 4 (smaller/faster): Bank-affiliated VC and fintech deal selection

Extend the post-GFC convergence result
([Rev. Managerial Science 2025](https://link.springer.com/article/10.1007/s11846-025-00838-5))
and the FDIC fintech findings
([Qian et al. 2024](https://www.fdic.gov/system/files/2024-09/qian-paper-091824.pdf)):
do bank-affiliated VCs select fintechs that complement vs. threaten the
parent bank's business (payments vs. lending disruptors)? Deal-level
selection model with investor fixed effects; Crunchbase fintech
classification suffices.

---

## Data access summary

| Source | Coverage | Access/cost |
|---|---|---|
| [Crunchbase](https://lpbacked.com/alternatives/vs/pitchbook-vs-crunchbase) | Startups, rounds, investors, global | ~$49/mo tier; academic CSV access via Crunchbase for research programs |
| [PitchBook](https://pitchbook.com/compare/pitchbook-vs-preqin) | Deals, funds, LPs, venture debt | ~$20k+/yr; some universities have licenses |
| Preqin | Funds, LP commitments, performance | Institutional license; check UIB/WRDS |
| VentureXpert (Refinitiv/LSEG) | Long historical VC panel | Via WRDS/SDC if the university subscribes |
| [ECB SAFE microdata](https://www.ecb.europa.eu/stats/ecb_surveys/safe/html/index.en.html) | EU firm financing conditions, 2009– | Free for researchers on application |
| DealScan (LSEG) | Syndicated loans | Via WRDS |
| See also the NBER methodological survey: [Venture Capital Data: Opportunities and Challenges](https://www.nber.org/system/files/chapters/c13495/revisions/c13495.rev2.pdf) | | |

## Suggested next steps

1. Check which of PitchBook / Preqin / WRDS-SDC your university (or Jiang's
   institution) already licenses — this decides between Idea 1/2 (US,
   commercial data) and Idea 3 (Europe, free ECB microdata).
2. For Idea 1, a one-week feasibility pass: count bank-LP appearances in VC
   funds' filings (SEC Form D / ADV are free) before vs. after Oct 2020 to
   verify the re-entry margin is large enough to power a study.
