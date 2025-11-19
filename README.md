# Twister Ribozyme Analysis Scripts

Analysis scripts and code for the manuscript: [https://doi.org/10.1063/5.0241246](https://doi.org/10.1063/5.0241246)

## Description

This repository contains the computational analysis tools used to study the twister ribozyme system. The scripts primarily focus on trajectory analysis, water molecule tracking, ion counting, dipole moment calculations, and data visualization from molecular dynamics simulations.

## Contents

### TCL Scripts (VMD Analysis)
### CHARMM Input Files

### Python Scripts for data processing and visualization (`python/`)


### Supporting Files
- `residue-list.txt` - List of residues for analysis
- `run_count.s` - Batch submission script

## Requirements

### Core Tools
- **VMD (Visual Molecular Dynamics)** - For TCL script execution
- **CHARMM** - For quantum chemistry calculations (`.inp` files)
- **Bash shell** - For running batch scripts

### Python Dependencies
- Python 3.x
- NumPy
- Matplotlib
- Pandas (recommended)
- Seaborn (for visualization scripts)

Install Python dependencies:
```bash
pip install numpy matplotlib pandas seaborn
```

## Usage

### Running VMD Analysis Scripts
```bash
vmd -dispdev text -e script_name.tcl
```

### Running CP2K Calculations
```bash
charmm -i input_file.inp -o output_file.out
```

### Python Analysis Pipeline
```bash
# Extract histogram data
python python/01_extract_histo.py

# Normalize data
bash python/02-normalize.sh

# Convert to matrix format
python python/04-matrixform.py

# Generate visualizations
python python/05-matrixplot.py
python python/barplot.py
python python/displot.py
```

### Contact Analysis
```bash
python python/contact.py
```

### Batch Processing
```bash
bash run_count.sh
```

## Workflow

A typical analysis workflow might follow these steps:

1. **Trajectory Analysis** - Run VMD TCL scripts to extract structural data
2. **Data Extraction** - Use Python scripts to process raw outputs
3. **Visualization** - Generate plots and figures for manuscript


## License
MIT License

Copyright (c) 2024 [Your Name/Organization]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

