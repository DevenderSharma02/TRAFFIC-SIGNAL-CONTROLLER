
![image (1)](https://github.com/user-attachments/assets/ab416e10-2234-4536-a551-921e419a03ba)

# **𝐓𝐫𝐚𝐟𝐟𝐢𝐜 𝐒𝐢𝐠𝐧𝐚𝐥 𝐂𝐨𝐧𝐭𝐫𝐨𝐥𝐥𝐞𝐫** 🚦

A Verilog-based Traffic Signal Controller simulation project
## Project Overview
This project implements a Traffic Signal Controller for a four-way intersection using Verilog. The design simulates a real-world traffic management system, controlling the flow of vehicles based on timing logic. The project showcases the use of digital logic design principles and state machines to manage traffic efficiently.

## Table of Contents
- Introduction
- Features
- Design Overview
- Simulation and Testing
- Tools and Technologies
  

## Introduction
Traffic signals play a vital role in maintaining order and safety at intersections. This project focuses on creating a digital traffic signal controller using Verilog, which can be used in embedded systems and VLSI design. The controller operates based on predefined timing sequences to control the signal lights, ensuring smooth traffic flow.

## Features
- **Finite State Machine (FSM) Design**: The controller uses an FSM to manage different states of traffic signals.
- **Configurable Timing**: The timing for green, yellow, and red lights can be easily modified in the code.
- **Scalable Design**: The design can be extended to more complex intersections or integrated with sensors for adaptive traffic control.

## Design Overview
This Traffic Signal Controller design is tailored to prioritize the main highway traffic while accommodating occasional vehicles from the country road. The system uses a sensor to detect cars on the country road and adjusts the traffic signals accordingly, ensuring efficient traffic flow.

### Key Components:
#### 1. State Machine:
The design is based on a finite state machine (FSM) with the following states:
- **S0**: Main highway green, country road red (default state).
- **S1**: Main highway yellow, country road red (transition when cars are detected on the country road).
- **S2**: Main highway red, country road green (cars from the country road are allowed to pass).
- **S3**: Main highway red, country road yellow (prepares to switch back to the main highway).
- **S4**: Main highway green, country road red (returns to default).
  
#### 2. Priority Mechanism:
- The main highway signal stays green by default (S0).
- When cars are detected on the country road (X = 1), the FSM transitions to S1, turning the main highway signal yellow and eventually switching to S2, where the country road gets a green signal.
  
#### 3. Input/Output Signals:
- **Inputs**:
  - **X**: Sensor input detecting cars on the country road (X = 1 when cars are present, X = 0 otherwise).
  - **Clock** signal for timing control.
  - **Reset** signal to initialize the system.
  - **Outputs**: Control signals for the red, yellow, and green lights for both the main highway and the country road.
    
#### 4. Timing Control:
- The delays during transitions (S1 to S2, S2 to S3, S4 to S0) are adjustable, allowing precise control over the duration of yellow and green lights during state changes.
  
#### 5. Reset Mechanism:
- A reset input brings the system back to the default state (S0), where the main highway light is green.
  
#### 6. Testbench:
- The design includes a testbench that simulates various scenarios, such as the presence and absence of cars on the country road, to verify the correct operation of the controller.
  
#### 7. Operation:
- **Default State (S0)**: The main highway light remains green, and the country road light is red.
- **Transition to Country Road Green (S1 to S2)**: When the sensor detects cars on the country road (X = 1), the main highway signal transitions to yellow (S1) and then to red, allowing the country road signal to turn green (S2).
- **Return to Default (S3 to S4)**: Once there are no cars on the country road (X = 0), the country road signal turns yellow (S3) and then red, while the main highway signal turns green again (S4), returning to the default state (S0).
- This design ensures that the main highway has priority but allows cars from the country road to pass when detected, with controlled delays for safe transitions. The sensor-based input and adjustable delays make the system flexible and adaptable to different traffic conditions.

## Simulation and Testing
The functionality of the Traffic Signal Controller was verified using a testbench written in Verilog. The simulation results confirmed the correct operation of state transitions and timing logic.

## Tools and Technologies
- **Language**: Verilog
- **Simulation and Synthesis Tool**: Xilinx Vivado
- **Design Methodology**: Finite State Machine (FSM)
