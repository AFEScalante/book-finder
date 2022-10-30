box::use(
  httr[GET, content],
  glue[glue],
  purrr[map]
)

url <- "https://www.googleapis.com/books/v1/volumes"

#' @export
get_books_content <- function(search_field) {
  book_content <- GET(
    url = url,
    query = list(
      q = paste0('intitle:', search_field)
    )
  ) |> content()
  book_content$items
}

#' @export
get_content_title <- function(contents) {
  map(contents, ~.x$volumeInfo$title)
}

#' @export
get_content_image <- function(contents) {
  map(contents, ~.x$volumeInfo$imageLinks$smallThumbnail)
}
