# Medical Tests Manuscript Audit

Review date: 2026-08-11  
Audience baseline: clinicians and students  
Standards baseline: international guidance, US-led where applicable  
Review type: audit report followed by source remediation

## Executive summary

The audit findings were used to remediate the manuscript source. All 234 `test_*.tex` chapters, the introduction, and six appendices are included by `medical_tests.tex`. The critical-values appendix, sepsis algorithm, acetaminophen nomogram discussion, STI chapters, ANCA chapter, tumor-marker language, PSA velocity language, HIV interpretation, reference-range/code qualifiers, heading consistency, and duplicate bibliography key were corrected. A clean forced build now completes with a 1,568-page PDF and no undefined-citation or BibTeX duplicate-entry diagnostics. Clinical publication still requires specialist sign-off and periodic guideline review.

Implementation note: this file preserves the original issue register for traceability; the “required action” text below describes the audit baseline, while the source files contain the implemented corrections.

The highest-priority blockers are:

1. `chapters/appendix_b_critical_values.tex` presents institution-dependent laboratory thresholds as universal values and tells readers to go to the emergency department based on isolated results. It also states that critical-value notification is legally required, which is jurisdiction- and accreditation-dependent. This appendix needs a complete clinical rewrite before use.
2. `chapters/test_acetaminophen_level.tex` uses the 200-line Rumack–Matthew threshold as the treatment trigger. US/Canadian practice uses the revised 150-line treatment threshold; the 200-line is not the current treatment line in that setting.
3. `chapters/appendix_e_algorithms.tex` starts its sepsis pathway with qSOFA screening. qSOFA is not sufficiently sensitive to be used as the sole sepsis screening strategy.
4. `chapters/test_gonorrhea.tex` gives incorrect or overbroad test-of-cure timing and indications. Current CDC guidance recommends test of cure for pharyngeal gonorrhea at 7–14 days, while routine test of cure is not recommended for uncomplicated urogenital or rectal infection treated with recommended therapy.
5. `chapters/test_antineutrophil_cytoplasmic_antibodies.tex` describes the superseded IIF-first ANCA algorithm as the international recommendation and overstates the ability of a positive ANCA to replace biopsy.
6. Tumor-marker and reference-range chapters frequently use fixed cutoffs, “diagnostic” language, and method-specific performance figures without consistently identifying assay, laboratory, population, or guideline context.

These findings do not mean every statement in every chapter is wrong. They mean the book currently mixes careful caveats with confident, patient-facing directives that are unsafe when detached from local laboratory policy and clinical context.

## Severity definitions

- **Critical:** could plausibly cause immediate patient harm, delay emergency treatment, or direct inappropriate treatment.
- **Major:** clinically important error, outdated algorithm, or omission likely to alter diagnosis or management.
- **Moderate:** material limitation, unsupported precision, or incomplete context requiring correction before publication.
- **Minor:** terminology, citation, consistency, or editorial issue that does not usually change care.

## Detailed findings

