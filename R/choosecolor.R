#  choosecolor.r
#  
#  Copyright 2013 Marco Visser <marco.d.visser@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

##' color.choose
##'
##' color.choose helps to quickly select colors from a grid for usage in R
##' graphics. See the example below for usage details. This version gives a
##' much prettier grid of colors in a range of hue and lightness values compared
##' to the simpler color.pick function.
##'
##' @title Choose colors interactively from a grid
##' @param detail an integer specifying the smoothness of color chart.
##' In essence it gives the NxN dimensions of the displayed color grid,
##' which in turn dictates how many colors are displayed. Large values may slow
##' down the process. Defaults to 200 (40 000 colors).
##' 
##' @param pick logical, whether or not the user should be allowed to select a 
##' color. If pick == FALSE locations of the colors are returned.  This may be
##' useful if you want to pick colors from within another
##' function.
##' @author Marco D. Visser
##' @examples
##' # pick a color
##' mycol<-color.choose()
##' plot(rnorm(100),col=mycol)
##' @export
color.choose<-function(detail=100,pick=TRUE){
	# dimensions
	N<-detail
	#Values
	values<-seq(0,1,length.out=N)

	# colorgrid
	locations<-expand.grid(1:N,1:N)

	#loop over all hues
	ColVals<-sapply(1:N,function(X) hsv(h=values[X],s=1,v=values))

	ColGrid<-matrix(ColVals,ncol=N,nrow=N)
	par(mar=c(0,0,0,0))
	image(1:N,1:N,t(matrix(1:N^2,ncol=N,nrow=N)),col=ColGrid)

		if(pick==TRUE){
		pick<-locator(1)
		 dist<-apply(locations,1,
		 function(X) sqrt((pick$x-X[2])^2+(pick$y-X[1])^2))
		 
		 return(ColVals[which(dist==min(dist))])
		}
	else {return(cbind(ColVals,locations))}
}

##' palette.picker
##'
##' palette.picker aids in the selection of colors from a grid
##' and builds a palette with colorRampPalette for usage in R
##' graphics.  See the example below for usage details. 
##'
##' @title Choose a palette interactively from a grid
##' @param n an integer specifying how many colors to make a pallete from.
##' @param detail an integer specifying the smoothness of color chart.
##' In essence it gives the NxN dimensions of the displayed color grid,
##' which in turn dictates how many colors are displayed. Large values may slow
##' down the process. Defaults to 100 (10 000 colors).
##' 
##' @author Marco D. Visser
##' @examples
##' load volcano data
##' data(volcano)
##' #Select 5 colors to make a palette
##' Mypalette<-palette.picker(n=5)
##' create an image with the new palette
##" image(x,y,volcano,col=Mypalette(1000))
##' image(volcano,col=MyPallete(1000))
##' @export
palette.picker <- function(n=6,detail=100){

  ColPick<-character(n)
  
  for (i in 1:n){
    ColPick[i]<-color.choose(detail=detail,pick=TRUE)
  }
  
  colorRampPalette(ColPick, space = "Lab")
}

## Helper function for color.wheel, plots a color wheel
## @param Colcode a vector of color codes
## @param radius specific the size of the wheel (and arrows)
## @param detail color detail on wheel
## @arrowloc color location of arrow
## @arrowcol arrow color
plotWheel<-function(Colcode,radius=0.5,detail,arrowloc,
arrowcol){
	par(mar=c(0,0,0,0))
	plot(0,0,type='n',fg='white',xaxt='n',yaxt='n',xlab='',ylab='')
	# Color radians (think of a color wheel)
	x<-seq(-pi,pi,length.out=detail)
	points(x=radius*sin(x),y=radius*cos(x),lwd=50,col=Colcode)
	arrows(0,0,arrowloc[1],arrowloc[2],lwd=2,col=arrowcol)
}



##' color.wheel
##'
##'  color.wheel allows greater detail in color selection compared to
##'  color.choose(). The user first chooses the color and then the 
##'  lightness of the color.
##'
##' @title Choose a color interactively from a color wheel
##' @param detail an integer specifying the smoothness of color chart.
##' In essence this specifies the number of colors plotted on the wheel
##' (large values may slow the process down considerably).
##' @author Marco D. Visser
##' @examples
##' # Get more detail in choice with the color wheel
##' mycol<-color.wheel()
##' plot(rnorm(100),col=mycol)
##' @export
color.wheel<-function(detail=200){

                                        #Values
  x<-seq(-pi,pi,length.out=detail)
  values<-seq(0,1,length.out=detail)
  HueVals<-sapply(1:detail,function(X) hsv(h=values,s=1,v=1))
  
                                        #plot color wheel
  plotWheel(Colcode=HueVals,radius=0.65,detail=detail,
            arrowloc=c(0,0.5),arrowcol='white')
  
  print("Choose a color")
  pick<-locator(1)
  HueValPick<-values[findInterval(atan2(pick$x,pick$y),x)]
                                        # Reset color values
  ColVals<-sapply(1:detail,function(X) 
                  hsv(h=HueValPick,s=1,v=values))
  
                                        #Replot color wheel
  par(new=T)
  newarrowloc<-c(
                 sin(atan2(pick$x,pick$y))*sqrt(pick$x^2+pick$y^2)*0.85,
                 cos(atan2(y= , x= )(pick$x,pick$y))*sqrt(pick$x^2+pick$y^2)*0.85)
  
  plotWheel(Colcode=ColVals,radius=0.45,detail=detail,
            arrowloc=newarrowloc,arrowcol='grey')
  
  print("Choose a lightness")
  pick<-locator(1)
  LightValPick<-findInterval(atan2(pick$x,pick$y),x)
  return(ColVals[LightValPick])
  
}

##' color.pick
##'
##' color.pick allows a user to quickly select a color from
##' a list of R color names. This function is depreciated and
##' may disappear in subsequent version of the package. 
##'
##' @title Pick colors interactively from a named list
##' 
##' @author Marco D. Visser
##' @examples
##' # pick a color
##' mycol<-color.pick()
##' plot(rnorm(100),col=mycol)
##' @export
color.pick<-function(){
                                        # colors
  ColVec<-colors()
                                        # dimensions
  N<-ceiling(sqrt(length(ColVec)))
  filler<- rep("white",(N^2)-length(ColVec))
                                        # colorgrid
  locations<-expand.grid(1:N,1:N)
  ColGrid<-matrix(c(ColVec,filler),ncol=N,nrow=N)
  par(mar=c(0,0,0,0))
  image(1:N,1:N,t(matrix(1:N^2,ncol=N,nrow=N)),col=ColGrid)
  pick<-locator(1)
  dist<-apply(locations,1,
              function(X) sqrt((pick$x-X[2])^2+(pick$y-X[1])^2))
  return(ColVec[which(dist==min(dist))])
}
