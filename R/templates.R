# stockReport.R - Function for stock assessment report
# icesdown/R/stockReport.R

# Copyright Iago MOSQUEIRA (WMR), 2019
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

# stockReport {{{

#' Template for Rmarkdown version of a stock assessment template
#'
#' @param ... Any arguments to pass to bookdown::markdown_document2
#' @return A document configuration, of class rmarkdown_output_format.
#'
#' @examples

stockReport <- function(...) {
  markdown_document2(..., base_format = rmarkdown::word_document)
} # }}}
