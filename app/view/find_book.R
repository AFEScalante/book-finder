box::use(
  shiny[
    moduleServer,
    NS,
    req,
    icon,
    div,
    tagList,
    reactive,
    textInput,
    verbatimTextOutput,
    renderPrint,
    uiOutput,
    renderUI,
  ],
  purrr[map2],
  shinyWidgets[searchInput],
  waiter[useWaiter],
)

box::use(
  app/logic/google_api_call[get_books_content, get_content_info, get_content_image],
  app/components/book_card[display_book_card],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    useWaiter(),
    div(
      class = "find-book",
        searchInput(
          inputId = ns("search_book"),
          label = "",
          placeholder = "E.g. David Brown...",
          btnSearch = icon("search"),
          btnReset = icon("remove")
        )
    ),
    div(
      class = "results-container",
      uiOutput(ns("book_img_card"))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    books_content <- reactive(
      get_books_content(input$search_book)
    )

    books_info <- reactive(
      books_content() |> get_content_info()
    )

    books_img <- reactive(
      books_content() |> get_content_image()
    )

    output$book_img_card <- renderUI({
      req(input$search_book)
      map2(books_info(), books_img(), ~display_book_card(.x, .y))
    })
  })
}
