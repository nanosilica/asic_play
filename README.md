# my_design

A LibreLane ASIC design targeting the Sky130A PDK.

## Repo structure

```
my_design/
├── config.json          # LibreLane flow configuration
├── src/
│   └── my_design.v      # RTL source
├── tb/
│   └── my_design_tb.v   # Testbench
└── .github/
    └── workflows/
        └── ci.yml       # CI: simulate → harden
```

## Run simulation locally

```bash
iverilog -o sim.out src/my_design.v tb/my_design_tb.v
vvp sim.out
```

## Run LibreLane flow locally

```bash
# Enter nix shell (first time takes ~10 min)
nix-shell

# Run the flow
librelane config.json
```

## CI

Every push to `main` will:
1. Compile and simulate the testbench with Icarus Verilog
2. If simulation passes, run the full LibreLane hardening flow
3. Upload the resulting GDS as a build artifact
