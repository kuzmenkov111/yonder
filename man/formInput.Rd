% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forms.R
\name{formInput}
\alias{formInput}
\title{Form inputs}
\usage{
formInput(id, ..., submit = submitInput(), inline = FALSE)
}
\arguments{
\item{id}{A character string specifying an id for the form input.}

\item{...}{Any number of inputs, tags, or additional named arguments passed
as HTML attributes to the parent element.}

\item{submit}{A submit button or tags containing a submit button. The submit
button will trigger the update of input form elements. Defaults to
\code{\link[=submitInput]{submitInput()}}.}

\item{inline}{One of \code{TRUE} or \code{FALSE}, if \code{TRUE} the form and its child
elements are rendered in a horizontal row, defaults to \code{FALSE}. On small
viewports, think mobile device, \code{inline} has no effect and the form will
span multiple lines.}
}
\description{
Form inputs are a new reactive input. Form inputs are an alternative to
shiny's submit buttons. A form input is comprised of any number of
inputs. The value of these inputs will not change until the form input's
submit button is clicked. A form input has no value.

\strong{Important} if \code{id} or \code{submit} are \code{NULL} the form input will not freeze
its child inputs. This can be useful if you want to use a \code{formInput()}
solely for page layout.
}
\details{
When \code{inline} is \code{TRUE} you may want to adjust the right margin of each child
element for viewports larger than mobile, \code{margin(<TAG>, right = c(sm = 2))},
more information at \code{\link[=margin]{margin()}}. You only need to apply extra space for larger
viewports because inline forms do not take effect on small viewports.
}
\section{Frozen inputs with scope}{
\preformatted{ui <- container(
  formInput(
    id = "form",
    formGroup(
      label = "Email",
      emailInput(
        id = "email"
      )
    ),
    formGroup(
      label = "Password",
      passwordInput(
        id = "password"
      )
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)
}
}

\examples{

### Customizing the submit button

card(
  header = "Please pick a flavor",
  formInput(
    id = NULL,
    formGroup(
      label = "Ice creams",
      radioInput(
        id = "flavorChoice",
        choices = c("Mint", "Moose tracks", "Marble"),
      )
    ),
    submit = submitInput(  # <-
      label = "Make choice",
      block = TRUE
    ) \%>\%
      background("teal")
  )
) \%>\%
  border("teal") \%>\%
  width(50)

}
\seealso{
Other inputs: \code{\link{addressInput}},
  \code{\link{buttonGroupInput}},
  \code{\link{buttonInput}}, \code{\link{checkbarInput}},
  \code{\link{checkboxInput}}, \code{\link{dateInput}},
  \code{\link{fileInput}}, \code{\link{groupInput}},
  \code{\link{loginInput}}, \code{\link{radioInput}},
  \code{\link{rangeInput}}, \code{\link{selectInput}},
  \code{\link{textInput}}
}
\concept{inputs}
