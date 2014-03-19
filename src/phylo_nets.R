###Phylogenetic networks
###Initiated 27Nov2013
###Data from Bowker via Hillary

###Running an overall dependency network and co-occurrence analysis ignoring treatments

dat <- read.csv('../data/dome_rounded.csv')
env <- dat[,1:5]
com <- dat[,-1:-5]
com[com!=0] <- 1
library(sna)
source('~/projects/dissertation/projects/lichen_coo/src/seenetR.R')
source('~/projects/dissertation/projects/lichen_coo/src/helper_funcs.R')
all.dn <- dep.net(com)
all.cn <- co.net(com)
us.dn <- dep.net(com[env$TRT=='Unseeded'])
hb.dn <- dep.net(com[env$TRT=='Unseeded'&env$RevBI=='High',])
mb.dn <- dep.net(com[env$TRT=='Unseeded'&env$RevBI=='Mod',])
#####
#####
par(mfrow=c(1,2))
coord=gplot(abs(hb.dn),displaylabels=TRUE,label.cex=0.5)
gplot(abs(mb.dn),displaylabels=TRUE,coord=coord,,label.cex=0.5)
gplot(abs(mb.dn),displaylabels=TRUE,coord=coord,,label.cex=0.5,gmode='graph',
      vertex.cex=0.5,vertex.col='violet',vertex.border='violet',edge.col='lightblue')
title(main='Moderate Burn (Unseeded)')
gplot(abs(hb.dn),displaylabels=TRUE,label.cex=0.5,coord=coord,gmode='graph',
      vertex.cex=0.5,vertex.col='violet',vertex.border='violet',edge.col='lightblue')
title(main='High Burn (Unseeded)')

par(mfrow=c(1,2))
heatmap(mb.dn[apply(abs(mb.dn),1,sum)!=0,apply(abs(mb.dn),2,sum)!=0])
title(main='Moderate Burn (Unseeded)')

heatmap(hb.dn[apply(abs(hb.dn),1,sum)!=0,apply(abs(hb.dn),2,sum)!=0])
title(main='High Burn (Unseeded)')
