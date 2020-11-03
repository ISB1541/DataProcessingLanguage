# Data Processing Leanuage 
# Midterm Exam (1)

# 당구공 굴리기
install.packages("magick")
library(magick)

# 당구공 이미지 읽기
ball <- image_read("E:/Rstudio/dataProcessingLanguage/resource/ball.png")
print(ball)

# 당구대 이미지 읽기
table <- image_read("E:/Rstudio/dataProcessingLanguage/resource/table.png")
print(table)

# 당구공 이미지 리사이징
ball <- image_scale(ball, "40X40!")
table <- image_scale(table, "300X400!")

# 당구공의 X, Y 위치 초기화
x<-0
y<-0
leftX = FALSE
topY = FALSE

while(TRUE) {
  # X, Y의 위치
  position <- paste("+", x, "+", y, sep="")
  
  #table 이미지에 ball 이미지를 offset 위치로 겹침
  img <- image_composite(table, ball, offset=position)
  
  # img 이미지 출력
  print(img)
  # 0.1초 대기
  Sys.sleep(0.1)
  
  print(x)
  print(y)
  # X, Y의 위치 변환: 시작
  if(x >= 260)
    leftX = TRUE
  if(x <= 0)
    leftX = FALSE
  if(y >= 360)
    topY = TRUE
  if(y <= 0)
    topY = FALSE
  
  if(!leftX)
    x <- x + 10
  else
    x <- x - 10
  if(!topY)
    y <- y + 10
  else
    y <- y - 10
  # X, Y의 위치 변환: 끝
}
  
