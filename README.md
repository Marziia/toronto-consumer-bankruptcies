# Understanding Consumer Bankruptcies in Toronto

## Overview

This project analyzes consumer bankruptcies in Toronto between 2008 and 2024, focusing on budget variances, seasonal trends, and yearly economic shifts. Using a Generalized Linear Model (GLM), the study quantifies the relationship between these factors and bankruptcy rates, revealing that a one-unit increase in budget variance corresponds to a 44% reduction in expected bankruptcies. Seasonal spikes are observed in May and June, suggesting opportunities for targeted policy interventions. The findings highlight the role of municipal fiscal management and temporal patterns in understanding financial distress in urban populations.

## File Structure

The repository is organized as follows:

- `data/raw_data` contains the raw dataset obtained from Open Data Toronto.
- `data/analysis_data` includes the cleaned and processed dataset used for analysis.
- `other` includes related literature, documentation of LLM chat interactions, and exploratory sketches.
- `paper` contains the files for generating the final research paper, including the Quarto document (`.qmd`), reference bibliography file, and the final PDF of the paper.
- `scripts` houses R scripts used for downloading the dataset from Open Data Toronto and for simulating, cleaning, and analyzing the data.

## Statement on LLM Usage

This project used ChatGPT to assist in writing code, drafting portions of the paper, and generating documentation. The full interaction history with the LLM is documented and saved in `other/llms/*.txt`.
