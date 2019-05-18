# Vincent-Van-Proc
Trying to create an animated version of The Starry Night using Processing.

### How can I make a custom drawing in it?
First of all, you should empty the *curves* folder in the *Reader* folder (lots of folders there) and remove all items from the *curves* array in *Reader.pde*. The *Reader* sketch exports a curve (you draw it with your mouse) to a *.txt* file. This file should declare the color of the curve (in the RGB format) in its first line of text (values should be separated with commas and spaces, e.g. 20, 60, 255). Once you have that file, you just need to put it inside the *curves* folder, declare it in the *curves* array (with the file extension, e.g. *"curve.txt"*) in *Reader.pde* and *voilà*! You have now added your very first curve to your new project! Wasn't it exciting? I'm sure it was.

Thank you for visiting my repo! I hope you liked it,  because my arts teacher surely does!
