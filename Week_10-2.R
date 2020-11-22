# 10-2주차

install.packages("RCurl")
# xml, wordcloud
install.packages("RmecabKo")

library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)

install_mecab("E:/DataProcessingLanguage/Rlibs/mecab")
library(RmecabKo)

# API
searchUrl = "https://openapi.naver.com/v1/search/news.xml"
Client_ID = "3HHBTfa7ddsIbkjDf9ae"
Client_Secret = "04AnoHO5jn"

query = URLencode(iconv("인공지능", "euc-kr", "UTF-8"))
url = paste(searchUrl, "?query=", query, "&display=20", sep="")
url
doc = getURL(url, httpheader=c('Content-Type'="application/xml", 'X-Naver-Client-Id' = Client_ID, 
                               'X-Naver-Client-Secret'=Client_Secret))
doc

