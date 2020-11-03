# 7-2����
install.packages("rvest")
library(rvest)

# ������(������) �б�
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

title <- html_nodes(html, "#apiDataList .title") %>% html_text()
title

desc <- html_nodes(html, "#apiDataList .ellipsis") %>% html_text()
desc

title <- gsub("[|\r|\n|\t]", "", title)
title

api <- data.frame(title, desc)
api