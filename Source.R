

# Prerequisites
library(devtools)
#Uncomment and use them once to install dependencies
#devtools::install_github("Yard1/linearOrdering") #To install package with linearOrdering algorithm
#devtools::install_github("vqv/ggbiplot") #Run to install package with ggbiplot

# Load packages :
require(readxl)
require(dplyr)
require(xlsx)
library(devtools)
require(ggbiplot)
require(linearOrdering)
require(caret)
require(cluster)
require(clusterSim)
require(ClusterR)
require(ggplot2)
require(reshape2)
require(gridExtra)
require(moments)
require(robustHD)
require(topsis)
require(xtable)
require(factoextra)
require(FactoMineR)
require(corrplot)
require(rworldmap)
require(maps)
require(RColorBrewer)

# Load data
df <- read.xlsx2("Data.xlsx", sheetIndex = 1, row.names = 1)
df[] <- lapply(df, function(x) as.numeric(as.character(x)))
glimpse(df)

# Map of analysed countries
theCountries <- data.frame("country" = c("BEL", #Belgia
                                         "BGR", #Bulgaria
                                         "CZE", #Czechia
                                         "Denmark", #Denmark
                                         "DEU", #Germany
                                         "EST", #Estonia
                                         "IRL", #Ireland
                                         "GRC", #Greece
                                         "ESP", #Spain
                                         "FRA", #France
                                         "HRV", #Croatia
                                         "ITA", #Italy
                                         "CYP", #Cyprus
                                         "LVA", #Latvia
                                         "LTU", #Lithuania
                                         "LUX", #Luxembourg
                                         "HUN", #Hungary
                                         "MLT", #Malta
                                         "NLD", #Netherlands
                                         "AUT", #Austria
                                         "POL", #Poland
                                         "PRT", #Portugal
                                         "ROU", #Romania
                                         "SVN", #Slovenia
                                         "SVK", #Slovakia
                                         "FIN", #Finland
                                         "SWE", #Sweden
                                         "GBR" #Great Britain
))

spdf <- joinCountryData2Map(theCountries, joinCode="NAME", nameJoinColumn="country")
country_coord<-data.frame(coordinates(spdf),stringsAsFactors=F)

kraje_coords <- c("Belgium",
                  "Bulgaria",
                  "Czech Republic",
                  "Denmark",
                  "Germany",
                  "Estonia",
                  "Ireland",
                  "Greece" ,
                  "Spain" ,
                  "France",
                  "Croatia",
                  "Italy",
                  "Cyprus",
                  "Latvia",
                  "Lithuania",
                  "Luxembourg",
                  "Hungary",
                  "Malta",
                  "Netherlands",
                  "Austria",
                  "Poland",
                  "Portugal",
                  "Romania",
                  "Slovenia",
                  "Slovakia",
                  "Finland",
                  "Sweden",
                  "United Kingdom")

country_coord = country_coord[kraje_coords,]

colourPalette <- rep("Red", 28)

mapCountryData(spdf,
               nameColumnToPlot="country",
               catMethod="categorical",
               mapRegion = "Europe",
               addLegend = F,
               missingCountryCol = gray(.8),
               mapTitle = "Map of countries",
               colourPalette = colourPalette)
text(x=country_coord$X1,y=country_coord$X2,labels=row.names(country_coord), cex = 0.6, font = 2)

# Boxplot of raw data
ggplot(stack(df), aes(x = ind, y = values)) +
  coord_flip() +
  geom_boxplot() +
  scale_y_discrete() +
  ylab("") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#hlty_total
