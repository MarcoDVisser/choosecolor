choosecolor
==========

The functions in `choosecolor` are meant to help find colors in R. 
It's nothing fancy, just functional.

Quicky choosing colors and making pallets in R can be a chore.
This is a simple set of functions to help choose colors in R,
using the locator functionality in R.

Credits:
The inspiration for this comes from [dsparks](https://gist.github.com/dsparks/4021110).
However I wanted to have similar functionality as the `color_picker.R` 
version from dsparks without the heavy overhead (e.g. packages), with 
more colors, and a simpler plot to pick from.

## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/),
and I don't think there ever will be. You can 
download the [zip ball](https://github.com/MarcoDVisser/choosecolor/zipball/master) 
or [tar ball](https://github.com/MarcoDVisser/choosecolor/tarball/master).
Then decompress and run `R CMD INSTALL` on it, 
or use the **devtools** package to install the development version
(following code courtesy of [dasonk](https://github.com/Dasonk).

```r
## Make sure your current packages are up to date
update.packages()
## devtools is required
library(devtools)
install_github("findPackage", "Dasonk")
```

Or find the relavent functions in /src and just 
add the source code to your .Rprofile!
 
Usage Examples

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
