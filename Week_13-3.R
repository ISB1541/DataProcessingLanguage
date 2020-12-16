# 13-3주차

# 그래프 - vertex와 edge로 표현

# 네트워크 - 그래프를 바탕으로 그래프의 edge에 특정한 정량적인 값들을 대응시킨 가중 그래프

# 네트워크 종류 - 스타형, y자형, 원형

install.packages("igraph")
library(igraph)

# graph 생성
G.star = make_star(6, mode="undirected", center = 1) %>%
  set_vertex_attr("name", value = c("A", "B", "C", "D", "E", "F"))
plot(G.star, vertex_color = rainbow(6), vertex.size=60)

tkplot(G.star, vertex.color = rainbow(6), vertex.size=60)

G.ring = make_ring(6, directed = FALSE, circular = TRUE) %>%
  set_vertex_attr("name", value = c("A", "B", "C", "D", "E", "F"))
tkplot(G.ring, vertex.color = rainbow(6), vertex.size=30)

G.Y = make_graph(edges = NULL, n = NULL, directed = FALSE)
G.Y = G.Y + vertices("A", "B", "C", "D", "E", "F")
G.Y = G.Y + edges("A", "B",
                  "A", "C",
                  "A", "D",
                  "D", "E",
                  "E", "F")
tkplot(G.Y, vertex.color = rainbow(6), vertex.size=30)


# 지표 분석
# 연결강도
degree(G.star, normalized = FALSE)
degree(G.star, normalized = TRUE)
CD = centralization.degree(G.star, normalized = FALSE)
Tmax = centralization.degree.tmax(G.ring)
CD$centralization / Tmax

# 근접
closeness(G.star, normalized = FALSE)

# 중개
betweenness(G.star)

# 밀도
graph.density(G.star)
graph.density(G.Y)
graph.density(G.ring)

# 최단 경로, 평균 거리
shortest.paths(G.Y)
distances(G.Y, v = "A", to="E")
average.path.length(G.Y)