a1 <- ggplot(df, aes(x = hlty_total)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hlty_total") + 
  ylab("")
b1 <- ggplot(df, aes(x = hlty_total)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hlty_total") +
  ylab("")

#df$hlte_sph_total
a2 <- ggplot(df, aes(x = hlte_sph_total)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hlte_sph_total") + 
  ylab("")
b2 <- ggplot(df, aes(x = hlte_sph_total)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hlte_sph_total") +
  ylab("")

#df$sph_total
a3 <- ggplot(df, aes(x = sph_total)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("sph_total") + 
  ylab("")
b3 <- ggplot(df, aes(x = sph_total)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("sph_total") +
  ylab("")

#df$hbds_number
a4 <- ggplot(df, aes(x = hbds_number)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hbds_number") + 
  ylab("")
b4 <- ggplot(df, aes(x = hbds_number)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hbds_number") +
  ylab("")

#df$hlt_graduates
a5 <- ggplot(df, aes(x = hlt_graduates)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hlt_graduates") + 
  ylab("")
b5 <- ggplot(df, aes(x = hlt_graduates)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hlt_graduates") +
  ylab("")

#df$hlt_per_exp_ncp
a6 <- ggplot(df, aes(x = hlt_per_exp_ncp)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hlt_per_exp_ncp") + 
  ylab("")
b6 <- ggplot(df, aes(x = hlt_per_exp_ncp)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hlt_per_exp_ncp") +
  ylab("")

#df$acc_at_work
a7 <- ggplot(df, aes(x = acc_at_work)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("acc_at_work") + 
  ylab("")
b7 <- ggplot(df, aes(x = acc_at_work)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("acc_at_work") +
  ylab("")

#df$cds
a8 <- ggplot(df, aes(x = cds)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("cds") + 
  ylab("")
b8 <- ggplot(df, aes(x = cds)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  ggtitle("Histogram") +
  xlab("cds") +
  ylab("")

#df$phy_number
a9 <- ggplot(df, aes(x = phy_number)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("phy_number") + 
  ylab("")
b9 <- ggplot(df, aes(x = phy_number)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("phy_number") +
  ylab("")

#df$cod
a10 <- ggplot(df, aes(x = cod)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("cod") + 
  ylab("")
b10 <- ggplot(df, aes(x = cod)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("cod") +
  ylab("")

#df$unm_needs
a11 <- ggplot(df, aes(x = unm_needs)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("unm_needs") + 
  ylab("")
b11 <- ggplot(df, aes(x = unm_needs)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("unm_needs") +
  ylab("")

#df$hlt_care_exp
a12 <- ggplot(df, aes(x = hlt_care_exp)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("hlt_care_exp") + 
  ylab("")
b12 <- ggplot(df, aes(x = hlt_care_exp)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("hlt_care_exp") +
  ylab("")

#df$lng_stnd_illness
a13 <- ggplot(df, aes(x = lng_stnd_illness)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("lng_stnd_illness") + 
  ylab("")
b13 <- ggplot(df, aes(x = lng_stnd_illness)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("lng_stnd_illness") +
  ylab("")

#df$splong_lim
a14 <- ggplot(df, aes(x = splong_lim)) +
  geom_boxplot() + 
  scale_y_discrete() +
  xlab("splong_lim") + 
  ylab("")
b14 <- ggplot(df, aes(x = splong_lim)) +
  geom_histogram(aes(y = stat(density)), stat = "bin", bins = ceiling(0.75 * sqrt(28)), color="darkblue", fill="lightblue") +
  geom_density(colour="red") +
  xlab("splong_lim") +
  ylab("")

plist_b <- list(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14)
plist_p <- list(b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14)

# Histograms of density of raw data
do.call(grid.arrange, plist_p)

# Chosen variables compared with UE mean :
# - hlty_total - mean is 63.6 (years) (2018)(EU 2013-2020)(28),
# - sph_total - mean is 22.1 (percent) (2018) (EU 2013-2020)(28),
# - lng_stnd_illness - mean is 36.8 (percent) (2018) (EU 2013-2020)(28),
# - cds - mean is 6.7 (percent) (2014) (EU 2013-2020)(28).

df_mean <- df %>% add_row(hlty_total = 63.6, sph_total = 22.1, cds = 6.7, lng_stnd_illness = 36.8, .after = 28)
rownames(df_mean)[29] <- "UE mean"

#hlty_total
ggplot(data = df_mean, aes(x = reorder(rownames(df_mean), hlty_total), y = hlty_total,
                           fill = ifelse(rownames(df_mean) == "UE mean", "Highlighted", "Normal"))) +
  geom_bar(stat = "identity") +
  coord_flip() +
  xlab("Countries") +
  scale_y_continuous(breaks=seq(0, 80, by = 10), limits=c(0, 80)) +
  ylab("Years") +
  guides(fill = "none") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  geom_text(aes(label = hlty_total), size = 3.2, position = position_dodge(width = 0.9), vjust = 0.5) 

#sph_total
ggplot(data = df_mean, aes(x = reorder(rownames(df_mean), sph_total), y = sph_total,
                           fill = ifelse(rownames(df_mean) == "UE mean", "Highlighted", "Normal"))) +
  coord_flip() +
  geom_bar(stat = "identity", position = "dodge") +
  xlab("Countries") +
  ylab("Percentage") +
  guides(fill = "none") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  geom_text(aes(label = sph_total), size = 3, position =    position_dodge(width = 0.9), vjust = 0.5) +
  scale_y_continuous(labels = function(x) paste0(x, "%"),
                     breaks=seq(0, 50, by = 10), limits=c(0, 50))

#lng_stnd_illness
ggplot(data = df_mean, aes(x = reorder(rownames(df_mean), lng_stnd_illness), y = lng_stnd_illness,
                           fill = ifelse(rownames(df_mean) == "UE mean", "Highlighted", "Normal"))) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() +
  xlab("Countries") +
  ylab("Percentage") +
  guides(fill = "none") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  geom_text(aes(label = lng_stnd_illness), size = 3, position = position_dodge(width = 0.9), vjust = 0.5) +
  scale_y_continuous(labels = function(x) paste0(x, "%"),
                     breaks=seq(0, 50, by = 10), limits=c(0, 50))

#cds
ggplot(data = df_mean, aes(x = reorder(rownames(df_mean), cds), y = cds,
                           fill = ifelse(rownames(df_mean) == "UE mean", "Highlighted", "Normal"))) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() +
  xlab("Countries") +
  ylab("Percentage") +
  guides(fill = "none") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  geom_text(aes(label = cds), size = 3, position = position_dodge(width = 0.9), vjust = 0.5) +
  scale_y_continuous(labels = function(x) paste0(x, "%"),
                     breaks=seq(0, 12, by = 2), limits=c(0, 12))

# Standardization
df.stand <- scale(df)
df.stand <- as.data.frame(df.stand)
glimpse(df.stand)
sapply(df.stand, sd)
sapply(df.stand, mean)

# Boxplot of data after standardization
ggplot(stack(df.stand), aes(x = ind, y = values)) +
  coord_flip() +
  scale_y_discrete() +
  ylab("") +
  xlab("") +
  geom_boxplot()

# K-means clustering:

## Visualisation of optimal number of clusters using wss method (Elbow method)
fviz_nbclust(df.stand, kmeans, method = "wss", k.max = 6) + theme_minimal() + ggtitle("Elbow method")

## Visualisation of optimal number of cluster using GAP statistic
gap_stat_1 <- clusGap(df.stand, FUN = kmeans, nstart = 1, K.max = 6, B = 150, d.power = 1)
fviz_gap_stat(gap_stat_1) + theme_minimal() + ggtitle("Gap statistic")

## K-means algorithm with 2 centers
kme2 <- kmeans(df.stand, centers = 2, nstart = 20)
kme2$cluster
fviz_cluster(kme2, df.stand, repel = T, main = "K-means clustering", xlab = "Dimension 1 (48.5%)", ylab = "Dimension 2 (20.8%)")

## K-means algorithm with 3 centers
kme3 <- kmeans(df.stand, centers = 3, nstart = 20)
kme3$cluster
fviz_cluster(kme3, df.stand, repel = T, main = "K-means clustering", xlab = "Dimension 1 (48.5%)", ylab = "Dimension 2 (20.8%)")

## Indexes tests

### Index S (Silhouette) test
index.S(dist(df.stand), kme3$cluster) #centers = 3, score = 0.26
index.S(dist(df.stand), kme2$cluster) #centers = 2, score = 0.43 <- better

### Index G1 test
index.G1(df.stand, kme3$cluster) #centers = 3, score = 14.52
index.G1(df.stand, kme2$cluster) #centers = 2, score = 16.9 <- better

### Index G2 test
index.G2(dist(df.stand), kme3$cluster) #centers = 3, score = 0.757
index.G2(dist(df.stand), kme2$cluster)  #center = 3, score = 0.847 <- better

### All indexes point to 2 clusters being optimal choice

# Linear ordering using Hellwig method :

## Weights vector :
# <b>Area 1 (weight 2)</b> - Life expectancy and quality of life:
#   <ul>
#   <li>hlty_total (healthy life),</li>
#   <li>hlte_sph_total (healthy life expectancy),</li>
#   <li>sph_total (self-perceived health),</li>
#   <li>cds (current depressive symptoms),</li>
#   <li>lng stnd illness (people having a long-standing illness or health problem),</li>
#   <li>splong lim (self-perceived long-standing limitations in usual activities due to health problem).</li>
#   </ul>
#   
#   <b>Area 2 (weight 1.5)</b> - characterising state of health service, medical care:
#   <ul>
#   <li>hbds number (hospital beds),</li>
#   <li>hlt graduates (health graduates),</li>
#   <li>hlt per ex ncp (health personnel caregivers excluded),</li>
#   <li>phy number (physicians by medical speciality),</li>
#   <li>unm needs (self-reported unmet needs for medical examination),</li>
#   <li>hlt care exp (health care expenditure).</li>
#   </ul>
#   
#   <b>Area 3 (weight 1)</b> - contains additional, non medical indicators such as:
#   <ul>
#   <li>acc at work (accidents at work),</li>
#   <li>cod (causes of death).</li>
#   </ul>

weights. <- c(2, #hlty_total
              2, #hlte_sph_total
              2, #sph_total
              1.5, #hbds_number
              1.5, #hlt_graduates
              1.5, #hlt_per_exp_ncp
              1, #acc_at_work
              2, #cds
              1.5, #phy_number
              1, #cod
              1.5, #unm_needs
              1.5, #hlt_care_exp
              2, #lng_stnd_illness
              2  #splong_lim
)

#Characters of variable
# + means stimulant,
# - means destimulant.
i <- c("+", "+", "+", "+", "+", "+", "-", "-", "+", "-", "-", "+", "-", "-")

x <- hellwig(df.stand, weights., i)
x <- x[order(x$rank),]

ggplot(data = x, aes(y = score, x = reorder(rownames(x), score), fill = ifelse(rownames(x) == "Poland", "Highlighted", "Normal"))) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() + 
  ylab("Score") +
  xlab("Countries") +
  ggtitle("Hellwig's method") +
  guides(fill = "none") +
  geom_text(aes(label =paste(round(score, 3), rank, sep = ", place ")), size = 2.5, position = position_dodge(width = 0.9), vjust = 0.5, hjust = 0) +
  ylim(-0.015, 0.55)

# Linear ordering using TOPSIS method :
nm <- topsis(as.matrix(df), weights., i)
df.topsis <- topsis(as.matrix(df), weights., i)
rownames(df.topsis) <- rownames(df)
df.topsis <- df.topsis[order(df.topsis$rank),]
nbnv <- df.topsis %>% dplyr::select(score, rank)

ggplot(data = df.topsis, aes(y = score, x = reorder(rownames(df.topsis), score), fill = ifelse(rownames(df.topsis) == "Poland", "Highlighted", "Normal"))) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() + 
  ylab("Score") +
  xlab("Countries") +
  ggtitle("TOPSIS method") +
  guides(fill = "none") +
  geom_text(aes(label =paste(round(score, 3), rank, sep = ", place ")), size = 2.5, position = position_dodge(width = 0.9), vjust = 0.5, hjust = 0) +
  ylim(-0.015, 0.8)

# Principal component analysis with two principal components
DFPCA <- PCA(df.stand, scale.unit = FALSE, ncp = 2, graph = F)

## Eigenvalues
DFPCA.eigval <- get_eigenvalue(DFPCA)
DFPCA.eigval

## Eigenvalues plot
fviz_eig(DFPCA, addlabels = TRUE, ylim = c(0, 50), main = "Eigenvalues", xlab = "Dimensions", ylab = "Percentage of explained variance")

## Correlation plot (contribution of individuals)
var <- get_pca_var(DFPCA)
corrplot(var$cos2, is.corr=FALSE, col = COL2(, 100), number.cex= 7/ncol(df), cl.pos = 'r', cl.ratio = 1)

## Contribution of individuals to dimensions
fviz_contrib(DFPCA,
             choice = "var",
             axes = 1,
             top = 14,
             title = "Contribution of individuals to dimension 1")
fviz_contrib(DFPCA,
             choice = "var",
             axes = 2,
             top = 14,
             title = "Contribution of individuals to dimension 2")

## Correlations of individuals with dimensions and p-values
res.desc <- dimdesc(DFPCA, axes = c(1,2), proba = 0.05)
res.desc$Dim.1
res.desc$Dim.2

## Contribution of individuals to both dimensions
fviz_contrib(DFPCA,
             choice = "ind",
             axes = 1:2,
             title = "Contribution of individuals to dimension 1 and 2")

## Biplot
fviz_pca_biplot(DFPCA,
                repel = TRUE,
                title = "Biplot",
                xlab="Dimension 1 (48.5%)",
                ylab="Dimension 2 (20.8%)",
                geom = c("point","text"),
                habillage = as.factor(kme2$cluster),
                col.var = "black", # Variables color
                col.ind = "#696969",  # Individuals color
                addEllipses = TRUE,
                ellipse.type = "convex"
)

# Map of clustered countries

#Grupa 1
Group1 <- names(which(kme2$cluster == 1))
#Grupa2
Group2 <- names(which(kme2$cluster == 2))
Group1[3] <- "Czech Republic"

Groups <- data.frame(country = c(Group1, Group2),
                     colours = c(rep(1, length(Group1)), rep(2, length(Group2))))

spdf2 <- joinCountryData2Map(Groups, joinCode="NAME", nameJoinColumn="country")
country_coord2 <-data.frame(coordinates(spdf2),stringsAsFactors=F)
country_coord2 = country_coord2[c(Group1, Group2),]

mapCountryData(spdf2,
               nameColumnToPlot="colours",
               catMethod="categorical",
               mapRegion = "Europe",
               addLegend = T,
               missingCountryCol = gray(.8),
               mapTitle = "Countries map after grouping",
               colourPalette = c("red", "blue"))
text(x=country_coord2$X1,y=country_coord2$X2,labels=row.names(country_coord2), cex = 0.6, font = 2)

