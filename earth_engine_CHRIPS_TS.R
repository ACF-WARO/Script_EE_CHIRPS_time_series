### Code pour les séries temporelles CHIRPS

## Charger les librairies nécessaires (il faut les installer si cela n'est pas encore fait, avec install.packages(''))
#install.packages('plyr')    

library('ggplot2')
library('plyr')

######
## Lecture des données (Chemin à changer)
######

data=read.table(file = "C://Users/Malcorps/Documents/ACF/Earth_engine/CHIRPS/CHIRPS_Saint_Louis.csv", sep=',',dec=',', header=T)
head(data) # pour voir les 6 premières lignes de la base de données

data$year=rep(c(1981:2018),each=12)

colnames(data)=c('Date','Rain','Year')
data$Rain=as.numeric(as.character(data$Rain))

cum_year=ddply(data, .(Year), summarize,
               sum = sum(Rain))

ggplot(cum_year, aes(x=Year,y=sum*30))+geom_bar(stat='identity', position=position_dodge())+theme_bw()+
  scale_fill_manual(values=c('orange','grey'))+xlab('')+ylab('Précipitation [mm]')
