# 9-1����

# ����������
install.packages("XML")
install.packages("ggplot2")
install.packages("urltools")
library(XML)
library(ggplot2)
library(urltools)

## api ����
api = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"
api_key = "gxw8rOM4syLLAFOi0FdCPWqhBIEk0gFRkQrF8Q95IXnKo%2Bir7zf3ThwFxVnRD1h1uHR2ZQ%2FL%2FIq9foT%2FeFreTg%3D%3D"
api_key_decode = url_decode(api_key)
api_key_encode = url_encode(api_key_decode)
numOfRows = 10
pageNo = 1
itemCode = "PM10"
dataGubun = "HOUR"
searchCondition = "MONTH"

## URL �ۼ�
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

## ��Ʈ �׸���
gplot(data=df.aes(x=dataTime,y=seoul)) + 
  geom_bar(stat="identity", fill="green") +
  theme(axis.text.x=element_text(angle=90), legend.position="none") + # x�� ���� ȸ������, ���ʻ���
  labs(title="�ð��뺰 ���������� �̼����� �� ��ȭ", x = "�����Ͻ�", y = "��") +
  scale_fill_manual(values = rainbow(10)) + # ����� ���� (���� ���)
  coord_flip() # ���� ���

