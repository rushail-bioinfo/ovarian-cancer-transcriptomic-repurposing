library(GEOquery)

gse_primary <- getGEO("GSE18520", GSEMatrix = TRUE)
gse_primary <- gse_primary[[1]]

gse_validation <- getGEO("GSE14407", GSEMatrix = TRUE)
gse_validation <- gse_validation[[1]]

table(pData(gse_primary)$characteristics_ch1)
table(pData(gse_validation)$characteristics_ch1)

dim(exprs(gse_primary))
dim(exprs(gse_validation))

