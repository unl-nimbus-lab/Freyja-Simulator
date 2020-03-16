# Freyja-Simulator

A high-fidelity physics simulator for multicopter systems, built within MATLAB/Simulink (TM) and SimScape (TM) frameworks.

Freyja has library elements that allow the simulation of dynamics and control for kinematic trees linking multicopters and various other objects (such as cables). Other regular objects, such as solids with various inertia properties, can be easily configured using built-in blocks from Simulink or SimScape.

## Usage
1. Create a working directory for your project (`myprojectspace`), and clone this repository inside.
2. Load the `.prj` file located within `myprojectspace/Freyja-Simulator/`. Double-clicking on it within the Matlab file explorer tab should load the project and its components.
3. Go back up to `myprojectspace/`. Start building your simulation world, add your custom elements and write your Matlab code inside `myprojectspace/`.

**Note:** the intended directory structure is such:
```
../myprojectspace/
......| Freyja-Simulator/
......| myworld1.slx
......| mygloriousfunction.m
......| myglamourousfile
```
That is, work within `myprojectspace/` and don't add custom files within `Freyja-Simulator/` (all required project elements are made available at your working project directory level).

> Hint: an example world with two multicopters, their controllers, a ground and some reference objects is included as `freyja-worlds/basic_worlds.slx`. You could quick-start by copying this file outside under `myprojectspace/`, and renaming it to something else.


## Dependencies
* Matlab and Simulink 2018a or later.
* The following toolboxes are _required:_
  * SimScape, SimScape Multibody
  * Aerospace blockset
  * Robotics System Toolbox
* Following toolboxes _might be fun:_ 
  * DSP Toolbox
  * Curve Fitting, Optimization, Global Optimization, Control System Toolbox
  * System Identification, Robust Control, MPC Toolbox.
..* ..

------------
(c) Nimbus Lab,
University of Nebraska-Lincoln, USA.

------------
#### Credits
Thanks to Dr John-Paul Ore for his [initial work on the model design](https://github.com/jpwco/uav-pendulum-simulation). The block architecture also borrows styles from Dr Peter Corke's [Robotics Toolbox](https://github.com/petercorke/robotics-toolbox-matlab). 
