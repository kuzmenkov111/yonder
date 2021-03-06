#' Modal dialogs
#'
#' Modals are a flexible alert window, which disable interaction with the page
#' behind them. Modals may include inputs or buttons or simply include text.
#'
#' @param title A character string specifying the modal's title.
#'
#' @param body A character string specifying the body of the modal or
#'   custom element to use as the body of the modal, defaults to `NULL`.
#'
#' @param footer Custom tags to include at the bottom of the modal, defaults to
#'   `NULL`.
#'
#' @param session A reactive context, defaults to [getDefaultReactiveDomain()].
#'
#' @section Displaying a modal:
#'
#' sendModal(
#'   title = "A simple modal",
#'   body = paste(
#'     "Cras mattis consectetur purus sit amet fermentum.",
#'     "Cras justo odio, dapibus ac facilisis in, egestas",
#'     "eget quam. Morbi leo risus, porta ac consectetur",
#'     "ac, vestibulum at eros."
#'   )
#' )
#'
#' @family server
#' @export
sendModal <- function(title, body, footer = NULL,
                      session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    "yonder:modal",
    list(
      title = htmltools::HTML(as.character(title)),
      body = htmltools::HTML(as.character(body)),
      footer = if (!is.null(footer)) htmltools::HTML(as.character(footer))
    )
  )
}

#' @rdname sendModal
#' @export
closeModal <- function(session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    "yonder:modal",
    list(
      close = TRUE
    )
  )
}
