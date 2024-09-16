# Rectangular Microstrip Patch Antenna Design

This MATLAB script calculates the width, length, and feedline dimensions of a rectangular patch antenna based on input parameters such as frequency, dielectric constant, and substrate height.

## Requirements

- **Frequency (f)**: Operating frequency in GHz
- **Dielectric Constant (Er)**: Relative permittivity of the substrate
- **Height (h)**: Substrate thickness in mm

## How It Works

1. **User Input**: The program prompts for frequency, dielectric constant, and substrate height.
2. **Calculations**:
   - Patch width (W) and length (L) are calculated using standard patch antenna equations.
   - Effective dielectric constant (Er_eff) and length extension (ΔL) are computed to adjust for fringing.
   - Input impedance (Zo) and feedline dimensions (Wt and Lt) are determined for impedance matching.
3. **Output**: The width and length of the patch, along with the transmission line dimensions, are displayed.

## Formulae

- **Width**:  
  `W = (c / (2 * f)) * sqrt(2 / (Er + 1))`
- **Effective Dielectric Constant**:  
  `Er_eff = (Er + 1)/2 + (Er - 1)/2 * (1 / sqrt(1 + 12 * (h / W)))`
- **Length**:  
  `L = L_eff - 2 * ΔL`  
  (where ΔL is the length extension due to fringing)

## Sample Input

```matlab
input frequency f in GHz: 2.4
input dielectric constant of the substrate(Er) : 4.4
input height of substrate h in mm: 1.6
```

## Output

```matlab
width of the patch = 38.5 mm
length of the patch = 29.7 mm
width of the transmission line = 3.1 mm
length of the transmission line = 20.3 mm
