# functions.R - DESC
# /functions.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

# TODO: ADD icesRound

# as_flextable(FLQuant)

#' Coercing FLQuant(s) into flextable
#' @rdname as_flextable
#' @param x Object to transform, of class 'FLQuant' or 'FLQuants'
#' @examples
#' data(ple4)
#' as_flextable(catch(ple4))
#' as_flextable(catch.n(ple4))
# ft <- set_formatter(ft, F=icesRound)

setMethod("as_flextable", signature(x="FLQuant"),
  function(x) {

    # No ages
    if(dim(x)[1] == 1) {

      # CONVERT to year~age data.frame
      df <- as.data.frame(x, drop=TRUE, row.names=FALSE)

      # SET year as character
      df$year <- as.character(df$year)
      
    # 2D object
    } else {
      
      # CONVERT to year~age data.frame
      df <- as.data.frame(t(x[drop=TRUE]), row.names=FALSE)

      # ADD year column
      df <- cbind(year=dimnames(x)$year, df)
    }

  # CREATE flextable
  autofit(flextable(df))
})

#' @rdname as_flextable
#' @examples
#' as_flextable(metrics(ple4))

setMethod("as_flextable", signature(x="FLQuants"),
  function(x) {
    
    # CONVERT to wide model.frame
    df <- model.frame(x, drop=TRUE)

    # SET year as character
    df$year <- as.character(df$year)
      
    # CREATE flextable
    autofit(flextable(df))

})


     

