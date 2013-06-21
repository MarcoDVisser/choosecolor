
\name{color.wheel}
\alias{color.wheel}
\title{Choose a color interactively from a color wheel}
\usage{
  color.wheel(detail)
}
\arguments{
detail: an integer specifying detail within the color wheel.
		large values may slow down the process. Defaults to 200.
}

\description{
   color.wheel allows greater detail in color selection compared to
   color.choose(). The user first chooses the color and then the 
   lightness of the color.
}
\examples{
# Get more detail in choice with the color wheel
mycol<-color.wheel()
plot(rnorm(100),col=mycol)
}


