########################################################################################################################
# Installing RQDA, dependencies, and associated packages required for extracting highlighted sections from .pdf files. #
########################################################################################################################

### Information

# I am currently using R version 3.3.1, i.e. not the newest one. Once this degree is out of the way, I'll see if all that also works with 3.3.2.
# If you are willing to test it, I'd be very interested in the outcome.
# Good series of RQDA tutorials on youtube: https://www.youtube.com/watch?v=mLsyGH3ztYY
# Also check out the documentation on http://rqda.r-forge.r-project.org/documentation.html
# The help page of the package itself gives good background information to command line tools for RQDA


### For installation of RQDA and dependencies

detach("package:RSQLite", unload=TRUE) #a specific version of RSQLite is required for enabling coding in RQDA (which is pretty much the core function), so make sure that if there is a previous version, it is not in the library...
remove.packages("RSQLite") #...and is also not installed... just to be safe.
install.packages("devtools") #package loaded for making installing older versions (i.e. RSQLite 1.0.0) easier
require(devtools)
install_version("RSQLite", version = "1.0.0", repos = "https://cran.r-project.org") #install required RSQLite version.
library(RSQLite) #attach RSQlite to library.

# using codes in RQDA requires an older version of RSQLite (1.0.0). Once RQDA is loaded, RSQLite cannot be detached.
# "Error: package ‘RSQLite’ is required by ‘RQDA’ so will not be detached"
# Install RSQLite before RQDA is loaded.

# If the wrong version of RSQLite is installed, the following happens when trying to attach coding to a file. --> Error: "Fail to write to database."
# See here: https://github.com/Ronggui/RQDA/wiki/Note-on-%22Fail-to-write-to-database%22-%7C-RQDA

# Installing the older version of RSQLite (1.0.0) prompted me to install Rtools 3.4
# Instead downloaded and installed Rtools 3.3 (Rtools33.exe) from https://cran.r-project.org/bin/windows/Rtools/ and installed from explorer.
# Followed up installing Rtools 3.4 after all (without uninstalling anything before, so I hope there won't be any problems in the end)
# Rtools is apparently a Windows specific requirement, but since I have not used Mac or Linux yet, I can't comment on that.

# Install and load RQDA from CRAN, make sure that RSQLite is not overwritten with the new version, as it is one of the dependencies.
install.packages("RQDA")
library(RQDA)


### Installing associated packages required for extracting highlighted sections from .pdf files.

# rjava and rjpod are required for extracting highlighted sections from .pdf files.
# See following link: http://rqda.r-forge.r-project.org/manuals/PDFImport1Jan13.pdf
# Install and load rJava from CRAN
install.packages("rJava")
library(rJava)

# Install and load rjpod from R-forge.
install.packages("rjpod", repos="http://R-Forge.R-project.org")
library(rjpod)

# For extracting pdfs make sure to check that the highlighted text is copied into the popup textbox when hovering over the same text.
# For foxit reader (currently using version 8.3.0.14878) go to File --> preferences --> Commenting, and check the box saying:
# "Copy selected text into highlight, squiggly underline, underline, and strikeout comment popups"
# I needed to re-highlight previously highlighted text, i.e. ticking this box does not retrospectively change previous comments.


# For interactive graphical networks of code-categories, another package is required. (This is pretty nifty)
install.packages("d3Network")
library(d3Network)
# If exporting the network image as a postscript file, make sure you can open .eps files. In my case I had to install postscript + ghostscript plugins for Irfan View.


###########################
# RQDA command line tools #
###########################

# This, and other commands could be a good interface between qualitative analysis and quantitative tools in R, as I can retrieve numbers and counts,
# etc. associated with my files and codings, can extract them, and use them for statistics or other numerical analyses.

# This command will output the number of codings for each code, the average number of words associated with each code, and the number of files associated with each code.
summaryCodings()

# This command returns a data frame with codings and associated files, including indices of row & file IDs, as well as the start and end characters, and length of the coding.
coding_table <- getCodingTable()
class(coding_table) #A data frame.