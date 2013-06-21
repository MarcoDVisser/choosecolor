\name{color.choose}
\alias{color.choose}
\title{Choose colors interactively from a grid}
\usage{
  color.choose(detail,pick)
}
\arguments{
detail: an integer specifying the NxN dimensions of color grid.
		large values may slow down the process. Defaults to 200.

pick: logical, whether or not the user should be allowed to select a 
	  color. If pick == FALSE locations of the colors are return.
	  This is useful if you want to pick colors from another
	  application
}

\description{
  Color.choose helps to quicky select colors from a grid for usage in R
  graphics.
}
\examples{
# pick a color
mycol<-color.choose()
plot(rnorm(100),col=mycol)
}
