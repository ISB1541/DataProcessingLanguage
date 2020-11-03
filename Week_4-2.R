# 4-2주차

# 이미지 회전
# install.packages("imager")
library(imager)
img_path<-"E:/Rstudio/dataProcessLanguage/resource/pinwheel.jpg"
img<-load.image(img_path)
plot(img)
img<-resize(img, size_x=400L, size_y=400L)
plot(img, xlim)
plot(img, xlim=c(0,400), ylim=c(0,400))


# imrotate(img, 각도, 중심점) axes opt : 축 표시(T or F)
angle<-0
while (TRUE) {
  angle<-angle +10
  imrotate(img, angle, cx=200, cy=200) %>% plot(axes=FALSE)
  Sys.sleep(1)
}

# 웹 스크래핑
install.packages("rvest")
library(rvest)
url<-"https://www.data.go.kr/tcs/dss/selectDataSetList.do"
htm<-read_html(url)
htm
