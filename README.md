# Understanding Temporal Trends in Consumer Bankruptcies in Toronto

## Overview

This project uses a Generalized Linear Model to examine consumer bankruptcies trends in Toronto. The findings show a 9.4% annual decrease in bankruptcy rates indicating improving financial conditions overall. Despite this downward trend, seasonal variations remain with bankruptcy rates higher in March, May and November. These periods of increased financial strain may correspond to specific economic pressures such as tax deadlines or seasonal expenses. Understanding these temporal patterns informs targeted interventions during high-risk months.

## File Structure

The repository is organized as follows:

- `data/raw_data` contains the raw dataset obtained from Open Data Toronto.
- `data/analysis_data` includes the cleaned and processed dataset used for analysis.
- `other` includes related literature, documentation of LLM chat interactions, and exploratory sketches.
- `paper` contains the files for generating the final research paper, including the Quarto document (`.qmd`), reference bibliography file, and the final PDF of the paper.
- `scripts` houses R scripts used for downloading the dataset from Open Data Toronto and for simulating, cleaning, and analyzing the data.

## Statement on LLM Usage

This project used ChatGPT to assist in writing code, drafting portions of the paper, and generating documentation. The full interaction history with the LLM is documented and saved in `other/llms/*.txt`.
