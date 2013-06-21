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
#make a pallete
require(datasets)
#Select 5 colors
Mypalette<-palette.picker(n=5)
# plot an image with the new palette
image(x,y,volcano,col=Mypalette(1000))
}

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
   color.wheel allow greater detail in color selection compared to
   color.choose(). The user first chooses the color and then the 
   lightness of the color.
}
\examples{
# Get more detail in choice with the color wheel
mycol<-color.wheel()
plot(rnorm(100),col=mycol)
}

