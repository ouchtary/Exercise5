##You will have to install the following libraries.
library(AnnotationDbi)
library(piano)
library(GO.db)
library(org.At.tair.db)


GO=toTable(org.At.tairGO)
GO_data_frame = data.frame(GO$go_id, GO$Evidence,GO$gene_id);

GO_ALLFrame = GOAllFrame(GOFrame(GO_data_frame, organism = 'Arabidopsis thaliana'))

go_df<- GO_ALLFrame@data
go_df<-go_df[,c(3,1)]
gsc_piano<- loadGSC(go_df)
##save the gene set collection gsc
save(gsc_piano, file="gene_set_collection.RData")
