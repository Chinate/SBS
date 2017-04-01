# Initialize
load("~/Desktop/Project DataFest/Data/Workspace.RData")
setwd("../Project DataFest/Data/")

# First line of code here
data <- read_delim("~/Desktop/Project DataFest/Data/ASADataFest2017 Data/data.txt", 
                   +     "\t", escape_double = FALSE, trim_ws = TRUE)
dest <- read_delim("~/Desktop/Project DataFest/Data/ASADataFest2017 Data/dest.txt", 
                   +     "\t", escape_double = FALSE, trim_ws = TRUE)

# Analyze dest
destcol <- colnames(dest)
populartitle <- destcol[6:144]
populartitlel <- strsplit(populartitle, "_")
po2norcate <- rep("", 139)
for (i in 1:139) {
  po2norcate[i] <- populartitlel[[i]][2]
}
popucate <- unique(po2norcate)

# dest for Miami
grep('Miami', dest$srch_destination_name)
sum(10^dest[735,6:144])
miami <- rep("",19)
for (i in 1:19) {
  miami[i] <- sum(10^dest[735,populartitle[grep(popucate[i], as.factor(populartitle))]])
}

# dest for Chicago
grep('Chicago', dest$srch_destination_name)
sum(10^dest[209,6:144])
chicago <- rep("",19)
for (i in 1:19) {
  chicago[i] <- sum(10^dest[209,populartitle[grep(popucate[i], as.factor(populartitle))]])
}

# test for difference
popucate
as.numeric(miami)-as.numeric(chicago)

# to be continued
unique(mydata$srch_destination_type_id)