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
Find the relavent functions in /src.

And if you are really going to use it often (like me) just add it to 
your .Rprofile!
 
Usage 

```r
# pick a color
mycol<-color.choose()

#make a pallete 
Mypallet<-pallette.picker(n=5) 

# use your pallete e.g.
Mypallete(10)
```
