# Data Processing Leanuage 
# Midterm Exam (1)

# 3개월간 TV 시청률
install.packages("rvest")
install.packages("lubridate")
install.packages("scales")

# 라이브러리 불러오기
library(rvest) # 스크래핑 관련 라이브러리
library(lubridate) # 날짜 관련 라이브러리
library(ggplot2) # plot 관련 라이브러리

url.page <- "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=7월%2031일드라마마시청률"
query = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query="
monthUrl = "월%20"
dayUrl = "일드라마시청률"

week = 13 # 몇 주치 불러올지..
startDate = date("2020-07-31") # 시작 날짜 

list = list()
for(i in c(1:week)) {
  month <- month(startDate)
  day <- day(startDate)
  url <- paste(query, month, monthUrl, day, dayUrl,sep="") # url 가공
  html <- read_html(url)
  # 차트에 띄울 데이터 가공
  title <- html_nodes(html, ".tb_list tr td p") %>% html_text()
  title <- title[seq(2,length(title), 4)] # 제목과 방송국을 불러와 홀수 인덱스만 넣기(제목)
  rating <- html_nodes(html, '.rate') %>% html_text()
  rating <- substring(rating, 1, regexpr("%", rating)-1) # %제거
  list[[i]] = rbind(title,rating) # list에 행 추가
  startDate <- startDate + 7
}

# 데이터프레임 생성
titles = NULL
ratings = NULL
weeks = NULL

for(i in c(1:week)) {
  titles = c(titles, list[[i]][1,])
  ratings = c(ratings, list[[i]][2,])
  weeks = c(weeks, rep(i, times = length(list[[i]][1, ])))
}
df = data.frame(titles, weeks, ratings = as.numeric(ratings))

# 시청률 3%미만 제거
min_rate = 3
delete_row = NULL
index = 1
for(i in df[, 3]) {
  if (i<min_rate) {
    delete_row = c(delete_row, index)
  }
  index = index + 1
}
delete_row
df <- df[-delete_row,]

# 차트 그리기
print(
  ggplot(df, aes(weeks, ratings))
  # + theme(legend.position = "none")
  + geom_line(aes(linetype = titles, color = titles), size = 2)
  # + scale_color_brewer(palette = 1)
  + scale_x_continuous(limits = c(1, week), breaks = seq(1, week, 1))
  + scale_y_continuous(limits = c(0, 30), breaks = seq(0, 30, 3))
  )

# 네이버에서 일별 드라마 제목과 시청률을 불러와 금요일 드라마를 회당 시청률(주별 시청률)로
# 3개월치를 볼 수 있도록하여 드라마 방영일과 종영일, 그에 따른 다른 경쟁 드라마의 시청률에
# 영향을 주는지 알아보기 위해 차트를 그려봄.
# 결과적으로 기막힌 유산이나 위험한 약속 방영일과 종영일을 보면, 다른 드라마의 시청률이
# 영향을 미치는 것을 볼 수 있다.