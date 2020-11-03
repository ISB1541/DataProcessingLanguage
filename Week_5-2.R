# 5-2주차

# stem
rivers
stem(rivers, scale = 2)

# pie
city <- c("서울", "부산", "대구", "인천")
pm25 <- c(18, 22, 21, 30)
colors <- c("red", "orange", "yellow", "green")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지지")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지지", 
    init.angle=90, clockwise=T)
colors()
# label, pallete
install.packages("RColorBrewer")
library(RColorBrewer)
greens <- brewer.pal(4, 'Greens')
pct <- round(pm25/sum(pm25)*100, 0)
city_label <- paste(city, ", ", pct, "%", sep ="")
pie(pm25, labels = city_label, col = greens, main = "지역별 미세먼지", init.angle=90, clockwise=T)

dept <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
sales01 <- c(4, 12, 5, 8)

#barplot
bp<-barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기) ", col = rainbow(length(dept)), 
        xlab = "부서", ylab = "영업실적", ylim = c(0, 15))
abline(h=mean(sales01))
text(x=bp, y=sales01, labels = sales01, pos = 3)

## 가로
bp<-barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기) ", col = rainbow(length(dept)), 
            xlab = "부서", ylab = "영업실적", xlim = c(0, 15), horiz = TRUE)
sales02 <- c(12, 8, 8, 4)
sales <- rbind(sales01, sales02)
sales
legend_label <- c("1분기", "2분기")
barplot(sales, names.arg = dept, main = "부서별 영업 실적(1~2분기)", col = c("green", "orange"), 
        xlab = "부서", ylab="영업 실적", ylim=c(0,30), legend.text = legend_label, beside = TRUE)
