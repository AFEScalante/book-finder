box::use(
  shiny[div, img, column, p],
  glue[glue],
)

#' @export
display_book_card <- function(book_content, imglink) {
  column(
    width = 4,
    div(class = "book-card",
        div(class = "book-title", book_content$title),
        div(class = "book-info",
          img(src = imglink, class = "book-img"),
          div(class = "book-description",
              glue("Authors: {paste(book_content$authors, collapse = ',')}\n"),
              glue("Publisher: {book_content$publisher}")
          )
        )
    )
  )
}
