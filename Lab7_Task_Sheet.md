# 🧭 Mini Hackathon Lab 07 – Geometry, Analysis & Motion
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

---

# Run this in your terminal or Colab cell
pip install opencv-python numpy matplotlib

## 🧩 Stage 1 (0 – 10 min): Feature Hunt

🕵️‍♂️ Detect distinctive points that survive scale and rotation changes.

- **🎯 Goal:** Detect and visualize top 100 SIFT keypoints per image.  
- **💡 Hint:** Use `cv2.SIFT_create()` for feature detection.  
- **📸 Deliverable:** Two images with circles marking the detected keypoints.
🧠 **Mini Analysis:** Which detector gave denser coverage? Why might that matter for matching later?

## 🔗 Stage 2 (10 – 20 min): Feature Matchmaker

Match keypoints between the two images.

- **🎯 Goal:**  
  Compute descriptor matches and visualize them using  
  ```python
  cv2.drawMatches()
  ```
  - **💡 Hint:**  
  Experiment with both `BFMatcher` and `FlannBasedMatcher`.

- **📸 Deliverable:**  
  Save and include `output_match.jpg` showing the matched keypoints.

- **🧠 Mini Analysis:**  
  How does changing `crossCheck` or the **ratio threshold** affect the number of valid matches?

## 🧮 Stage 3 (20 – 30 min): Geometry Guru

Find the geometric relation between the two cameras.

- **🎯 Goal:**
  1. Compute the **Fundamental Matrix (F)** using  
     ```python
     cv2.findFundamentalMat(..., cv2.FM_RANSAC)
     ```
  2. Display the number of **inlier matches** after RANSAC filtering.

- **💭 Question:**  
  What geometric relationship does **F** represent between the two images?
  🧠 **Mini Analysis:** Run RANSAC with thresholds 0.5, 1.0, and 5.0 pixels. What happens to inlier count vs accuracy?

## 📷 Stage 4 (30 – 40 min): Pose Explorer

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
  📄 - **📄 Deliverable:**  
  Save **R** and **t** to `pose.txt`.

- **🧠 Mini Analysis:**  
  If `t = [0.3, 0.1, 0.9]`, what does its direction physically represent?  
  What would change if the camera were **uncalibrated**?

## 🏗️ Stage 5 (40 – 60 min): 3-D Builder

Reconstruct and visualize 3-D scene points.

- **🎯 Goal:**  
  Triangulate points using  
  ```python
  cv2.triangulatePoints()
  ```
  and plot in **3-D** using Matplotlib.

- **💡 Bonus:**  
  Try a different image pair and compare the **depth spread**.

- **📊 Deliverable:**  
  Save and include `reconstruction.png` — the 3-D point cloud plot.

- **🧠 Mini Analysis:**  
  If the reconstruction looks **flattened**, what does that indicate about the **camera baseline** or **calibration**?

## 🎨 Stage 6 (Open Creativity Challenge: 60 -90 min)

Push your creativity beyond the basic reconstruction!

Choose **any one** of the following mini-challenges (or invent your own) and implement it in your notebook.

### 💡 Option A: Visual Story
Create a **rotating 3-D visualization** of your reconstructed points using Matplotlib’s animation tools or Plotly.  
> Hint: Try rotating the viewpoint to simulate a camera orbit.

### ⚙️ Option B: Precision Tweaker
Experiment with **different detectors** (e.g., ORB, AKAZE) and compare their reconstruction quality.  
> Question: Which detector produced the most stable 3-D structure, and why?

### 🌍 Option C: Depth Colorizer
Map the reconstructed 3-D points by their **depth (Z-value)** and color them using a heatmap palette.  
> Hint: Use `ax.scatter(x, y, z, c=z, cmap='viridis')`.

### 🧠 Option D: Custom Innovation
Design any small twist or extension — e.g., adding a third view, plotting camera frustums, or using your own captured scene.  
> Briefly explain what you changed and what you observed.


**Deliverable:**  
- Add one extra output file (e.g., `creative_output.png` or `depth_animation.mp4`)  
- Write 3–5 lines in your README explaining your creative experiment.

**Marks:** 🎖️ *Up to +5 Bonus for originality and insight.*

---

## 🧠 Quick Reflection

- Why do **SIFT features** remain stable across multiple images?  
- What parameters or unknowns **increase when cameras are uncalibrated**?  
- What does **bundle adjustment** refine after triangulation?
- What is the real-world trade-off between accuracy and runtime in SfM?

## 🏁 Submission

Push your notebook and screenshots to your GitHub repository:  
`/HackathonLabs/Lab05_SfM/`

**Include:**
- `README.md` with results and reflection answers  
- `output_match.jpg` – showing feature matches  
- `pose.txt` – containing rotation and translation matrices  
- `reconstruction.png` – 3-D point cloud visualization


## 🧮 Evaluation (15 Marks)

| Stage | Task | Marks |
|:------:|:----------------------|:------:|
| 1 | Feature Detection | 2 |
| 2 | Feature Matching | 2 |
| 3 | F & RANSAC | 2 |
| 4 | Pose Estimation | 2 |
| 5 | 3-D Reconstruction | 2 |
|💎 Bonus| Visualization Innovation | 5 |

⏱️ **Treat this like a real-time mini hackathon!**  
Focus on making something that *works*, visualize every result, and **commit before time’s up.**

**Happy Reconstructing 🏗️**

