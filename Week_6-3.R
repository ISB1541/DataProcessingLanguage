# 6-3주차

# 동전 두개를 던져서 앞면이 나올 확률 
count <- c(0, 0, 0)
for (n in 1:500) {
  coin <- sample(c(0,1), 2, replace=T)
  
  index <- sum(coin) + 1
  count[index] <- count[index] + 1
  
  probability <- count / n
  
  title <- paste("반복 수: ", n, " / 500")
  
  barplot(probability, names.arg = c(0, 1, 2),
          xlab="앞면이 나온 횟수", 
          ylab="확률",
          col=rainbow(3),
          main = title)
}

# 룰렛 회전
install.packages("imager")
library(imager)

img_path<- "E:/Rstudio/dataProcessLanguage/resource/roulette.png"
img <- load.image(img_path)
plot(img)

# 룰렛 이미지 크기 변환
img <- resize(img, size_x = 300L, size_y = 300L)
plot(img, xlim=c(0, 300), ylim=c(0, 300))

plot(img, xlim=c(0, 300), ylim=c(0, 300), axes=FALSE)

# 룰렛 회전
rot.count <- sample(11:20, 1)
rot.count

angle <- 0
for(i in 1:rot.count) {
  angle <- angle + 36
  title <- paste("룰렛 회전:", i, "/", rot.count)
  
  imrotate(img,
           angle,
           cx=150, cy=150) %>% 
    draw_circle(x=150, y=150, radius = 30, col=c(1,0,0,0), opacity = 0.5) %>% 
    plot(axes=FALSE, main=title)
  Sys.sleep(0.2)
}

install.packages("magick")
library(magick)

lion_bg <- image_read("E:/Rstudio/dataProcessLanguage/resource/lion_bg.png")
lion_1 <- image_read("E:/Rstudio/dataProcessLanguage/resource/lion_1.png")
lion_2 <- image_read("E:/Rstudio/dataProcessLanguage/resource/lion_2.png")

lion_bg <- image_scale(lion_bg, "600x300!")
lion_1 <- image_scale(lion_1, "100x50!")
lion_2 <- image_scale(lion_2, "100x50!")

print(lion_bg)
print(lion_1)
print(lion_2)

# 이미지 합성 테스트
img <- image_composite(lion_bg, lion_1, offset = "+100+200") # offset 위치좌표
img

# 이미지 이동
moving <- 0
x <- -100
y <- 150
while(TRUE) {
  if ( x< 0)
    position <- paste(x, "+", y, sep="")
  else
    position <- paste("+", x, "+", y, sep="")
  if (moving %% 2 == 0) 
    img <- image_composite(lion_bg, lion_1, offset = position)
  else 
    img <- image_composite(lion_bg, lion_2, offset = position)
  
  print(img)
  Sys.sleep(0.3)
  if (x > 600)
    break
  moving <- moving + 1
  x <- x + 20
}
