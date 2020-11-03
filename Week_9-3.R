# 9-1주차

# 공공데이터
install.packages("XML")
install.packages("ggplot2")
library(XML)
library(ggplot2)

## api 설정
api = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"
api_key = "gxw8rOM4syLLAFOi0FdCPWqhBIEk0gFRkQrF8Q95IXnKo%2Bir7zf3ThwFxVnRD1h1uHR2ZQ%2FL%2FIq9foT%2FeFreTg%3D%3D"
numOfRows = 10
pageNo = 1
itemCode = "PM10"
dataGubun = "HOUR"
searchCondition = "MONTH"

## URL 작성
url = paste(api,
            "?serviceKey=", api_key,
            "&numOfRows=", numOfRows,
            "&pageNo=", pageNo,
            "&itemCode=", itemCode,
            "&dataGubun=", dataGubun,
            "&searchCondition=",searchCondition,
            sep="")
url
xmlFile = xmlParse(url)
xmlRoot(xmlFile)
df = xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df

## 차트 그리기
ggplot(data=df, aes(x=dataTime, y=busan, fill=dataTime)) + 
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=90), legend.position="none") + # x축 눈금 회전각도, 범례삭제
  labs(title="시간대별 부산지역의 PM10 변화", x = "측정일시", y = "농도") +
  scale_fill_manual(values = rainbow(10)) + # 막대색 지정 (범례 출력)
  coord_flip() # 가로 출력

df
pm = df[1, 4:20]
pm


