box::use(
  shiny[div, img, column, p, h5],
  glue[glue],
)

#' @export
display_book_card <- function(book_content, imglink) {
  column(
    width = 4,
    div(class = "book-card",
        h5(class = "book-title", style = "text-align: center;", book_content$title),
        div(class = "book-info",
          img(src = imglink, class = "book-img"),
          div(class = "book-description",
              glue("Authors: {paste(book_content$authors, collapse = ',')}"),
              glue("\nPublisher: {book_content$publisher}")
          )
        )
    )
  )
}
