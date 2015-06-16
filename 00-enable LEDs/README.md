A Hello World of sorts
===========

Objectives
-----------
* Make a new Quartus Project
* Access LEDs on the DE1 by name
* Test that the .gitignore is working
* Figure out naming/top-level stuff
* Investigate standard naming/formatting

Findings
--------
* New Project Wizard
 * Working Directory is what it says
 * To keep it simple, it's probably best to use same name for project, top-level entity, and vhd file containing the top-level entity
 * Choose Cyclone II , EP2C20F484C6

* If you mess up or want to be fancy, you can manually set top-level entity by doing
 * Assignments -> Settings General -> Top-level entity
 
* Import port names by doing
 * Assignments -> Import Assignments -> navigate to the CSV file made for the DE1 board
 

* I spent a lot of time with syntax errors and formatting, I tried the VHDL plugin for Eclipse by Sigasi
 and it helped me spot errors without trying to compile the file.  It will also reformat your code to look nice.  You may consider skipping this if you haven't used Eclipse before.

Resources
---------
* A nice powerpoint with the basics of starting a new project, http://www.ee.bgu.ac.il/~adcomplab/Serge/DE1%20and%20Quartus.ppt
* The sigasi Eclipse plugin, http://www.sigasi.com/install-eclipse-vhdl-plugin 

