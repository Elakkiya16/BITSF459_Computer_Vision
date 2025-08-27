# BITS F459: Computer Vision Lab Demos — 2025

![OpenCV](https://img.shields.io/badge/OpenCV-5.0%2B-green.svg)
![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)
![Anaconda](https://img.shields.io/badge/Anaconda-Compatible-orange.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)

This repository contains **demo codes and lab experiments** used during lectures and practical sessions of the Computer Vision course at BITS Pilani Dubai Campus. This repository is designed to work seamlessly with Anaconda Navigator and Python 3.10 on Windows, macOS, and Linux.

## 📋 Course Overview

This course covers the complete spectrum of computer vision, from basic image processing to advanced deep learning techniques:

- **Image Fundamentals**: Digital image format, camera models, and calibration
- **Feature Extraction**: Image features for classification and segmentation
- **Multiview Geometry**: Optical flow and Structure From Motion (SFM)
- **Machine Learning**: Classical models to modern deep learning approaches
- **Deep Learning Models**: CNNs, RNNs, Transformers, and Generative Models
- **3D Vision**: Point clouds, depth estimation, and 3D reconstruction

## 🛠️ Prerequisites

- **Anaconda Navigator** installed on your system
- **Python 3.10** (included with recent Anaconda versions)
- Basic knowledge of Python programming
- Webcam (for camera calibration exercises)

## 🚀 Installation & Setup

### Method 1: Using Anaconda Navigator (Recommended)

1. **Open Anaconda Navigator**
2. Create a new environment:
   - Click on "Environments" → "Create"
   - Name: `cvlab`
   - Python version: **3.10**
   - Click "Create"

3. **Install required packages**:
   - In your `cvlab` environment, click "Open Terminal"
   - Run the following commands:

```bash
# Install core computer vision packages
conda install -c conda-forge opencv numpy matplotlib scikit-learn scikit-image pillow

# Install PyTorch (choose appropriate version for your system)
# For Windows/Linux with CUDA (if you have NVIDIA GPU):
conda install -c pytorch pytorch torchvision torchaudio cudatoolkit=11.7

# For macOS with Apple Silicon:
conda install -c pytorch pytorch torchvision torchaudio

# For CPU-only (all platforms):
conda install -c pytorch pytorch torchvision torchaudio cpuonly

# Install additional deep learning and utility packages
pip install timm transformers albumentations umap-learn mediapipe tqdm jupyterlab

# Verify installation
python lab_setup_check.py



## 📋 Course Overview

This course covers the complete spectrum of computer vision, from basic image processing to advanced deep learning techniques:

- **Image Fundamentals**: Digital image format, camera models, and calibration
- **Feature Extraction**: Image features for classification and segmentation
- **Multiview Geometry**: Optical flow and Structure From Motion (SFM)
- **Machine Learning**: Classical models to modern deep learning approaches
- **Deep Learning Models**: CNNs, RNNs, Transformers, and Generative Models
- **3D Vision**: Point clouds, depth estimation, and 3D reconstruction

## 🛠️ Prerequisites

- **Anaconda Navigator** installed on your system [https://www.anaconda.com/download](https://www.anaconda.com/download)
- **Python 3.10** (included with recent Anaconda versions)
- Basic knowledge of Python programming
- Webcam (for camera calibration exercises)

## 🚀 Installation & Setup

### Method 1: Using Anaconda Navigator (Recommended)

1. **Open Anaconda Navigator**
2. Create a new environment:
   - Click on "Environments" → "Create"
   - Name: `cvlab`
   - Python version: **3.10**
   - Click "Create"
3. **Install required packages**:
   - In your `cvlab` environment, click "Open Terminal"
   - Run the following commands:

```bash
# Install core computer vision packages
conda install -c conda-forge opencv numpy matplotlib scikit-learn scikit-image pillow

# Install PyTorch with MPS support for Apple Silicon
conda install -c pytorch pytorch torchvision torchaudio

# Install additional deep learning and utility packages
pip install timm transformers albumentations umap-learn mediapipe tqdm jupyterlab

# Verify installation
python lab_setup_check.py

**### Method 2: Manual Setup from Terminal**

## 📜 License

MIT License (unless specified otherwise in individual folders).

