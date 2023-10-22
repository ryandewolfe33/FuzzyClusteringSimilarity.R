#' Setup fuzzyclusteringsimilarity
#'
#' This function initializes Julia and the FuzzyClusteringSimilarity.jl package.
#' The first time will be long since it includes precompilation.
#' Additionally, this will install Julia and the required packages
#' if they are missing.
#'
#'
#' @param pkg_check logical, check for FuzzyClusteringSimilarity.jl
#' and install if necessary
#' @param ... Parameters are passed down to JuliaCall::julia_setup
#'
#'
#' @export
fuzzy_setup <- function(pkg_check = TRUE, ...) {
  JuliaCall::julia_setup(installJulia = TRUE, ...)
  if (pkg_check) {
    JuliaCall::julia_install_package_if_needed("FuzzyClusteringSimilarity")
  }
  JuliaCall::julia_library("FuzzyClusteringSimilarity")
}

julia_locate <- do.call(":::", list("JuliaCall", quote(julia_locate)))


#' Compute Adjusted Normalized Degree Of Concordance
#'
#' Compute the andc between clustering1 and clustering2 using model for
#' expectation adjustment.
#'
#' @param clustering1 matrix, clustering (possibly fuzzy)
#' @param clustering2 matrix, clustering (possibly fuzzy)
#' @param model string, adjustment model
#' @param one_sided logical, use one sided adjustment, defaults to FALSE
#' @param massage logical, massage matrix into Julia format, defaults to TRUE
#' (cols are points, rows are clusters)
#'
#' @export
andc <- function(
    clustering1,
    clustering2,
    model,
    one_sided = FALSE,
    massage = TRUE) {
  JuliaCall::julia_assign("clustering1", clustering1)
  if (massage) {
    JuliaCall::julia_eval("clustering1 = massageMatrix(clustering1)")
  }
  JuliaCall::julia_assign("clustering2", clustering2)
  if (massage) {
    JuliaCall::julia_eval("clustering2 = massageMatrix(clustering2)")
  }
  JuliaCall::julia_assign("model", model)
  JuliaCall::julia_assign("oneSided", one_sided)
  result <- JuliaCall::julia_eval("andc(clustering1, clustering2, model, oneSided=oneSided)") # nolint: line_length_linter.
  result
}

#' ComputeS Normalized Degree Of Concordance
#'
#' Compute the ndc between clustering1 and clustering2.
#'
#' @param clustering1 matrix, clustering (possibly fuzzy)
#' @param clustering2 matrix, clustering (possibly fuzzy)
#' @param massage logical, massage matrix into Julia format, defaults to TRUE
#' (cols are points, rows are clusters)
#'
#' @export
ndc <- function(
    clustering1,
    clustering2,
    massage = TRUE) {
  JuliaCall::julia_assign("clustering1", clustering1)
  if (massage) {
    JuliaCall::julia_eval("clustering1 = massageMatrix(clustering1)")
  }
  JuliaCall::julia_assign("clustering2", clustering2)
  if (massage) {
    JuliaCall::julia_eval("clustering2 = massageMatrix(clustering2)")
  }
  result <- JuliaCall::julia_eval("ndc(clustering1, clustering2)")
  result
}

#' Compute Expected Normalized Degree Of Concordance
#'
#' Compute the endc between random clusters generated
#' by model. If one sided = TRUE, endc between randomly
#' generated clusterings and clustering2.
#'
#' @param clustering1 matrix, clustering (possibly fuzzy)
#' @param clustering2 matrix, clustering (possibly fuzzy)
#' @param model string, adjustment model
#' @param one_sided logical, use one sided adjustment, defaults to FALSE
#' @param massage logical, massage matrix into Julia format, defaults to TRUE
#' (cols are points, rows are clusters)
#'
#' @export
endc <- function(
    clustering1,
    clustering2,
    model,
    one_sided = FALSE,
    massage = TRUE) {
  JuliaCall::julia_assign("clustering1", clustering1)
  if (massage) {
    JuliaCall::julia_eval("clustering1 = massageMatrix(clustering1)")
  }
  JuliaCall::julia_assign("clustering2", clustering2)
  if (massage) {
    JuliaCall::julia_eval("clustering2 = massageMatrix(clustering2)")
  }
  JuliaCall::julia_assign("model", model)
  JuliaCall::julia_assign("oneSided", one_sided)
  result <- JuliaCall::julia_eval("endc(clustering1, clustering2, model, oneSided=oneSided)") # nolint: line_length_linter.
  result
}
