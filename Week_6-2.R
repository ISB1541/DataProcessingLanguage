# 6-1주차

# 반복문의 이해
# for 
sum <- 0
for ( i in 1:10) {
  sum <- sum + i
}
print(sum)

# while
sum <- 0
i <- 1
while (i <= 10) {
  sum <- sum + i
  i <- i + 1
}
print(sum)

# repeat, break
sum <- 0
i <- 1
repeat {
  sum <- sum + i
  i <- i + 1
  if( i >10) {
    break
  }
}
print(sum)

# next
sum <- 0
for (i in 1:10) {
  if (i %% 2 == 0)
    next
  sum <- sum + i
}
print(sum)

# 카운트 다운
install.packages("animation")
library(animation)

ani.options(interval = 1)
plot.new()

for (i in 10:0) {
  rect(0, 0, 1, 1, col="yellow")
  
  text_size = 11-i
  text(0.5, 0.5, i, cex=text_size, col=rgb(0,0,1,1))
  
  ani.pause()
}

# 기본 경로 내문서
saveHTML({
  for (i in 1:20) {
    plot(runif(20), ylim = c(0, 1))
    ani.pause()
  }
}, img.name = "unif_plot", imgdir = "unif_dir", htmlfile = "random.html", 
autobrowse = FALSE, title = "Demo of 20 uniform random numbers")

# runif
library(animation)

ani.options(interval = 0.5)

while(TRUE) {
  y <- runif(5, 0, 1) #균등분포에서 표본 추출 0 ~ 1사이 5개
  
  barplot(y, ylim = c(0, 1), col=rainbow(5))
  
  ani.pause()
}
