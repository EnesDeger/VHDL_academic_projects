# 🔌 VHDL Academic Projects

A collection of VHDL designs developed as part of the **Digital Systems** coursework at **Hacettepe University, Department of Electrical & Electronics Engineering**.

All designs are written in synthesizable VHDL and simulated using Xilinx Vivado.

---

## 📁 Repository Structure

```
VHDL_academic_projects/
├── Sources/          # VHDL source files (.vhd)
│   ├── *.vhd         # Design units (entity + architecture)
│   └── *_tb.vhd      # Testbench files
└── Sim/              # Simulation outputs and waveforms
    └── *.wcfg        # Vivado waveform configurations
```

---

## 🛠️ Tools & Environment

| Tool | Version | Purpose |
|------|---------|---------|
| Xilinx Vivado | 2023.x | Synthesis, simulation & implementation |
| VHDL | IEEE 1076-2008 | Hardware description language |
| ModelSim / Vivado Sim | — | Behavioral & post-synthesis simulation |

---

## 📐 Projects Overview

### 1. Combinational Logic Circuits
Basic logic gate designs, multiplexers, decoders, and arithmetic units implemented in structural and dataflow VHDL styles.

### 2. Sequential Logic & Finite State Machines
Register designs, counters, and Moore/Mealy FSM implementations with complete testbenches and waveform verification.

### 3. Memory Elements & Shift Registers
Flip-flop primitives, latches, and serial/parallel shift register architectures.

> 💡 _Project list will be updated as new labs and assignments are added throughout the semester._

---

## ▶️ How to Simulate

1. Clone the repository:
   ```bash
   git clone https://github.com/EnesDeger/VHDL_academic_projects.git
   ```
2. Open **Vivado** and create a new project.
3. Add the desired `.vhd` source and its corresponding `_tb.vhd` testbench from the `Sources/` directory.
4. Run **Behavioral Simulation** and open the waveform configuration from `Sim/` if available.

---

## 📚 Course Reference

**EEM225 – Digital Systems Laboratory**  
Hacettepe University · Department of EEE  
Academic Year: 2024–2025

---

## 👤 Author

**Muhammed Enes Değer**  
Electrical & Electronics Engineering · Hacettepe University  
[github.com/EnesDeger](https://github.com/EnesDeger)

---

> *This repository is maintained for academic purposes. Contributions and suggestions are welcome.*
