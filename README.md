# README

## To run
`ruby start.rb`

## To run tests
`rspec`

## Commands

The editor supports 7 commands:

* I M N. Create a new M x N image with all pixels coloured white (O).
* C. Clears the table, setting all pixels to white (O).
* L X Y C. Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C. Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C. Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* F X Y C. Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
* S. Show the contents of the current image
* X. Terminate the session

## Approach

* I've left my notes in as comments

* ambiguous variable naming of x, y, c has been kept to match the brief, see top level comments

I wanted to go with a command pattern approach, any editing software is prime use case for such.
However, I left the full pattern somewhat unfinished due to no use for undo in the spec, it is however ready
to implement (just add undo command and then an undo method on all the command objects).
Because of this the program makes use of service objects instead.

For the tests, I've unit tested the core command service objects. Full BDD/integration test could (and should ideally)
be done, testing the user input and software output as a whole as well. I had run out of time at this point.
I used RSpec because I prefer the syntax and some it's helpful methods (#let, #change).

frozen_string_literal comments added for older ruby versions.
