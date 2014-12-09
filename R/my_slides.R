#' Custom output format
#' @export
#' @importFrom rmarkdown output_format knitr_options pandoc_options pandoc_variable_arg pandoc_path_arg
my_slides <- function(){
  template <- system.file("pandoc/myslides.tex", package = "utf8vignette")
  args <- c(
    "--slide-level", 2,
    "--template", template,
    "--latex-engine", "xelatex"
  )
  output_format(
    knitr = knitr_options(opts_chunk = list(dev = 'pdf', concordance = TRUE)),
    pandoc = pandoc_options(
      to = "beamer",
      args = args,
      keep_tex = TRUE
    ),
    clean_supporting = FALSE
  )
}
