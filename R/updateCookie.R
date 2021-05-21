#' Update Cookie
#'
#' Sets / updates a cookie's value in the browser.
#' Serialization is handled by default (in `jsonlite`?).
#'
#' @param session The Shiny session variable
#' @param ... name=value pairs to be used in setting cookie values
#'
#' @return NULL
#'
#' @export
updateCookie <- function(session, ...) {
  if (missing(session)) {
    stop("Must provide a session, a name, and a value")
  }

  li <- rlang::list2(...)

  session$sendCustomMessage("shinyCookie", li)

  invisible()
}


#' Update Cookie
#'
#' Sets / updates a cookie's value in the browser.
#' Serialization is handled by default (in `jsonlite`?).
#'
#' @param cookie_name
#' @param cookie_value
#' @param cookie_parameters
#' @param session The Shiny session variable
#'
#' @return NULL
#'
#' @export
updateCookieParam <- function(session, cookie_name, cookie_value, cookie_parameters) {
  if (missing(session)) {
    stop("Must provide a session, a name, and a value")
  }

  li <- list(name = cookie_name,
             value = cookie_value,
             parameters = cookie_parameters)

  session$sendCustomMessage("shinyCookieParam", li)

  invisible()
}
