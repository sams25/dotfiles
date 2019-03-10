# Global settings for R

options(repos  = (c(CRAN="https://cloud.r-project.org"))) # Global mirror
options(editor = "vim")                                   # For `edit()`

# Called after everything else in .Rprofile is executed, at the start of every R
# session
.First <- function() {
  # Print this on start so I know it's loaded
  message("Loaded my custom ~/.Rprofile at: ", date(), "\n",
          "Working directory is: ", getwd())
}

# Called at the end of a session
.Last <- function() {
  # TODO: clean-up/save command history?
  message("Goodbye at: ", date())
}

# Better prompts
options(prompt="> ")
options(continue="... ")
# 'number of print entries', keep this small-ish
options(max.print=50)
# how many digits of milliseconds to print
options(digits.secs=3)

# Colours in R output
#if(Sys.getenv("TERM") == "xterm-256color") {
#  library("colorout")
#}

####################################################
### ------ CAREFUL ZONE (FOR PORTABILITY) ------ ###
####################################################

# New environment for global functions so that it doesn't clutter my namespace
# and is immune to `rm(list=ls())`
# NOTE: Do not add anything non-trivial here, because that breaks portability,
# instead, make a package of helpful R functions on Github and use that
.env <- new.env()

# To stop asking if I want to save the workspace
.env$q <- function(save="no", ...) quit(save=save, ...)

# Attach the variables created
# NOTE: this is dangerous, as you are suppressing the name conflicts, so make
# sure you know what you are overriding within .env
attach(.env, warn.conflicts=FALSE)

######################################
### ------ END CAREFUL ZONE ------ ###
######################################
