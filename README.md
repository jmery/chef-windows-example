# default

Simple Chef + Windows example.  This is a development example meant to showcase Test Kitchen, Vagrant, Windows, DSC, and InSpec.

On `kitchen converge`, kitchen will pull down a Windows 2012R2 image from HashiCorp, install the FourthCoffee website using DSC (default), and test the result.

This requires both the ChefDK and VirtualBox to be installed on the workstation.
