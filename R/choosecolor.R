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
#  
#  

# This function plots a decent selection of colors in a grid
# then allows the user to pick n colors, and returns the respective
# Hex code. This version gives a much prettier grid of colors 
# using Hue and lightness values than the older color.pick function.
# Usage: color.choose 
# detail = smoothness of color chart
# pick = logical, should the function return a hex code of the color picked
# or just return the locations of the colors (for use in other functions).

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

# The following function lets you choose a range of colors 
# to convert to a palette function
# usage: MyPallete<-palette.picker()
# n = number of colors to pick for your pallete
# detail = smoothness of color plot (large values may slow the process
# 		   down considerably.
# 

# Note this is the quick and dirty version which can be 
# made much more efficient

palette.picker=function(n=6,detail=100){

ColPick<-character(n)

	for (i in 1:n){
	ColPick[i]<-color.choose(detail=detail,pick=TRUE)
	}

	colorRampPalette(ColPick, space = "Lab")
}

# Helper function for color.wheel, plots a color wheel


plotWheel<-function(Colcode,radius=0.5,detail,arrowloc,
arrowcol){
	par(mar=c(0,0,0,0))
	plot(0,0,type='n',fg='white',xaxt='n',yaxt='n',xlab='',ylab='')
	# Color radians (think of a color wheel)
	x<-seq(-pi,pi,length.out=detail)
	points(x=radius*sin(x),y=radius*cos(x),lwd=50,col=Colcode)
	arrows(0,0,arrowloc[1],arrowloc[2],lwd=2,col=arrowcol)
}


# The following function, plot a color wheel,
# and gives even more control on the
# level of color detail that can be chosen.
# First it lets the user choose a color
# Then it allow further detail on lightness levels 
#

# usage: color.wheel()
# detail = smoothness of color plot (large values may slow the process
# 		   down considerably.
# 

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
	cos(atan2(pick$x,pick$y))*sqrt(pick$x^2+pick$y^2)*0.85)

	plotWheel(Colcode=ColVals,radius=0.45,detail=detail,
	arrowloc=newarrowloc,arrowcol='grey')

	print("Choose a lightness")
	pick<-locator(1)
	LightValPick<-findInterval(atan2(pick$x,pick$y),x)
	return(ColVals[LightValPick])
}

# R color name picker, very simple color picker
# returns the R color names from the list of colors in 
# colors()

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
