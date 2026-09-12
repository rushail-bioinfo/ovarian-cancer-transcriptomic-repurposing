Ovarian Cancer Transcriptomic Repurposing

Analysis code for a gene-expression signature-reversal drug repurposing study in ovarian cancer. This repository accompanies the preprint "Transcriptomic Signature Reversal Identifies R-547 as a Candidate for Drug Repurposing in Ovarian Cancer" (bioRxiv, 2026).

Summary

Differential gene expression signatures were built from two independent public ovarian cancer datasets (GSE36668, GSE14407), cross-validated against each other, and confirmed with a Random Forest classifier. The resulting signature (134 up-regulated, 124 down-regulated genes) was queried against the LINCS L1000 drug perturbation database via L2S2 to identify compounds predicted to reverse the cancer signature. Palbociclib was recovered as a positive control (known, if subtype-dependent, clinical activity in ovarian cancer); R-547 emerged as the top-ranked, most reproducible hit with no prior dedicated ovarian cancer research.

Data
GSE36668 — primary discovery cohort (8 samples: 4 ovarian carcinoma, 4 normal ovarian surface epithelium)
GSE14407 — independent validation cohort (24 samples: 12 ovarian adenocarcinoma, 12 normal ovarian surface epithelium)

Both datasets were parsed manually from raw series matrix files (see geo_downloads/) due to a parser-version incompatibility with the standard GEOquery workflow.

Scripts (run order)
Script	Description
01_data_pull.R	Downloads and parses raw GEO series matrix files; assigns sample group labels from characteristics fields
03_validation_DE_analysis.R	Differential expression analysis (limma) on GSE36668 and GSE14407; log2 transformation, significance filtering (adjusted p < 0.05, |log2FC| ≥ 1)
Random Forest cross-check	Trains a 500-tree Random Forest classifier on the top 2,000 most variable genes from GSE36668; compares gene importance ranking to limma results — output saved in rf_model_GSE36668.rds

(Note: a 02_ script is not part of this pipeline — see commit history for details.)

Key output files
final_signature.rds — the final 134 up / 124 down gene signature used for the L2S2 query
group_validation_GSE14407.rds — validation cohort DE results
rf_model_GSE36668.rds — trained Random Forest model and importance scores
results/ — summary tables and figures generated from the above
Not included in this repository

Molecular docking (SwissDock, CB-Dock2) was performed via web-based platforms rather than local scripts; docking inputs/outputs are described in the manuscript's Methods and Results sections (2.7, 3.6).

Citation

If you use this code or signature, please cite the associated preprint (bioRxiv, 2026; DOI to be added upon posting).

Contact

Rushail Nazish — ORCID: 0009-0002-5397-0708
