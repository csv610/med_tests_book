# Common Medical Tests: A Comprehensive Reference

A reference work covering the ordering, performance, and interpretation of laboratory medicine, diagnostic imaging, and clinical procedures — organized alphabetically by test name and typeset entirely in LaTeX.

## Overview

Modern clinical practice relies on diagnostic testing. *Common Medical Tests: A Comprehensive Reference* bridges the gap between test ordering and result interpretation. It covers **234 individual medical tests**, from routine chemistry panels and complete blood counts to genetic assays, therapeutic drug monitoring, microbiology cultures, and point-of-care testing.

Each test is presented in a standardized 15-section format:

| Section | Description |
|---|---|
| What Is This Test? | Definition and clinical purpose |
| Alternative Names | Synonyms and LOINC-style aliases |
| Principle | Analytical method and biological basis |
| History | Historical development and landmark studies |
| Why This Test Is Ordered | Indications and clinical scenarios |
| Primary vs Secondary Test | Role in the diagnostic workup |
| How This Test Is Performed | Specimen, collection, and method |
| What Preparation Is Needed | Fasting, medications, and patient prep |
| Contraindications and Precautions | Safety and interpretive caveats |
| Understanding Results | Below / above normal interpretation, normal ranges, follow-up tests |

Each entry closes with peer-reviewed references.

## Repository Structure

```
├── medical_tests.tex                 # Master file (book class, packages, frontmatter)
├── chapters/
│   ├── chapter01_introduction.tex    # Foundational concepts and how to use the book
│   ├── test_*.tex                    # 234 alphabetized test chapters
│   └── appendix_*.tex                # 6 reference appendices
└── .gitignore                        # Excludes LaTeX build artifacts
```

### Appendices

- **A** – Reference Ranges
- **B** – Critical Values
- **C** – Test Interference
- **D** – Test Codes
- **E** – Diagnostic Algorithms
- **F** – Quality Control

## Requirements

- A working LaTeX distribution (TeX Live, MacTeX, or MiKTeX)
- Standard packages: `booktabs`, `longtable`, `multirow`, `array`, `amsmath`, `amssymb`, `xcolor`, `hyperref`, `enumitem`, `caption`, `makeidx`, `tocloft`

## Building

Compile the book with `pdflatex`, running it multiple times to resolve the table of contents and index:

```sh
pdflatex medical_tests.tex
pdflatex medical_tests.tex
makeindex medical_tests
pdflatex medical_tests.tex
```

On macOS with MacTeX:

```sh
latexmk -pdf medical_tests.tex
```

The compiled output is written to `medical_tests.pdf`.

## Adding a New Test

1. Create `chapters/test_<name>.tex` following the standardized section format used by existing chapters.
2. Add a corresponding `\include{chapters/test_<name>}` line in the alphabetical position within `medical_tests.tex`.
3. Rebuild the document as described above.

## Disclaimer

This book is for educational and reference purposes only. It is not a substitute for professional medical judgment, institutional protocols, or the clinical context of a specific patient. Reference ranges and critical values vary by laboratory and methodology.

## License

All rights reserved. © 2025 Medical Reference Team.
