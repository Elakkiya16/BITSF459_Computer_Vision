# Computer Vision Lab Demos — 2025

This repository contains **demo codes and lab experiments** used during lectures and practical sessions of the Computer Vision course.

---

## 📦 What’s Inside
- `Labs/` — Weekly demo notebooks and scripts
  - `Lab01_CameraCalibration/`
  - `Lab02_FeatureDetection/`
  - `Lab03_FilteringSharpening/`
  - *(more labs will be added as the course progresses)*
- `Setup/` — Environment files (`requirements.txt`, optional `environment.yml`)
- `.gitignore` — Ignores notebook checkpoints, cache files, etc.

```
.
├── Labs/
│   ├── Lab01_CameraCalibration/
│   │   └── demo.ipynb
│   ├── Lab02_FeatureDetection/
│   │   └── demo.ipynb
│   ├── Lab03_FilteringSharpening/
│   │   └── demo.ipynb
│   └── ...
├── Setup/
│   ├── requirements.txt
│   └── environment.yml
├── .gitignore
└── README.md
```

---

## 🚀 Quick Start

### 1) Install Anaconda
Download and install from: [https://www.anaconda.com/download](https://www.anaconda.com/download)

### 2) Create and activate the course environment
```bash
conda create -n cvlab python=3.10 -y
conda activate cvlab
```

### 3) Clone the repository
```bash
git clone https://github.com/<YOUR-USERNAME>/<REPO-NAME>.git
cd <REPO-NAME>
```

### 4) Install dependencies
**Option A — requirements.txt**
```bash
pip install -r Setup/requirements.txt
```

**Option B — environment.yml**
```bash
conda env update -n cvlab -f Setup/environment.yml
conda activate cvlab
```

### 5) Launch Jupyter
```bash
jupyter lab
```

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
- **Lab 01 — Camera & Calibration**: webcam capture, grayscale, histograms, chessboard corners  
- **Lab 02 — Feature Detection**: edges (Sobel, Canny), Harris, ORB/SIFT demo  
- **Lab 03 — Filtering & Sharpening**: mean/Gaussian blur, Laplacian, unsharp masking  

*(Each lab folder may include a `README.md` for tasks and expected outputs.)*

---

## 📝 Conventions
- Folder names: `LabXX_DescriptiveTitle` (two-digit index)  
- Notebook name: `demo.ipynb`  
- Keep notebooks tidy with headings and comments  
- Use **relative paths** for any data files  

---

## ❗ Troubleshooting
- **Kernel restarts**: ensure Jupyter is launched *after* activating `cvlab`  
- **Webcam not opening**: close other apps, try different indices (`0`, `1`, `2`), grant Camera permission on macOS  
- **Image display issues**: use  
  ```python
  import matplotlib.pyplot as plt
  plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
  plt.show()
  ```

---

## 📜 License
MIT License (unless specified otherwise in individual folders).
