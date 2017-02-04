# Generate Iris CSV with YAML Metadata and comments
library(csvy)
write_csvy(iris, comment_header = TRUE,file = "./data/iris.csv")
