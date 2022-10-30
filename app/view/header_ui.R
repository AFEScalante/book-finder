box::use(
  shiny[div, h1, h2, h3],
)

#' @export
ui <- function(id) {
  div(
    class = "app_header",
    h2("Book Finder"),
    "This app search for books using the Google Books API"
  )
}
