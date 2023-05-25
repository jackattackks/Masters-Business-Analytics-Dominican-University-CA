clusterdata <-cluster_rp

d<-dist(clusterdata,method = "euclidean")
fit<-hclust(d,method = "ward.D")
plot(fit)

groups<-cutree(fit,k=4)
rect.hclust(fit,k=4,border="blue")


fit<-kmeans(clusterdata,4)
aggregate(clusterdata,by=list(fit$cluster),FUN = mean)
clusterdata<-data.frame(clusterdata,fit$cluster)
#make sure to normalize if the weights are different
#hierarchal cluster analysis
#dendogram
#k means cluster analysis

#this adds a column of the cluster fit
clusterdata<-data.frame(clusterdata,fit$cluster)
str(clusterdata)

library(cluster)
clusplot(clusterdata,fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

install.packages("writexl")

library("writexl")
write_xlsx(clusterdata,"c:\\Users\\Jackie\\Desktop\\NAME.xlsx")
#NEED TO IMPORT FILE 

totaldata<-merge(NAME,discri_rp)
str(totaldata)

