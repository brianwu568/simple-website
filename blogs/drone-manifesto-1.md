### The Drone Manifesto, Part I

This document is a work-in-progress thesis representing the evolution of my thoughts on Drone design, manufacturing, and commercial applications.

## Part I: What actually moves the needle?

If we are thinking about building the best drone from a hardware perspective, we would need to optimize for the following:
- A more durable structure
- Longer battery life/higher battery capacity
  - Correlated with higher range
- Propulsors with higher efficiency and power
- Better onboard compute architectures, for instance an NVIDIA Jetson Orin dev kit or nano
  - Can enable onboard LiDAR or visual SLAM
- A more comprehensive suite of sensors, including but not limited to:
  - Imagers
    - Optical, UV, Thermal
  - LiDAR
    - Useful for SLAM
  - Audio
    - May not be that useful if the noise emitted by the propulsors is high
  - Control Oriented:
    - Magnetometer
    - Gyroscope
    - Barometer
    - Accelerometer
    - ToF optical
    - UWB communications

Having upgraded hardware in this sense is undoubtedly a nice to have. But for the percentage of applications in which drones are currently being used/have the potential to be used more in the future, is this truly a need to have or a nice to have?

There are arguments to be made about the software side as well. While drone software is itself more difficult to develop than traditional software products due to the intricacies that arise within developing robust robot control and Artificial Intelligence/autonomy applications, it still is a less complex problem than developing a new hardware architecture from scratch.

For example, if the problem statement is “reducing the cognitive burden of those who are operating drones,” then this is likely to be much more of a software problem than a hardware problem. No matter how good I make the drone’s hardware, if I’m still requiring a manual operator and/or another person to interpret the data that the drone is collecting and make subsequent decisions based off of that, the cognitive burden problem is not being solved at all. Conversely, a solution that does move the needle can be built off of an existing solution but with software that is more capable and runs more efficiently. This would be a class of solutions that enables easier, more intuitive operations, while providing sufficient intelligence and autonomy to allow drones to make some or all operational decisions on their own.

I believe that a solution that solves the cognitive burden problem encompasses the following:
- A much more simplified control interface
    - Problem: Most drones require physical operation via a controller that must be held in both hands. This is often unwieldy, and requires a person’s full attention to be focused on controlling the drone itself. For untrained operators, there is a high learning curve as many quadcopters can be extremely sensitive to control inputs, and loss of control is a potential concern.
    - Solution: For the vast majority of drone operations, there are defined starting and ending states, which can be specified as objectives. A drone will need to perform a sequence of actions (and perhaps achieve some intermediary states) en route from the initial state to the final state. The most simplified drone control system involves specifying a high level objective which describes the end state, and a verifiably correct sequence of actions and feedback loops can be generated and executed. Besides specifying the initial objective, the user doesn’t really need to do anything else.
- Analysis and interpretation of sensor outputs
    - Problem: If a drone is difficult to control, then operating the drone may actually require more than one person to control because interpreting the sensor outputs for objects/activity of interest may require sufficient cognitive resources that an operator who is controlling the drones full time may not be able to accomplish. In this case, there might be a second person whose job is solely to interpret sensor outputs and offer fast recommendations on the next action to take.
    - Solution: This aspect of threat detection and decision making can be abstracted within the drone’s internal autonomy: for instance, in the visual modality, grounding and segmenting models can work together to identify objects that the user is requesting the drone to look out for. These objects will be detected and analyzed in images/video streamed from the drone, and based on the orientation/distance of these objects relative to the drone, the drone can take the relevant actions based on this.
      - For instance, if a drone is flying a defensive position around a target, it could detect something interesting, figure out where that object is, and switch to flying an offensive position around the target, thus investigating it further.

Key points relating to this paradigm indicated by customers:
  - Computational overload is happening with current technology. Tools are not sufficiently simple or smart and are often more of a distraction.
  - Iterative improvements are not attractive. What needs to happen is a complete paradigm shift that changes the way we interact with robots.

A recent interview with a potential customer in the DoD revealed that they were sorely disappointed with drone offerings by US based companies (they are not allowed to use any foreign made products due to DoD restrictions). When given the opportunity to try out a DJI drone, however, they were amazed by its construction, quality of autonomy software, as well as the relatively cheap prices compared to U.S. alternatives (likely due to strong R&D + commercialization subsidies by the Chinese Government).
