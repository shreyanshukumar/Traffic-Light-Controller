# Traffic-Light-Controller
VHDL based design of sequential circuit for traffic light controller

Design Steps

1. Clock Division:
    The built in clock of Basys 3 FPGA board is of 100MHz. However we need each state for 20 seconds.
    So required frequence is 1/20 Hz.
    It can be accomplished by a counter of 32 bits as 31st bit toggles in every 21seconds
    
 2. States: 
    If we consider 2 Highways which corresponds to 4 lanes then corresponding states can be
    GRRR, GYRR, RGRR, RGYR, RRGR, RRGY, RRRG, YRRG say( S0,S1,S2.....s7)
    However S0 is for 40seconds and s1 is for 20 seconds and we are using clock with time period 20 seconds. 
    we need 4 dummy states to repeat s0,s2,s4,s6 for another 20 seconds.
    Thus we have used 12 states in all.
