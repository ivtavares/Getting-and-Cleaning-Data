install.packages('XML')
library(XML)
fileURl <- "https://www.w3schools.com/xml/simple.xml"
download.file(fileURl, destfile = "simple.xml")
doc <- xmlTreeParse("simple.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
topNode <- xmlRoot(doc)
class(rootNode)
els <- getNodeSet(topNode,"//food")
els
class(els)
foods <- data.frame(t(xmlSApply(els,function(x)xmlSApply(x,xmlValue))))
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)


fileURl <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURl, useInternal = TRUE)
scores <- xpathSApply(doc, '//div[@class="score"]',xmlValue)
teams <- xpathSApply(doc, '//div[@class="game-info"]',xmlValue)
teams <- sub("vs  ","",teams)
teams <- sub("@  ","",teams)
scores
teams
