# 🧭 Mini Hackathon Lab 05 – Geometry, Analysis & Motion
**Course:** BITS F459 – Computer Vision  
**Instructor:** Dr Elakkiya R | BITS Pilani, Dubai Campus  
**Duration:** ⏱️ 1 hr 30 min  
**Theme:** *Reconstruct the World from 2D Images!*

---

## 🎯 Challenge Overview
You’ve just learned how computers recover 3-D structure from multiple 2-D images.  
Now it’s your turn to **build a mini Structure-from-Motion (SfM)** pipeline from scratch!

Work solo or in pairs. You have **90 minutes** to go from **raw images → 3-D points**.  
Everyone will work on the **same image pair** for consistent results.

---

## 📂 Input Data
Use these stereo images (Trevi-style pair):

| Image | Preview | Direct Link |
|:------|:---------|:-------------|
| **Left View** | ![left](https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeL.jpg) | [aloeL.jpg](https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeL.jpg) |
| **Right View** | ![right](https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeR.jpg) | [aloeR.jpg](https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeR.jpg) |

Download with:

wget https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeL.jpg -O img1.jpg
wget https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeR.jpg -O img2.jpg



## ⚙️ Environment Setup

To get started, install the required packages:


# Run this in your terminal or Colab cell
pip install opencv-python numpy matplotlib

## 🧩 Stage 1 (0 – 20 min): Feature Hunt

🕵️‍♂️ Detect distinctive points that survive scale and rotation changes.

- **🎯 Goal:** Detect and visualize top 100 SIFT keypoints per image.  
- **💡 Hint:** Use `cv2.SIFT_create()` for feature detection.  
- **📸 Deliverable:** Two images with circles marking the detected keypoints.

## 🧮 Stage 3 (40 – 60 min): Geometry Guru

Find the geometric relation between the two cameras.

- **🎯 Goal:**
  1. Compute the **Fundamental Matrix (F)** using  
     ```python
     cv2.findFundamentalMat(..., cv2.FM_RANSAC)
     ```
  2. Display the number of **inlier matches** after RANSAC filtering.

- **💭 Question:**  
  What geometric relationship does **F** represent between the two images?

## 📷 Stage 4 (60 – 75 min): Pose Explorer

Recover camera orientation and position.

- **🎯 Goal:**
  1. Assume a simple **intrinsic matrix K**.  
  2. Compute the **Essential Matrix (E = Kᵀ F K)**.  
  3. Use  
     ```python
     cv2.recoverPose()
     ```  
     to estimate **rotation (R)** and **translation (t)**.

- **📸 Deliverable:**  
  Print the **R** and **t** matrices, and briefly explain what the **translation vector** represents.

## 🏗️ Stage 5 (75 – 90 min): 3-D Builder

Reconstruct and visualize 3-D scene points.

- **🎯 Goal:**  
  Triangulate points using  
  ```python
  cv2.triangulatePoints()


## 🧠 Quick Reflection

- Why do **SIFT features** remain stable across multiple images?  
- What parameters or unknowns **increase when cameras are uncalibrated**?  
- What does **bundle adjustment** refine after triangulation?

## 🏁 Submission

Push your notebook and screenshots to your GitHub repository:  
`/HackathonLabs/Lab05_SfM/`

**Include:**
- `README.md` with results and reflection answers  
- `output_match.jpg` – showing feature matches  
- `pose.txt` – containing rotation and translation matrices  
- `reconstruction.png` – 3-D point cloud visualization


## 🧮 Evaluation (10 Marks)

| Stage | Task | Marks |
|:------:|:----------------------|:------:|
| 1 | Feature Detection | 2 |
| 2 | Feature Matching | 2 |
| 3 | F & RANSAC | 2 |
| 4 | Pose Estimation | 2 |
| 5 | 3-D Reconstruction | 2 |

⏱️ **Treat this like a real-time mini hackathon!**  
Focus on making something that *works*, visualize every result, and **commit before time’s up.**

**Happy Reconstructing 🏗️**

