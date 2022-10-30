# Book Cards
box::use(
  shiny[...],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("book_card"))
}

#' @export
server <- function(id, imglink) {
  moduleServer(id, function(input, output, session) {
    output$book_card <- renderUI({
      div(
        class = "book-card",
        img(src = imglink)
      )
    })
  })
}
