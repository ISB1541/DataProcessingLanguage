# 20141689 김호빈

#Library
library(igraph)
library(dplyr)

# 3 - Read Dataset
res_path = ("E:/DataProcessingLanguage/resource/")
file_name = "CA-HepTh.txt"
df.fb = read.table(paste(res_path, file_name, sep = ""), header = F)
head(df.fb)
G.fb = graph.data.frame(df.fb, directed = FALSE)
G.fb

# 4 - Degree, Closeness, Betweeness
deg = centralization.degree(G.fb, normalized = FALSE)
clo = centralization.closeness(G.fb, normalized = FALSE)
bet = centralization.betweenness(G.fb, normalized = FALSE)

deg_res = deg$res
clo_res = clo$res
bet_res = bet$res
  
deg_max = deg_res[deg_res == max(deg_res)]
deg_max_idx = which(degree(G.fb) == deg_max)

clo_min = clo_res[clo_res == min(clo_res)]
clo_min_idx = which(clo_res == clo_min)

bet_max = bet_res[bet_res == max(bet_res)]
bet_max_idx = which(bet_res == bet_max)

print(paste("Max Degree index :", deg_max_idx))
print(paste("Max Degree :", deg_max))
print(paste("Min Cloness index :", clo_min_idx))
print(paste("Min Cloness :", clo_min))
  print(paste("Max Betweeness index :", bet_max_idx))
print(paste("Max Betweeness :", bet_max))

# 5 - Plot
plot(deg_res, type="h", main="Degree Distribution")

# 6 - label
plot(deg_res, type="h", main="Degree Distribution", xlab='Index', ylab='Degree')

# 7 - Largest Tenth
largest_ten_idx=order(deg_res, decreasing = TRUE)[1:10]
largest_ten=deg$res[max_tenth_idx]
print("연결정도가 가장 큰 10개의 노드 Index")
print(largest_ten_idx)
print("연결정도가 가장 큰 10개의 노드")
print(largest_ten)

# 8 - Graph connected with largest node
v.set = neighbors(G.fb, v = deg_max_idx) # 가장 큰 노드와 연결된 노드 set
v3 = c(deg_max_idx, v.set)
G.fb.max = induced_subgraph(G.fb, v3)
V(G.fb.max)$name
G.fb.max
V(G.fb.max)$color = ifelse(V(G.fb.max)$name == V(G.fb)$name[deg_max_idx], "red", "Green")
V(G.fb.max)$label = ifelse(V(G.fb.max)$name == V(G.fb)$name[deg_max_idx], deg_max_idx, NA)
plot(G.fb.max)

# 9 - Different output according to node size
V(G.fb.max)$size = ifelse(V(G.fb.max)$name == v.max, 50, 10)
plot(G.fb.max)
sub_deg=deg$res[v.set]
V(G.fb.max)$size = ifelse(V(G.fb.max)$name == v.max, 50, sub_deg * 0.2)
plot(G.fb.max)