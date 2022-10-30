box::use(
  shiny[bootstrapPage, moduleServer, NS, renderText, textOutput],
)

box::use(
  app/view/header_ui,
  app/view/find_book
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    header_ui$ui(ns("header")),
    find_book$ui(ns("book_search"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    find_book$server("book_search")
  })
}
