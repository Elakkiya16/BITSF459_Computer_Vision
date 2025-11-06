# 🧭 Mini Hackathon Lab 05 – Geometry, Analysis & Motion
**Course:** BITS F459 – Computer Vision  
**Instructor:** Dr Elakkiya R | BITS Pilani, Dubai Campus  
**Duration:** ⏱️ 1 hr 30 min  
**Theme:** *Reconstruct the World from 2D Images!*

---

![SfM Pipeline](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Structure_from_motion_diagram.png/800px-Structure_from_motion_diagram.png)
> *Figure: Simplified Structure-from-Motion pipeline – from feature detection to 3D reconstruction.*

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
```bash
wget https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeL.jpg -O img1.jpg
wget https://raw.githubusercontent.com/opencv/opencv/master/samples/data/aloeR.jpg -O img2.jpg


```markdown
## ⚙️ Environment Setup

To get started, install the required packages:

```bash
# Run this in your terminal or Colab cell
pip install opencv-python numpy matplotlib
