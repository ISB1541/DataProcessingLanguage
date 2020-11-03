# Data Processing Leanuage 
# Midterm Exam (1)

# �籸�� ������
install.packages("magick")
library(magick)

# �籸�� �̹��� �б�
ball <- image_read("E:/Rstudio/dataProcessingLanguage/resource/ball.png")
print(ball)

# �籸�� �̹��� �б�
table <- image_read("E:/Rstudio/dataProcessingLanguage/resource/table.png")
print(table)

# �籸�� �̹��� ������¡
ball <- image_scale(ball, "40X40!")
table <- image_scale(table, "300X400!")

# �籸���� X, Y ��ġ �ʱ�ȭ
x<-0
y<-0
leftX = FALSE
topY = FALSE

while(TRUE) {
  # X, Y�� ��ġ
  position <- paste("+", x, "+", y, sep="")
  
  #table �̹����� ball �̹����� offset ��ġ�� ��ħ
  img <- image_composite(table, ball, offset=position)
  
  # img �̹��� ���
  print(img)
  # 0.1�� ���
  Sys.sleep(0.1)
  
  print(x)
  print(y)
  # X, Y�� ��ġ ��ȯ: ����
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
  # X, Y�� ��ġ ��ȯ: ��
}
  