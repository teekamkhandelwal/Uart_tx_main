# Uart_tx_main
Uart=Stands for Universal Asynchronous Reception and Transmission (UART)

A simple serial communication protocol that allows the host communicates with the auxiliary device.

UART supports bi-directional, asynchronous and serial data transmission.

It has two data lines, one to transmit (TX) and another to receive (RX) which is used to communicate through digital pin 0, digital pin 1.

# noraml Uart protocoal packet-

![image](https://user-images.githubusercontent.com/72481400/118706125-a3c0d300-b836-11eb-8eb0-570e9d253bf7.png)

# My Design Specification-
A simple UART_tx  for use in an FPGA as a debug engine.  Requires a 100MHz input clk.

![image](https://user-images.githubusercontent.com/72481400/118713084-2a79ae00-b83f-11eb-9932-5a37e356ba79.png)


in my design perity bit is not used. 

start bit-1bit.

data bits-8bits.

stop bits - 1bit.

![image](https://user-images.githubusercontent.com/72481400/118707251-edf68400-b837-11eb-93be-16aded833837.png)


# input signals-
trig

reset

clk

8-bit data input

# states
 have 11 states - idle, stsrt,st0,st1,st2,st3,st4,st5,st6,st7,stop

![image](https://user-images.githubusercontent.com/72481400/118707293-f77fec00-b837-11eb-9b5e-6d115b6c6ef2.png)


# output signal
tx

# working
when rst=1, then signal is going to idle state where  tx=1.

after rst=0 and trig=1, then signal goes to start signal, tx=0.

and then passing the data_in 8 bit till st0 to st7 .

after st7 it is go to stop state if here trig=1, its mean next data is avialabel then its go to statr state and repeat this again
and id trig=0; then ti is stable in stop state

default is idle state

# simulation waveform 
1) when one data is send

![image](https://user-images.githubusercontent.com/72481400/118707438-2ac27b00-b838-11eb-8e2b-450eda906806.png)


2)when continue two set of data send

![image](https://user-images.githubusercontent.com/72481400/118712416-63655300-b83e-11eb-85f8-e248384a6457.png)

