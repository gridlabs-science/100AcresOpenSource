# 100 Acres Hashbox Community Manual
This repository is a community developed design and operations manual for the 100 Acres Ranch S19 Hashbox.  This has been created by individuals with experience building and opererating one of these systems.  The goal is to make it easier for anyone to tackle these builds with confidence, avoid beginner mistakes, and get the most hashpower out of their Hashbox.  

We will try to keep this manual up to date, but as 100 Acres software changes there may be slight differences between the latest software settings and this manual.

**Disclaimer: All the information on this Github is provided for the purpose of decentralizing solar Bitcoin mining technology, and without warranty.  Use this manual at your own risk.**


## System Overview
The S19 Hashbox is a system that aims to be one of the most cost-effective, efficient, and flexible technologies for turning solar energy into Bitcoin using a standard Bitmain S19 machine.  It consists of:
- a weatherproof metal box
- supercapacitor
- S19 mounting brackets
- exhaust ducts
- PWM solar charge controllers capable of 400A (MPPT upgrade coming soon!)
- a Victron current shunt and high power relay
- hydraulically crimped high current cables for the ASIC and batteries
- a Loki kit from Pivotal Pleb Tech to modify the ASIC control board to accept direct DC power
- and a RaspberryPi.  This Pi runs the proprietary code for tuning the miner hashrate based on solar power available.  

### Why solar?
It is worth considering at the outset what your goals are for this project.  Everyone's exact goals and situation is different, and this should guide how each person designs and builds out their system.  Here are a few considerations:
- ROI:  It is possible, though difficult, to achieve a good ROI without forking out for the latest generations ASICS.  Spending capital on power infrastructure that should last 20 years instead of new-gen ASICs wich depreciate after only a few years could be an interesting strategy depending on your business details and risk profile.  If ROI is your goal, it is paramount to keep costs under strict control, and to carefully model your predicted solar production.  Sourcing cheap solar panels will likely be the biggest hurdle.
- Learn about solar technology:  Solar is the most naturally decentralized energy source.  Building one of these systems will allow you to learn about panels, voltage-current curves, lithium battery charge profiles, and high current DC power systems.
- Fully self-sovereign hashpower: Own your power source.  This is perhaps the best reason for taking on this challenge.  With one of these systems, you will be able to continue to project power defending freedom money regardless of hashprice and without anyone's permission.  Stealth mining is technically possible with micro-scale miners like the Bitaxe, but with a full size solar Hashbox you will control 100-200x more sovereign, permissionless, and upgradeable hashpower.

### Requirements
In addition to the Hashbox, you will need:
- At least 400AH of 12V LifePo4 batteries (600-800AH is better)
- A good sunny spot for the solar panels
- For PWM charge controllers (current model), at least 300A of solar panels (using Imp spec.  See detailed panel discussion below)
- For MPPT charge controllers (coming soon), aim for at least 4.5kW
- Enough wire to connect all the panels.  This is highly dependent on your specific setup and space requirements.  MPPT controllers can use higher voltage series configurations and smaller guage wire, which reduces costs
- crimping tools for the solar wire, and connectors
- Some kinda of battery housing
- Solar panel mounting system (frames, trackers, roof mount, etc.)
- WiFi extender for the miner (Vonets or similar), or a wired connection
- some kind of stand for the hashhbox.  The air intake and wire routing is on the bottom, so there needs to be some open space in the middle for air and wires.  The box should be supported on the sides, with room in front to swing open the door

## Planning and Design
Here's a few things to think about in the initial planning phases.  

You'll need to find enough space.  Maybe you have 100 acres and this part is easy.  If you're using a roof or a sunny porch, then measurements become more critical.  How many panels can you fit?  Will that be enough?  What angle will the panels be at?  Do you have room for trackers (see section below). 

*A note on running underpowered systems:  The S19 Hashbox absolutely can be run with less than 4.5kW of panels.  However, this may require either significantly underclocking your ASIC (which reduces j/TH efficiency), or running fewer than 3 hashboards.  If you do not have the space or capital for 4.5kW of panels, the forthcoming 100 Acres Ranch FAFO box is likely to be a better option.  Operation of the FAFO box is almost identical to the full size box described in this manual, just scaled down for a single S19 hashboard or S9.*

## MORE TO FOLLOW (Manual is a work in progress)...