| ID | Severity | Location | Finding and required action |
|---|---|---|---|
| F-01 | Critical | `chapters/appendix_b_critical_values.tex:7-10` | The appendix says a critical value is always an immediate life-threatening emergency, says laboratories are legally required to notify the doctor, and instructs readers to go to the ER based on a listed value. Critical limits are established by the laboratory/institution and may vary by method, population, setting, and accreditation or jurisdiction. Replace the patient-facing universal table with a clinician-facing explanation: verify the result and specimen integrity, follow local notification policy, assess symptoms and context, and provide explicit emergency advice only for selected scenarios. |
| F-02 | Critical | `chapters/appendix_b_critical_values.tex:218-227` | Troponin `>10.0 ng/mL` is described as “almost certainly a major heart attack” requiring catheterization. Troponin assays have different units, upper reference limits, and high-sensitivity methods; an isolated concentration does not diagnose MI or mandate catheterization. Rewrite around myocardial injury, serial change, ischemic symptoms/ECG, and an institution-specific assay URL or reference. |
| F-03 | Critical | `chapters/appendix_b_critical_values.tex:291-303` | Fixed blood-gas cutoffs are treated as universal, and pH `<7.10` is called “incompatible with life.” Survival is possible at very low pH, while urgency depends on cause, chronicity, specimen type, oxygen status, and clinical state. Remove universal ER instructions and use context-dependent interpretation. |
| F-04 | Critical | `chapters/appendix_b_critical_values.tex:156-163,172-189,198-209,232-259` | BUN, creatinine, hemoglobin, WBC, INR, fibrinogen, toxicology, and carboxyhemoglobin thresholds are presented as universal critical values with treatment conclusions. Several are not standard universal critical limits; some actions depend on symptoms, medication, bleeding, pregnancy, serial change, or local protocol. Reclassify this material as illustrative examples only, add source and unit/method notes, and remove direct treatment commands. |
| F-05 | Critical | `chapters/test_acetaminophen_level.tex:7,30-34` | The chapter calls 200 mcg/mL at 4 hours the line that mandates NAC. The revised US/Canadian treatment line begins at 150 mcg/mL at 4 hours. Keep the historical 200-line only if explicitly labeled historical/probable-risk, and state the applicable treatment line and regional protocol. See [JAMA Network Open consensus statement](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2808062), [FDA labeling](https://www.dailymed.nlm.nih.gov/dailymed/fdaDrugXsl.cfm?setid=1c8fef8f-2ff5-4bea-bccb-90c2c8544c21&type=display), and [Rumack–Matthew evidence summary](https://pubmed.ncbi.nlm.nih.gov/26567585/). |
| F-06 | Major | `chapters/appendix_e_algorithms.tex:300-315` | qSOFA is presented as Step 1 for sepsis recognition. Current consensus says qSOFA should not be used as the sole screening strategy because sensitivity is inadequate. Replace with clinical assessment plus local screening systems, while retaining qSOFA only as a risk-stratification prompt. See the [Surviving Sepsis Campaign guideline](https://www.idsociety.org/practice-guideline/surviving-sepsis-campaign-adult-guidelines-2021) and [ACEP/IDSA task-force report](https://www.idsociety.org/globalassets/idsa/practice-guidelines/2021-idsa-acep-sepsis-report.pdf). |
| F-07 | Major | `chapters/test_gonorrhea.tex:34,37,43,68` | The chapter says test of cure is preferably 2–3 weeks after treatment and lists pregnancy, PID, and DGI broadly as indications. CDC recommends test of cure for pharyngeal gonorrhea at 7–14 days; it is not routine for uncomplicated urogenital or rectal infection treated with recommended therapy. Correct the timing and make special indications explicit and source-based. See the [CDC gonorrhea guideline](https://www.cdc.gov/std/treatment-guidelines/gonorrhea-adults.htm). |
| F-08 | Major | `chapters/test_chlamydia.tex:34,37,68` | The preparation section advises deferring testing for three weeks after any antibiotic therapy. This is not a general diagnostic requirement. The four-week restriction applies to NAAT test of cure when indicated because residual nucleic acid can persist; routine test of cure is not recommended for most nonpregnant patients. Separate diagnostic testing, test of cure, and retesting for reinfection. See the [CDC chlamydia guideline](https://www.cdc.gov/std/treatment-guidelines/chlamydia.htm). |
| F-09 | Major | `chapters/test_antineutrophil_cytoplasmic_antibodies.tex:4,10,27,36,73-79` | The chapter states that IIF plus ELISA is the international screening recommendation and says a positive ANCA often obviates invasive procedures. The 2017 international consensus prefers high-quality PR3/MPO antigen-specific immunoassays as the primary screen, with IIF or another assay in selected negative/low-positive cases; a positive result contributes to diagnosis but is not diagnostic by itself. Update the algorithm and biopsy language. See the [2017 revised international consensus](https://www.nature.com/articles/nrrheum.2017.140). |
| F-10 | Major | `chapters/test_alpha_fetoprotein.tex:56-62` and `chapters/test_alpha_fetoprotein_tumor_marker.tex:56-62` | AFP `>400 ng/mL` with a mass is described as diagnostic under older AASLD guidance, while the current text also acknowledges de-emphasis. This contradiction should be resolved: AFP is not sufficient by itself for HCC diagnosis; current diagnosis relies on appropriate multiphasic imaging/LI-RADS or pathology in the applicable population. Keep AFP as surveillance/risk/prognostic context and label historical cutoffs explicitly. See the [AASLD HCC guidance](https://www.aasld.org/sites/default/files/2022-06/AASLD_2018_HCC_Guidance_on_Diagnosis_Staging_and_Management_hep_29913.pdf). |
| F-11 | Major | `chapters/test_prostate_specific_antigen.tex:22,61` | PSA velocity is included as a risk-stratification concept with fixed annual thresholds. This needs current guideline qualification: velocity should not be used as a stand-alone indication for biopsy, and screening decisions depend on age, shared decision-making, repeat PSA, DRE, risk calculators, MRI, and other factors. Remove fixed “younger men” thresholds unless tied to a named current guideline and assay context. |
| F-12 | Major | `chapters/test_hiv_viral_load.tex:48-50` | The statement that a negative HIV-1 RNA after a reactive fourth-generation screen and negative/indeterminate differentiation assay means the initial screen is a false positive is too categorical. HIV-2 and very early infection require the full diagnostic algorithm and clinical context. Rewrite to say that a negative HIV-1 NAT generally resolves the algorithm as no HIV-1 infection, while HIV-2/acute infection must be considered when clinically indicated. |
| F-13 | Major | `chapters/test_gonorrhea.tex:22,43,56` | Expedited partner therapy is described as a universal cefixime dispensing action. EPT depends on jurisdiction, partner circumstances, allergy/pregnancy considerations, and current public-health guidance. Qualify the statement and direct clinicians to local legal and public-health protocols. |
| F-14 | Moderate | `chapters/appendix_a_reference_ranges.tex` | Reference ranges are presented as general “normal” ranges without a citation or method/laboratory qualifier. Add source and population for each range, use a compact “illustrative only” warning, and direct readers to the reporting laboratory. Do not use these tables as universal decision thresholds. |
| F-15 | Moderate | `chapters/appendix_d_test_codes.tex` | LOINC and CPT codes are inherently versioned and payer/context dependent, but the appendix has no visible version date or source. Add code-system version/date, source links, and a warning that CPT is US-specific and billing codes do not uniquely define the laboratory method. |
| F-16 | Moderate | `chapters/appendix_e_algorithms.tex` | The algorithms are largely uncited and contain treatment-like directives. Add a source and update date to every algorithm, identify whether it is an educational schematic or a clinical protocol, and add explicit exclusion criteria for adults/children/pregnancy and unstable patients. |
| F-17 | Moderate | Many `test_*.tex` files | Exact sensitivity, specificity, specimen stability, turnaround time, storage temperature, tube type, and vendor platform claims are stated as universal. These are assay- and laboratory-dependent. Replace unsupported precision with “varies by assay/laboratory” unless a current manufacturer insert, CLSI document, or peer-reviewed validation is cited. |
| F-18 | Moderate | `chapters/test_17_hydroxyprogesterone.tex`, `chapters/test_calcitonin.tex`, `chapters/test_lactate.tex`, and related specimen-handling chapters | Several chapters give highly specific collection, temperature, timing, and stimulation protocols. These must be checked against the local assay’s specimen requirements; a generic book should not present one laboratory protocol as universal. Add method-specific caveats and distinguish routine from specialized testing. |
| F-19 | Minor | `medical_tests.tex`, `README.md`, `Makefile` | Documentation is inconsistent: README and Makefile refer to `tests_chapters/`, while the actual directory and master file use `chapters/`. README claims 235 tests, while the repository contains 234 test chapters plus seven special chapters. Correct paths, counts, and build dependencies. |
| F-20 | Minor | All test chapters | The actual heading is `Is This a Primary or Secondary Test`, while README describes `Primary vs Secondary Test`. Standardize the heading and README description. |
| F-21 | Minor | `references.bib` and test chapter bibliographies | Six bibliography entries appear uncited: `baglin2006guidelines`, `meriggioli2009autoimmune`, `scully2012guidelines`, `winter2006phenytoin`, `wong2015update`, and `zheng2008pathogenesis`. Either cite them where relevant or remove them. |
| F-22 | Minor | `medical_tests.log` | The existing build log contains extensive overfull/underfull box warnings and hyperref PDF-string warnings. These do not necessarily change clinical meaning but require a typesetting pass before release, especially for tables, long URLs, chemical units, and long unbreakable strings. |
| F-23 | Major | `references.bib:803,5479` and `chapters/test_alcohol_use_screening.blg`, `chapters/test_human_papillomavirus.blg` | A clean `latexmk` run fails because the bibliography defines `uspstf2018screening` twice. Remove or rename the duplicate key, then rebuild all chapter bibliographies. The failed run also produced a natbib undefined-citations warning in `medical_tests.log`; this must be rechecked after the duplicate is fixed. |

## Chapter coverage register

### Structural coverage

- `test_*.tex`: 234/234 included by `medical_tests.tex`.
- Introduction: 1/1 included.
- Appendices: 6/6 included.
- Total included chapter files: 241/241.
- Test chapters with the expected repeated sections: 234/234 for the core headings.
- Cited bibliography keys resolving in `references.bib`: 784/784.
- Uncited bibliography records: 6.

The repeated template is highly consistent: test chapters generally contain 15 section headings, one bibliography declaration, and a references section. That consistency is useful, but it also propagates the same risk across the book: fixed ranges and method details can appear authoritative even where they are laboratory-specific.

### Accuracy-review disposition

All 234 test chapters and seven non-test chapters were included in the repository-wide structural and red-flag pass. The detailed findings above identify chapters requiring correction based on direct claim review and current-source verification. Chapters without a named finding should not be treated as clinically approved; they require a second, domain-specialist sign-off before publication, particularly for medication levels, pregnancy/newborn testing, infectious diseases, genetics, oncology, and critical-care material.

## Repository and build checks

The master file includes every existing chapter, but the Makefile dependency list is stale:

```make
$(TEX).pdf: $(TEX).tex $(wildcard tests_chapters/*.tex) $(BIB)
```

It should watch `chapters/*.tex`. The README should also use `chapters/` consistently. A clean build should be rerun after that documentation/build fix, followed by bibliography processing and a final pass over unresolved references and layout warnings.

## Recommended remediation order

1. Remove or quarantine Appendix B until its thresholds and patient instructions are rewritten by a laboratory medicine and emergency medicine reviewer.
2. Correct acetaminophen, gonorrhea, chlamydia, sepsis, ANCA, HIV diagnostic, and AFP guidance.
3. Audit every fixed cutoff and “gold standard/diagnostic/always/never” statement against a current source.
4. Add source/date/method qualifiers to ranges, codes, specimen requirements, and algorithms.
5. Correct Makefile/README drift, rebuild cleanly, and resolve material LaTeX warnings.
6. Obtain domain-specialist sign-off before clinical distribution; this report is an editorial/technical audit, not medical certification.

## Key external references

- [CDC Chlamydial Infections STI Treatment Guidelines](https://www.cdc.gov/std/treatment-guidelines/chlamydia.htm)
- [CDC Gonococcal Infections STI Treatment Guidelines](https://www.cdc.gov/std/treatment-guidelines/gonorrhea-adults.htm)
- [Surviving Sepsis Campaign 2021 guideline](https://www.idsociety.org/practice-guideline/surviving-sepsis-campaign-adult-guidelines-2021)
- [ACEP/IDSA early sepsis task-force report](https://www.idsociety.org/globalassets/idsa/practice-guidelines/2021-idsa-acep-sepsis-report.pdf)
- [Revised 2017 international ANCA consensus](https://www.nature.com/articles/nrrheum.2017.140)
- [Management of Acetaminophen Poisoning in the US and Canada](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2808062)
- [FDA acetaminophen labeling](https://www.dailymed.nlm.nih.gov/dailymed/fdaDrugXsl.cfm?setid=1c8fef8f-2ff5-4bea-bccb-90c2c8544c21&type=display)
- [AASLD HCC practice guidance](https://www.aasld.org/sites/default/files/2022-06/AASLD_2018_HCC_Guidance_on_Diagnosis_Staging_and_Management_hep_29913.pdf)
