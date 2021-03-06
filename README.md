choosecolor
==========

Quickly choosing colors and making palettes in R can be a chore.
The functions in `choosecolor` are a simple set of functions 
which can help to rapidly select colors in R.  Using the "locator"
functionality in R, it enables an interactive way of selecting colors 
visually for use in R graphics. It is built to be lightweight and
depends on nothing but the base R installation. 

It's nothing fancy, just functional. 

## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/),
though there may one day be one. You can still  
download the [zip](https://github.com/MarcoDVisser/choosecolor/zipball/master) 
or [tar ball](https://github.com/MarcoDVisser/choosecolor/tarball/master).
Then decompress and run `R CMD INSTALL` on it, 
or use the **devtools** package to install the development version
(following code courtesy of [dasonk](https://github.com/Dasonk) ).

```r
## Make sure your current packages are up to date
update.packages()
## devtools is required
library(devtools)
install_github("choosecolor", "MarcoDVisser")
```

## Usage Examples

```r
# pick a color
mycol<-color.choose()

#make a pallete 
Mypalette<-palette.picker(n=5) 

# use your palette e.g.
Mypalette(10)

# Get more detail in choice with the color wheel
color.wheel()

```

# Screenshot
![](http://i.imgur.com/MjeOzly.jpg)

# Credits:
The inspiration for this comes from [dsparks](https://gist.github.com/dsparks/4021110),
[menugget](http://menugget.blogspot.nl/2013/01/choosing-colors-visually-with-getcolors.html#more)
and [aviadklein](http://aviadklein.wordpress.com/2010/05/21/color-choosing-made-easy/).
However I wanted to have similar functionality as the `color_picker.R` 
version from dsparks (or the other two) but without the heavy overhead (e.g. packages), with
more colors, and a simpler plot to pick from.
