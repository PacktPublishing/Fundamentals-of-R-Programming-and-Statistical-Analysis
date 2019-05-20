setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 3/Video 3.4")
#=======================================================
# examples 
#=======================================================
# Creating networks with igraph
library(igraph)

# To create a network without edges
g <- graph.empty(n=12, directed=FALSE)
plot(g)

# To create a complete network without self edges
g <- graph.full(n=12, directed=FALSE, loop=FALSE)
plot(g)

# To plot the nodes as a ring
g<-graph.ring(n=12)
plot(g)

# To plot the nodes arranged as a star
g<-graph.star(n=12, mode="out")
plot(g)

g<-graph.star(n=12, mode="in")
plot(g)

# To graph with defined edges
edges <- c(1,2, 3,2, 2,4, 5,1)
g<-graph(edges, n=max(edges), directed=TRUE)
plot(g)

# Alternatively, you can add edges to an empty graph
g <- graph.empty(5, directed = TRUE)
g <- add.edges(g, edges)
plot(g)

# Change the names of the features and color the nodes
V(g)$name <- c("KLHL7", "LRRC19", "GPR87", "AP1S1", "HAUS4") 

V(g)$color <- "grey"

V(g)[ name == "LRRC19" ]$color <- "red"

# see help page for plot.igraph
plot(g, layout=layout.circle, vertex.color=V(g)$color,

         vertex.label=V(g)$name, vertex.size = 30)
# To learn more about the basics of the igraph package
# see https://users.dimi.uniud.it/~massimo.franceschet/R/igraph.html

#--------------------------------
# Visualizing PPI networks with igraph
#--------------------------------

# Load MAPK interactions from string-db.org
ppi <- read.delim("string_interactions.tsv", header=FALSE, skip=1)
head(ppi)

library("igraph")
gg <- graph.data.frame(ppi)

plot(gg,
  layout = layout.fruchterman.reingold,
  vertex.label = V(gg)$name,
  vertex.label.color= "black",
  edge.arrow.size=0,
  edge.curved=FALSE
)

#--------------------------------
# Using the graph and Rgraphviz libraries
#--------------------------------
# Function modified from http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter11.html
makeproteingraph <- function(mytable)
  {
     # Function to make a graph based on protein-protein interaction data in an input file
     require("graph")
     proteins1 <- mytable$V1
     proteins2 <- mytable$V2
     protnames <- c(levels(proteins1),levels(proteins2))
     # Find out how many pairs of proteins there are
     numpairs <- length(proteins1)
     # Find the unique protein names:
     uniquenames <-  unique(protnames)
     # Make a graph for these proteins with no edges:
     mygraph <- new("graphNEL", nodes = uniquenames)
     # Add edges to the graph:
     # See http://rss.acs.unt.edu/Rdoc/library/graph/doc/graph.pdf for more examples
     weights <- rep(1,numpairs)
     mygraph2 <- addEdge(as.vector(proteins1),as.vector(proteins2),mygraph,weights)
     return(mygraph2)
  }
  
library("graph")  
library("Rgraphviz")
ppiGraph <- makeproteingraph(ppi)
mygraphplot <- layoutGraph(ppiGraph, layoutType="neato")
renderGraph(mygraphplot)

