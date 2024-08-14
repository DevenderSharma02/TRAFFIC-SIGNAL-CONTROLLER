
![image (1)](https://github.com/user-attachments/assets/ab416e10-2234-4536-a551-921e419a03ba)

# **𝐓𝐫𝐚𝐟𝐟𝐢𝐜 𝐒𝐢𝐠𝐧𝐚𝐥 𝐂𝐨𝐧𝐭𝐫𝐨𝐥𝐥𝐞𝐫 𝐮𝐬𝐢𝐧𝐠 𝐕𝐞𝐫𝐢𝐥𝐨𝐠** 🚦

A Verilog-based Traffic Signal Controller simulation project
## Project Overview
This project implements a Traffic Signal Controller for a four-way intersection using Verilog. The design simulates a real-world traffic management system, controlling the flow of vehicles based on timing logic. The project showcases the use of digital logic design principles and state machines to manage traffic efficiently.

## Table of Contents
- Introduction
- Features
- Design Overview
- Simulation and Testing
- Tools and Technologies
- Acknowledgments
  

## Introduction
Traffic signals play a vital role in maintaining order and safety at intersections. This project focuses on creating a digital traffic signal controller using Verilog, which can be used in embedded systems and VLSI design. The controller operates based on predefined timing sequences to control the signal lights, ensuring smooth traffic flow.

## Features
- Finite State Machine (FSM) Design: The controller uses an FSM to manage different states of traffic signals.
- Configurable Timing: The timing for green, yellow, and red lights can be easily modified in the code.
- Scalable Design: The design can be extended to more complex intersections or integrated with sensors for adaptive traffic control.

## Design Overview
The Traffic Signal Controller is designed as a state machine with the following states:

1. Green Light for North-South Direction
2. Yellow Light for North-South Direction
3. Green Light for East-West Direction
4. Yellow Light for East-West Direction
   
The state transitions are based on a predefined timer that controls the duration of green, yellow, and red lights for each direction.

## Simulation and Testing
The functionality of the Traffic Signal Controller was verified using a testbench written in Verilog. The simulation results confirmed the correct operation of state transitions and timing logic.

## Tools and Technologies
- Language: Verilog
- Simulation and Synthesis Tool: Xilinx Vivado
- Design Methodology: Finite State Machine (FSM)


