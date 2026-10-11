# LED Blinking Controller using Verilog

## Project Overview
A beginner-level Digital VLSI Frontend Design project that implements an LED blinking controller using Verilog RTL. A counter counts clock cycles and toggles the LED output when the configured threshold is reached.

## Design Specifications
- **RTL language:** Verilog HDL
- **Module name:** `led_blinker`
- **Counter width:** 26 bits
- **Reset:** Synchronous, active-high
- **Intended clock frequency:** 50 MHz
- **Default threshold:** 49,999,999
- **Simulation tools:** Icarus Verilog and GTKWave
- **Hardware board:** Not required for simulation

## Project Files

| File | Description |
|---|---|
| `led_blinker.v` | RTL design |
| `tb_led_blinker.v` | Testbench for simulation |
| `README.md` | Project documentation |

## How the Design Works
1. The clock drives the sequential logic.
2. When reset is HIGH at a rising clock edge, the LED and counter are cleared.
3. After reset is released, the counter increments on each rising edge.
4. When the counter reaches the threshold, the LED toggles and the counter resets to zero.

With the default threshold of 49,999,999 and a 50 MHz clock, the LED toggles approximately every second, giving a complete ON/OFF cycle of approximately two seconds.

For faster simulation, the testbench overrides the threshold to `4`.

## Run the Simulation

Compile the RTL and testbench:

```bash
iverilog -o led_sim led_blinker.v tb_led_blinker.v
```

Run the simulation:

```bash
vvp led_sim
```

Open the waveform:

```bash
gtkwave led_blinker.vcd
```

## Verification Results

The current simulation checks the following:

- Reset initializes the LED and counter.
- LED transitions from OFF to ON.
- LED transitions from ON to OFF.
- VCD waveform is generated for GTKWave.

**Observed result:** All four checks passed in the current simulation.

## Learning Outcomes
- Verilog module and port declarations
- Clocked sequential logic
- Counter implementation
- Synchronous reset
- Testbench development
- Automated simulation checks
- Waveform analysis using GTKWave

## Future Improvements
- Verify multiple consecutive LED toggles.
- Add more reset test cases.
- Improve testbench checks for timing and counter behavior.
- Explore FPGA implementation when hardware becomes available.
- 
- ## Simulation Waveform
  
![LED Blinking Controller waveform](waveform/led_blinker_waveform.png)
