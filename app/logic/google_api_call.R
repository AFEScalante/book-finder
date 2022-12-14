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
      q = paste0("intitle:", search_field)
    )
  ) |> content()
  book_content$items
}

#' @export
get_content_info <- function(contents) {
  map(
    contents,
    ~list(
      title = .x$volumeInfo$title,
      authors = .x$volumeInfo$authors,
      publisher = .x$volumeInfo$publisher
    )
  )
}

#' @export
get_content_image <- function(contents) {
  map(contents, ~validate_img_url(.x$volumeInfo$imageLinks$smallThumbnail))
}

#' @export
validate_img_url <- function(url) {
  if (is.null(url)) return("https://via.placeholder.com/200.png?text=Book+cover+not+available")
  url
}
