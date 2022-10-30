box::use(
  shiny[div, img, column, p],
)

#' @export
display_book_card <- function(title, imglink) {
  column(
    width = 4,
    div(
      class = "book-card",
      p(title, class = "blue-text"),
      img(src = imglink, class = "book-img")
    )
  )
}
