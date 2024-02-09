V1.1 only supports upper case English alphabet letters (ASCII 65-90). 

A maximum of 13 characters can be printed onto the matrix ("WELCOMEBAAACK")

Only non-empty strings print as expected


<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/WELCOME.jpg" width="350" title="WELCOME image">
</p>
<h1 align = "center"> 🔆Ripes String Print V1.1🔆 </h1>


## 1️⃣Installing Ripes

Information on Ripes can be found here: https://github.com/mortbopet/Ripes

Download the correct version of Ripes for host OS using https://github.com/mortbopet/Ripes/releases/latest.

## 2️⃣Setting up Ripes

Now that you have Ripes installed, go ahead and launch it. You will be greeted with a screen like shown below.

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure1.jpg" width="750" title="Ripes main screen">
</p>
On the left side of Ripes, the vertical grey bar contains different tabs. These tabs, when selected, are highlighted with a light shade of grey. The editor tab is where the program loaded into Ripes is displayed. The editor and processor tabs also house the console which allows the user to input data and receive output.

To be able to run the program, you will need to set up the output device. Afraid not! This section will guide you step by step.

[1]: Locate the I/O tab on the left side of Ripes. The button that takes you to the tab looks like this (See image below)

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure2.jpg" width="150" title="Ripes I/O button">
</p>
[2]: In the I/O tab,you will see to the left of your screen, a menu named “Devices”. Double click on “LED Matrix” option to instantiate a new matrix. You should see a matrix appear in the centre portion of your screen. 

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure3.jpg" width="750" title="Ripes I/O tab">
</p>
[3]: Locate the peripheral selector which is located to the top right corner in the I/O tab. Below the explanatory text, you will see a “Parameters” menu, change the height and width parameters to 8 and 80 respectively. You may also increase the LED size parameter to a larger or smaller value as you wish.

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure4.jpg" width="350" title="Ripes peripheral selector">
</p>

## 3️⃣ Loading up the program

Now that you have the environment set up, you can now proceed with loading the program into Ripes for execution.

Locate the menu bar to the top of the Ripe swindow,click on it to bring a drop-down menu. Click on “Load Program”. (See image below)

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure5.jpg" width="250" title="Ripes peripheral selector">
</p>

In the pop-up window,the first option you will see is “File type”. Choose “Source file” by clicking on it. For the second option “File”, click on “Open...” and locate the assembly file you downloaded. Click te “OK” button to confirm your choices.

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/00f33ab4b875f4204c0cce1966ea8cd43a90cc09/img/figure6.jpg" width="350" title="Ripes load program window">
</p>

## 3️⃣ Executing the program

You will be modifying a string stored at a label to print it onto the LED matrix display. Ways to modify said string and disclaimers will be explained further.

Before executing the program, head back to the I/O tab if you have navigated away from it. Locate the pop-out button for the LED matrix you had previously instantiated in step 2️⃣. Clicking once on the pop-out button pops out the LED matrix from its window and allows you to have it floating on top of Ripes so long as you have it open. (See image below)

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/ad87f7dc47aae86f0929febcd3efb0328f9a1a39/img/figure7.jpg" width="750" title="Ripes LED Matrix popped out">
</p>

Now, you can go back to the editor tab which contains instructions for the assembly program. Go ahead and run the program by clicking on the >> button. (See image below for green highlight)

<p align="center">
  <img src="https://github.com/yusufkenaroglu/RIPES-String-Print-v1.0/blob/f9aa552bf41613be1c91847444daea9f575944af/img/figure8.jpg" width="500" title="Ripes LED Matrix popped out">
</p>

Without changes to the original program, you should see "WELCOME" get printed on the display letter by letter. The program (for V1.1) stops execution once all letters are printed.
