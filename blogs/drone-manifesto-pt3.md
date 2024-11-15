### The Drone Manifesto, Part III

This document is a work-in-progress thesis representing the evolution of my thoughts on Drone design, manufacturing, and commercial applications.

## Part III: Open Source Paradigms

I view open source paradigms as a solution to the issues raised in parts I and II.

Bitcraze’s platform uses an open source OS that links together firmware from microcontrollers. It is easy to build off of and can be highly customized. On the hardware side, they have a bunch of microcontrollers that serve as additional features that can be optionally added to the drone via a 20-pin setup. However, Bitcraze is not interested in the commercial market and releases the drone primarily for experimentation/research purposes only. The limited size of the drone and processing power of the STM/expansion microcontrollers is limited, and there is not enough support to design custom microcontroller decks. Any microcontroller added to the platform will have to be connected via the 20 pin setup, so unless there is an existing PCB compatible with these pins then it’s going to be hard to attach new hardware.

Ardupilot and PX4 are both open source software operating systems for the drone, but each has a list of supported hardware. The advantage of that is that one can design a custom drone leveraging only Ardupilot or PX4-supported parts, but there lacks a consistent, integrated solution that would enable a base drone to be delivered with the right amount of sensors for most tasks and the necessary amount of open source operating system software. Furthermore, there is no way to easily add microcontrollers without screwing with other hardware components that themselves might not be compatible with each other.

Perhaps the ideal solution here is to start with an open source operating system that allows a high degree of customizability, add in proprietary autonomy features that are top of the class, and (eventually) come up with a flexible hardware setup that is functional and contains a multitude of sensors in its own right, yet has the ability to add in unmodified microcontrollers super easily. For commercialization (and beating DJI on the commercial side), it is important to construct a community revolving around the open source software with new features to be implemented by the community and a strong technical support team. 
