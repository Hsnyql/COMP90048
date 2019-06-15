myappend([], C, C).
myappend([A|B], C, [A|BC]) :- 
    myappend(B, C, BC).