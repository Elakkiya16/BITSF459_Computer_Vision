# BITS F459: Computer Vision Lab Demos — 2025

![OpenCV](https://img.shields.io/badge/OpenCV-5.0%2B-green.svg)
![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)
![Anaconda](https://img.shields.io/badge/Anaconda-Compatible-orange.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)

This repository contains **demo codes and lab experiments** used during lectures and practical sessions of the Computer Vision course at BITS Pilani Dubai Campus. This repository is designed to work seamlessly with Anaconda Navigator and Python 3.10 on Windows, macOS, and Linux.
---
## 📋 Course Overview

This course covers the complete spectrum of computer vision, from basic image processing to advanced deep learning techniques:

- **Image Fundamentals**: Digital image format, camera models, and calibration
- **Feature Extraction**: Image features for classification and segmentation
- **Multiview Geometry**: Optical flow and Structure From Motion (SFM)
- **Machine Learning**: Classical models to modern deep learning approaches
- **Deep Learning Models**: CNNs, RNNs, Transformers, and Generative Models
- **3D Vision**: Point clouds, depth estimation, and 3D reconstruction
---
## 🛠️ Prerequisites

- **Anaconda Navigator** installed on your system
- **Python 3.10** (included with recent Anaconda versions)
- Basic knowledge of Python programming
- Webcam (for camera calibration exercises)
---
## 🚀 Environment Setup(Lab 00): Installation & Setup
#### ![Anaconda](https://avatars.githubusercontent.com/u/6764390?s=200&v=4) Step 1: Install Anaconda
1. Go to [Anaconda Downloads](https://www.anaconda.com/download).  
2. Select the correct installer:  
   - **Windows (64-bit)** → Graphical Installer.  
   - **Mac (Apple Silicon: M1/M2/M3)** → *64-bit Apple Silicon Graphical Installer*.  
   - **Mac (Intel Macs)** → *64-bit Intel Graphical Installer*.  
3. Run the installer and follow default options.  

#### 🐍 Step 2: Create a new environment
1. **Open Anaconda Navigator**
2. **Create a new environment:**
   - In Navigator → **Environments** → **Create**.
   - **Name:** `cvlab`
   - **Python version:** `3.10`
   - Click **Create**. 

#### 🖥️ Step 3: Add channels
1. In **Environments** tab (with `cvlab` selected), click **Channels** (top-right).  
2. Add these:  
   - `defaults`  
   - `conda-forge`  
   - `pytorch`  
3. Click **Update channels**.  

#### 🎯 Step 4: Install required packages:
   - In your `cvlab` environment, click "Open Terminal"
   - or manually
```bash
conda create -n cvlab python=3.10
conda activate cvlab
```
   - Run the following commands:
#### Install core computer vision packages

```bash
conda install -c conda-forge opencv numpy matplotlib scikit-learn scikit-image pillow
```

#### Install PyTorch (choose appropriate version for your system)

**Windows/Linux with CUDA (NVIDIA GPU):**

```bash
conda install -c pytorch pytorch torchvision torchaudio cudatoolkit=11.7
```

**macOS with Apple Silicon:**

```bash
conda install -c pytorch pytorch torchvision torchaudio
```

**CPU-only (all platforms):**

```bash
conda install -c pytorch pytorch torchvision torchaudio cpuonly
```

#### Install additional deep learning and utility packages

```bash
pip install timm transformers albumentations umap-learn mediapipe tqdm jupyterlab
```

---

## 🔍 Environment Verification

Create a file `lab_setup_check.py` in the root of the repo with the following content:

```python
"""
Lab 0 — Environment Setup Verification Script
"""

import sys

print("🔍 Checking environment setup...\n")
print(f"Python version: {sys.version}\n")

# Core packages
try:
    import cv2
    print(f"✅ OpenCV: {cv2.__version__}")
except Exception as e:
    print(f"❌ OpenCV not working: {e}")

try:
    import torch
    print(f"✅ PyTorch: {torch.__version__}")
    print(f"   CUDA available: {torch.cuda.is_available()}")
    if hasattr(torch.backends, "mps"):
        print("   MPS available:", torch.backends.mps.is_available())
    else:
        print("   MPS available: N/A")
except Exception as e:
    print(f"❌ PyTorch not working: {e}")

# Additional packages
for pkg_name, import_name in [
    ("timm", "timm"),
    ("transformers", "transformers"),
    ("albumentations", "albumentations"),
    ("umap-learn", "umap"),
    ("mediapipe", "mediapipe"),
    ("scikit-learn", "sklearn"),
    ("scikit-image", "skimage"),
    ("Matplotlib", "matplotlib"),
    ("NumPy", "numpy"),
    ("Pillow", "PIL")
]:
    try:
        module = __import__(import_name)
        version = getattr(module, "__version__", "installed (version unknown)")
        print(f"✅ {pkg_name}: {version}")
    except Exception as e:
        print(f"❌ {pkg_name} not working: {e}")

print("\n🎯 If all required packages show ✅, your environment is ready!")
```

Run verification:

```bash
python lab_setup_check.py
```
---

## 🚀 Running Labs

```bash
conda activate cvlab
jupyter lab
```

Open the required notebook under `Labs/LabXX_*/demo.ipynb`.

---

## ❗ Troubleshooting

* Always activate the environment before starting Jupyter.
* If the webcam does not open, try device indices `0`, `1`, or `2`.
* For inline image display in notebooks:

```python
import matplotlib.pyplot as plt
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.show()
```

---

## 📜 License

MIT License (unless specified otherwise in individual folders).





