These files make up a hand-written high speed parser for the Object Pascal dialect known as "Delphi."  The original work was done byt Martin Waldenburg in the late 1990s, and the project was abandoned sometime before 2003, when I found the code and began working on it.  I have kept it updated as necessary to work with my project, called "Castalia."

More information about Castalia can be found at http://www.twodesk.com/castalia.

To use the parser, you create a new class that descends from TmwSimplePasPar, and override the virtual methods for the various source code elements that you need to work with.  This parser does not produce a syntax tree or a symbol table, but unmodified, it will act as an acceptor for Delphi code.

!!!!! IMPORTANT !!!!!
One thing to note:  The file names are used in the Castalia product, which is incorporated into the Delphi IDE.  If you use this code in any Delphi IDE addin or components that will be installed into the Delphi IDE, you will need to change the names of the units to match your own project, or you will cause compatibility problems with other products.

Once again: YOU MUST CHANGE THE FILENAMES TO SOMETHING UNIQUE TO YOU BEFORE USING THEM.

Enjoy!

--Jacob Thurman
jacob@jacobthurman.com
http://www.jacobthurman.com
