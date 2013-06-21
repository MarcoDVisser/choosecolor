\name{palette.picker}
\alias{palette.picker}
\title{Choose a palette interactively from a grid}
\usage{
  palette.picker(n,detail)
}
\arguments{
detail: an integer specifying how many colors to pick.

detail: an integer specifying detail within the color wheel.
		large values may slow down the process. Defaults to 200.
}

\description{
   palette.picker aids in the selection of colors from a grid
   and build a palette with colorRampPalette for usage in R
  graphics.
}
\examples{
#make a palette
require(datasets)
#Select 5 colors
Mypalette<-palette.picker(n=5)
# plot an image with the new palette
image(x,y,volcano,col=Mypalette(1000))
}
