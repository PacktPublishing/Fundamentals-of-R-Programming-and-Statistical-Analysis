setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 3/Video 3.3")
#=======================================================
# examples 
#=======================================================
# Load the expression data to plot
GEdata1 <- readRDS("exampleGEmatrix.rds")
mat1 <- as.matrix(GEdata1)
head(mat1)

#--------------------------------
# Using the heatmap() function in the base stats package
#--------------------------------
heatmap(mat1)
heatmap(mat1, col = cm.colors(256))
heatmap(mat1, col = cm.colors(256), scale="row")
heatmap(mat1, col = cm.colors(256), scale="column")

# Customizing hclust and distance measures
corrdist = function(x) as.dist(1-cor(t(x), method="pearson"))
hclust.avl = function(x) hclust(x, method="ward.D2")

heatmap(mat1, col = cm.colors(256), scale="row", hclustfun=hclust.avl, distfun=corrdist)

# Adding ColSideColors by group
group <- c(rep("A", 3), rep("B", 2))
grp <- factor(group)
pal <- c("navy", "purple") 
heatmap(mat1, col = cm.colors(256), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# No clustering by column
heatmap(mat1, Colv=NA, col = cm.colors(256), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)
#--------------------------------
# Using the heatmap.2() function in the gplots function
#--------------------------------
library("gplots")

# trace default shows the distance of the line with 
# from the center of each color-cell is proportional 
# to the size of the measurement
heatmap.2(mat1, col = cm.colors(256), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# removing the trace
heatmap.2(mat1, trace="none", col = cm.colors(256), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# using available gplots color palettes
heatmap.2(mat1, trace="none", col = redblue(256), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# changing the color scheme
heatmap.2(mat1, trace="none", col = rev(redblue(256)), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# using the redgreen color sceme 
heatmap.2(mat1, trace="none", col = rev(redgreen(256)), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)

# saving the heatmap.2 results for downstream analysis
hm <- heatmap.2(mat1, trace="none", col = rev(redblue(256)), scale="row", ColSideColors=pal[grp], hclustfun=hclust.avl, distfun=corrdist)
names(hm)
head(hm$rowInd)

# Create a matrix ordered as in the heatmap 
mat1heatmap <- mat1[rev(hm$rowInd), hm$colInd]
head(mat1heatmap)

#--------------------------------
# Using the Heatmap() function part of the ComplexHeatmap package
#--------------------------------
library("ComplexHeatmap")
Heatmap(mat1)

# To change the legend annotation
Heatmap(mat1, heatmap_legend_param = list(title = ""))

# To change clustering method for rows and/or columns
Heatmap(mat1, clustering_distance_rows="spearman", clustering_method_rows="ward.D2", heatmap_legend_param = list(title = ""))
Heatmap(mat1, clustering_distance_columns="pearson", clustering_method_columns="complete", heatmap_legend_param = list(title = ""))
Heatmap(mat1, clustering_distance_rows="spearman", clustering_method_rows="ward.D2", clustering_distance_columns="pearson", clustering_method_columns="complete", heatmap_legend_param = list(title = ""))

# To plot a heatmap of scales the values
mat <- t(scale(t(mat1)))
Heatmap(mat, clustering_distance_columns="pearson", clustering_method_columns="complete", heatmap_legend_param = list(title = ""))
 
# Changing color palette with colorRamp2() from circlize package
library("circlize")
# you can also specify the color space
f2 = colorRamp2(seq(min(mat), max(mat), length = 3), c("green4", "#EEEEEE", "red"), space = "LAB")
Heatmap(mat, col=f2, clustering_distance_columns="pearson", clustering_method_columns="complete", heatmap_legend_param = list(title = ""))

# changing the color space to sRGB
f2 = colorRamp2(seq(min(mat), max(mat), length = 3), c("green4", "#EEEEEE", "red"), space = "sRGB")
Heatmap(mat, col=f2, clustering_distance_columns="pearson", clustering_method_columns="complete", heatmap_legend_param = list(title = ""))

# You can use your heatmap.2() dendrograms directly as follows:
Heatmap(mat, col=f2, cluster_columns = hm$colDendrogram, heatmap_legend_param = list(title = ""))

# You can add annotations (or ColSideColors) as follows:
ha = HeatmapAnnotation(annotation_legend_param = list(grp = list(title = "")), 
	df=as.data.frame(grp), col=list(grp=c("A"="black", "B"="purple")))

Heatmap(mat, top_annotation = ha, col=f2, cluster_columns = hm$colDendrogram, heatmap_legend_param = list(title = ""))

# Removing the column clustering with cluster_columns = FALSE
Heatmap(mat, top_annotation = ha, col=f2, cluster_columns = FALSE, heatmap_legend_param = list(title = ""))

# You can modify your dendrogram attributes with the dendextend functions
library("dendextend")

# To color the dendrogram clusters
dend = hm$colDendrogram
dend = color_branches(dend, k = 2)
Heatmap(mat, top_annotation = ha, col=f2, cluster_columns = dend, heatmap_legend_param = list(title = ""))

# To increase the width of the dendrogram lines as follows
dend = hm$colDendrogram
dend13 <- as.dendrogram(dend) %>% set("branches_lwd", 3) ###  %>% set("branches_lwd", 3)
dend = color_branches(dend13, k = 2) 
Heatmap(mat, top_annotation = ha, col=f2, cluster_columns = dend, heatmap_legend_param = list(title = ""))

# For more examples see https://github.com/jokergoo/ComplexHeatmap
# or https://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html


