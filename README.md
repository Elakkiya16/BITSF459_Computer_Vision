# BITS F459: Computer Vision Lab Demos — 2025
![OpenCV](https://img.shields.io/badge/OpenCV-5.0%2B-green.svg)
![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)
![Anaconda](https://img.shields.io/badge/Anaconda-Compatible-orange.svg)

This repository contains **demo codes and lab experiments** used during lectures and practical sessions of the Computer Vision course at BITS Pilani Dubai Campus.

# Computer Vision Lab Demos — 2025

This repository contains **demo codes and lab experiments** used during lectures and practical sessions of the Computer Vision course.

---

## 📦 What’s Inside

* `Labs/` — Weekly demo notebooks and scripts

  * `Lab01_CameraCalibration/`
  * `Lab02_FeatureDetection/`
  * `Lab03_FilteringSharpening/`
  * *(more labs will be added as the course progresses)*
* `Setup/` — Environment files (`requirements.txt`, optional `environment.yml`)
* `.gitignore` — Ignores notebook checkpoints, cache files, etc.

---

## 🚀 Requirements

### 1) Anaconda Environment

Make sure Anaconda is installed: [https://www.anaconda.com/download](https://www.anaconda.com/download)

Create and activate the environment:

```bash
conda create -n cvlab python=3.10 -y
conda activate cvlab
```

### 2) Install dependencies

```bash
pip install -r Setup/requirements.txt
```

Or using environment file:

```bash
conda env update -n cvlab -f Setup/environment.yml
conda activate cvlab
```

### 3) Run Jupyter

```bash
jupyter lab
```

Open the notebook inside the relevant `Labs/LabXX_*` folder.

---

## 🔧 Dependencies

Listed in `Setup/requirements.txt`:

```
opencv-python
numpy
matplotlib
scipy
scikit-image
jupyterlab
```

**Sample environment.yml**

```yaml
name: cvlab
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.10
  - numpy
  - scipy
  - matplotlib
  - scikit-image
  - jupyterlab
  - pip
  - pip:
      - opencv-python
```

---

## 📚 Lab Index

* **Lab 01 — Camera & Calibration**: webcam capture, grayscale, histograms, chessboard corners
* **Lab 02 — Feature Detection**: edges (Sobel, Canny), Harris, ORB/SIFT demo
* **Lab 03 — Filtering & Sharpening**: mean/Gaussian blur, Laplacian, unsharp masking

---

## 📝 Conventions

* Folder names: `LabXX_DescriptiveTitle` (two-digit index)
* Notebook name: `demo.ipynb`
* Keep notebooks tidy with headings and comments
* Use **relative paths** for any data files

---

## ❗ General Troubleshooting

* Always activate the correct environment before launching Jupyter:

  ```bash
  conda activate cvlab
  jupyter lab
  ```
* If webcam access fails, try a different camera index (`0`, `1`, `2`) or check that no other application is using the webcam.
* For displaying images inside notebooks, prefer:

  ```python
  import matplotlib.pyplot as plt
  plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
  plt.show()
  ```

---

## 📜 License

MIT License (unless specified otherwise in individual folders).

