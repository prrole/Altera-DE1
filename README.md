# Altera DE1 bring-up and experiments
I got an Altera  DE1 board several years ago, and it has not been doing much other than collecting dust since.

I suspect there are a lot of other people in a similar situation, and hope this repo eventually will be 'pull&play'

#My setup
* Centos 6 64 bit runing in a VirtualBox
* Quartus II 64-bit version 13.0 SP1 - this is the last version of Quartus supporting the FPGA in the Altera DE1.  Should be available from http://dl.altera.com/13.0sp1/?edition=web

This setup is choosen as it seems to be the path of least resistance.  I want to learn VHDL, not necessarily become a Quartus expert..

#Tips & Tricks
* USB-Blaster issues

 run ```./altera/13.0sp1/quartus/bin/jtagd --foreground --debug``` before starting Quartus


#Links & Resources
*  [The CD ROM](http://www.terasic.com/downloads/cd-rom/de1/) 
*  [VHDl tutorial from Altera tailored for the DE1 board] (ftp://ftp.altera.com/up/pub/Altera_Material/13.0/Laboratory_Exercises/Digital_Logic/DE1/vhdl/ )
*  Free Altera training, VHDL Basics (OHDL1110)  
  *  http://wl.altera.com/education/training/courses/OHDL1110 /
  *  http://wl.altera.com/customertraining/webex/VHDL/presentation.html
* [VHDL Beautifier, Formatter](http://g2384.github.io/work/VHDLformatter.html) - great for reading code from others
