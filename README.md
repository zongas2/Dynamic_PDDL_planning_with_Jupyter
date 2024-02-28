# Dynamic PDDL planning with Jupyter:

This is an attempt to bypass expressiveness limitations imposed in the traditional PDDL representation version. The current version of the tool aims to simulate emergent situations and dynamics at random instances during the execution of the initially calculated plan. This way stochasticity and unexpected events could be handled by a dynamically assigned PDDL parser data object, which complies with the closed world assumption by its design. These become feasible in the expense of generality and replicability since the specific twicking events are problem and domain specific.

The current framework implements user/code specified events at random plan execution steps, which consequently lead to reseting the parser object appropriately and regenerate the solution plan based on the newly observed situation. Two uninformed (blind) search algorithms have been implemented for demonstration purposes only: Breadth First Search and Depth First Search. However, the intention is to continue populating the list of implemented search algorithms furthermore, enabling thorougher benchmarking tests and comparative analysis.

More specifically, the PDDL parser provides access to Python set objects as its internal variables which constitute the definition of the specific planning problem (set of actions, set of initial facts, set of goal facts, set of objects, etc.). The inputs to the PDDL parser are handled through the Jupyter Notebook, comprising the usual two representations of the domain and problem in PDDL syntax.

Specifically, in an attempt to model more realistic aspects of relevant real-life missions, this framework focuses on a fully observable container stacking environment deploying autonomous vehicles with an on-board attached crane, in a 2D grid map which can immitate a large variety of swarming problems. The domain considered for the implementation is included in '..\examples\dwr\dwr2.pddl' directory and has been derived by reengineering the traditional Dock-Worker-Robot domain (see '..\examples\dwr\dwr.pddl'). The problem setup considers a fully observable environment by a centralised programming BDI rationale agent. Currently any additional vehicle that may participate in the mission at execution time presents homogeneous attributes with every other. Moreover, each situation could be also evaluated based on the assumption of a limited visibility for all operating autonomous vehicles. Finally, a function calculating each location coverage levels by the synergetic vehicles has become available also for heuristic search and reinforcement learning applications. 

In practise the PDDL parser became available by minorly adapting the functionality developed by the user: [meneguzzi](https://github.com/meneguzzi/meneguzzi-final-projects/commits?author=meneguzzi) in the following URL: https://github.com/pucrs-automated-planning/pddl-parser.

This work has been part of my Master-of-Science thesis on Artificial Intelligence, in the Computer Science Department of the Aristotle University of Thessaloniki, Greece.

# Source:
The source code was implemented based on Python 3.8 system interpreter version for Windows since during its implementation version 3.8.10 was the most appropriate and stable. The selected IDE considered Jupyter Notebook for Windows as well; for its overviewing simplicity and sequential cell-based structure. The source code in Jupyter Notebook is comprised by 49 self-contained cells which span in total up-to almost 1000 code rows. These 49 cells can be categorized in three high-level groups:

- **Cells 1-14:** contain the general purpose implemented code; which corresponds to the functions and scripts able to handle the appropriate data objects in Python for the underlying PDDL parser class as well as the compliant implementation of basic search algorithms for demonstration purposes.
- **Cells 15-46:** contain the domain-specific code; which corresponds to the functions used for simulating unexpected events that affect the state (agent's beliefs) and goal (agent's desires) of the planning problem during the stepwise active/valid plan execution (number of operational vehicles/robots, number of different object types, number of available locations, etc.).
- **Cells 47-48-49:** include the main script code which calls in the appropriate order/sequence the above mentioned functions to generate the initial plan, execute it step-by-step, impose fact/object changes at random moments and replan based on the newly observed situation.
