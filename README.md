# TORSO-MPP | CDT Personalization Pipeline

This repository is a component of the **Cardiac Digital Twin Personalization Pipeline** implemented for the Master Thesis: _"Implementation of a pipeline to generate a patient-specific Digital Twin of Cardiac Electrophysiology"_

For more details on the complete Pipeline refer to the main repository [cdt-pipeline]

## Overview
This repository is a fork of the open-source **TORSO-MPP** pipeline originally developed by H. J Smith, B. Rodriguez from University of Oxford and published on the repository [MultiMeDIA-Oxford/TORSO-MPP](https://github.com/MultiMeDIA-Oxford/TORSO-MPP)

This pipeline implemented in Matlab and Python is designed to recontruct a subject's torso surface and localise ECG electrodes from a set of Cardiac Magnetic Resonance (CMR) that includes SAX, LAX and scout/localizer views.

Within the **Cardiac Digital Twin Personalization Pipeline** it is used to perform the **Estimation of ECG electrodes position** as the last step of the **Anatomical Twinning** phase, extracting the spatial coordinates of the 10 electrodes required for the standard 12-lead ECG.

## Main modifications
To integrate the tool in the CDT Personalization Pipeline some modifications to the original Matlab code that collects and classifies DICOM images were performed.

In particular the original code was developed to work with data from the UK Biobank, which provides complete cardiac imaging datasets with all standard views available and correctly labeled.

As a result, some modifications were required to make the pipeline works with other datasets, such as the **Sunnybrook Cardiac Dataset** publicly available in the [Cardiac Atlas Project database](https://www.cardiacatlas.org/), that use anonimization procedures and lack some DICOM metadata.

## Usage

The installation and usage instructions are provided in the original document [README.pdf](./README.pdf) released by the authors.

## References

- Smith Hannah J, Rodriguez Blanca, Sang Yuling, Beetz Marcel, Choudhury Robin P, Grau Vicente, Banerjee Abhirup (2025) Anatomical basis of sex differences in the electrocardiogram identified by three-dimensional torso-heart imaging reconstruction pipeline eLife 14:RP108119, https://doi.org/10.7554/eLife.108119.1

- H. J. Smith, A. Banerjee, R. P. Choudhury and V. Grau, "Automated Torso Contour Extraction from Clinical Cardiac MR Slices for 3D Torso Reconstruction," 2022 44th Annual International Conference of the IEEE Engineering in Medicine & Biology Society (EMBC), Glasgow, Scotland, United Kingdom, 2022, pp. 3809-3813, doi: 10.1109/EMBC48229.2022.9871643
