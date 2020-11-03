# 4-3주차

# 동전을 던져서 앞면이 나올 학률 변화 
plot(NA, xlab = "동전을 던진 횟수", ylab = "앞면이 나오는 비율", xlim = c(0, 100), ylim = c(0,1),
     main = "동전을 던지는 횟수에 따른 앞면이 나올 확률 변화")
abline(h=0.5, col="red", lty=2) # lty - lineType

count<-0

for(n in 1:100) {
  coin <- sample(c("앞면", "뒷면"), 1)
  
  if(coin == "앞면") {
    count = count + 1
  }
  
  prob <- count / n
  
  points(n, prob)
}
