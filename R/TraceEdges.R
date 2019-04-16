library(opencv)
library(tesseract)
library(stringr)


testPiece <- "img/Copy of jigsaw_puzzle_Piece12.png"


Transform2Edges <- function(fName) {

  newFile <- file.path("img/edge_img",
                       paste0("Edge_", 
                              str_extract(fName, "Piece[0-9]+\\.png$"))
                       )

  edgeOut <- ocv_read(fName) %>%
    ocv_edges() %>%
    ocv_write(newFile)

  newFile
}

list.files("img", pattern = "\\.png", full.names = TRUE) %>%
  purrr::walk(~print(Transform2Edges(.x)))
