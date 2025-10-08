# CV Lab 5 — Harris Corner Detector: Manual Derivation + Image Experiment

**Course:** Computer Vision (CS F459)  
**Lab \#**: 5  
**Topic:** Harris Corners  
**Submission:** Push to your course Git repository under `/labs/lab05`

---

## Learning Objectives
- Derive the second-moment matrix **H** for a small patch and interpret its eigen-system.  
- Compute the Harris response **R** and decide **corner / edge / flat** based on eigenvalues.  
- Apply Harris on a real image, visualize corners, and study the effect of parameters.

---

## Part A — Manual Harris Derivation on a 3×3 Patch (By Hand)

Use the following **3×3** intensity patch **I** with **no-padding** finite-difference rules (from lecture slides). Show **all intermediate arithmetic**.

### Given patch `I`
```
[
  210  208  110
  208  205  106
  105  102   40
]
```

### Finite-difference rules (no padding)
**Horizontal gradient `Ix`**
- Left col `j=0`:      `Ix(i,0) = I(i,1) − I(i,0)`  
- Center `j=1`:        `Ix(i,1) = ( I(i,2) − I(i,0) ) / 2`  
- Right col `j=2`:     `Ix(i,2) = I(i,2) − I(i,1)`  

**Vertical gradient `Iy`**
- Top row `i=0`:       `Iy(0,j) = I(1,j) − I(0,j)`  
- Center row `i=1`:    `Iy(1,j) = ( I(2,j) − I(0,j) ) / 2`  
- Bottom row `i=2`:    `Iy(2,j) = I(2,j) − I(1,j)`  

### Tasks
1. Compute `Ix` and `Iy` (by hand).  
2. Form element-wise product images:  
   - `Ixx = Ix^2`, `Iyy = Iy^2`, `Ixy = Ix * Iy`.  
3. Sum over the window to obtain:  
   - `Sxx = Σ Ixx`, `Syy = Σ Iyy`, `Sxy = Σ Ixy`.  
4. Build the window matrix:  
   - `H = [[Sxx, Sxy], [Sxy, Syy]]`.  
5. Compute **eigenvalues** `λ1 ≤ λ2` and **unit eigenvectors** `v1, v2` of `H` (closed-form for 2×2).  
6. Compute the **Harris response**:  
   - `R = det(H) − k * (trace(H))^2`, with **k = 0.04**.  
   - Conclude **corner / edge / flat** and justify from `λ1, λ2`.  

> **Optional Challenge:** Repeat 3–6 using a **Gaussian weighting window**  
> `W = (1/16) * [[1,2,1],[2,4,2],[1,2,1]]` instead of a flat sum; compare eigenvalues and `R`.

---

## Part B — Harris on an Image (Python + OpenCV)

### Tasks
1. Choose a **grayscale** image with visible corners (e.g., chessboard, building, printed pattern). If needed, convert color → grayscale.  
2. Apply a small Gaussian blur (e.g., `3×3`) to reduce noise.  
3. Run Harris (OpenCV `cv2.cornerHarris`) with a **parameter sweep**:  
   - `blockSize ∈ {2, 3, 5}`, `ksize = 3`, `k ∈ {0.04, 0.06, 0.08}`.  
4. Normalize the response, threshold to mark strong corners, and overlay on the image. Save images for **≥ 3** different settings.  
5. Compare with **Shi–Tomasi** (`cv2.goodFeaturesToTrack`) on the same image. Record the number of corners and visually compare locations.  
6. Write **5–8 sentences** discussing how `blockSize` and `k` affect the number and stability of detected corners.

### Reference skeleton
```python
import cv2, numpy as np

img = cv2.imread('your_image.png')                     # <-- set path
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
gray = np.float32(gray)

# Optional smoothing
gray_blur = cv2.GaussianBlur(gray, (3,3), 0)

# Harris
dst = cv2.cornerHarris(gray_blur, blockSize=2, ksize=3, k=0.04)
dst = cv2.dilate(dst, None)   # for visualization
thr = 0.01 * dst.max()        # tune (e.g., 0.005–0.02)
vis = img.copy()
vis[dst > thr] = [0, 0, 255]  # mark corners in red
cv2.imwrite('lab05_harris.png', vis)

# Shi–Tomasi comparison
pts = cv2.goodFeaturesToTrack(gray_blur.astype(np.uint8),
                              maxCorners=200, qualityLevel=0.01, minDistance=5)
vis2 = img.copy()
if pts is not None:
    for p in pts:
        x, y = p.ravel()
        cv2.circle(vis2, (int(x), int(y)), 3, (0,255,0), -1)
cv2.imwrite('lab05_shitomasi.png', vis2)
```

---

## Deliverables
- **Part A:** Scans/photos of handwritten calculations and the filled tables (`Ix`, `Iy`, `Ixx`, `Iyy`, `Ixy`, `Sxx`, `Syy`, `Sxy`, `H`, eigenvalues/vectors, `R`, interpretation).  
- **Part B:** Corner-overlay images (`PNG/JPEG`) for at least **three** parameter settings, plus a short report (≤ **1 page**) with observations.  
- A concise **`README.md`** in `/labs/lab05` explaining how to reproduce Part B (commands, dependencies, image used).

### Suggested repo layout
```
labs/
  lab05/
    PartA/                 # scans/photos of hand calculations
    PartB/
      harris_experiment.py # your code (name as you like)
      lab05_harris.png
      lab05_shitomasi.png
      ... (other variants)
    README.md              # this file
```

### Environment
Create a virtual environment and install dependencies (example):
```bash
python -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
pip install opencv-python numpy
```

### Repro Tips
- Keep the **image path** relative to `/labs/lab05/PartB`.
- Log the exact **parameters** used for each run.
- If results look noisy, adjust Gaussian blur (`(3,3)` or `(5,5)`), the **threshold factor**, or `blockSize`.

---

## Grading Rubric (100 points)
- **Part A correctness & completeness** (Ix/Iy/Ixx/Iyy/Ixy/H/eigs/R): **40 pts**  
- **Part B implementation** (runs, correct visualization, parameter sweep): **40 pts**  
- **Analysis quality & clarity** (writing, comparisons, insights): **20 pts**

---

## Academic Integrity
Part A must be solved **by hand** (no symbolic or CAS tools). Discussion of high-level ideas is allowed, but all submitted work must be your own.

---

**Notes:**  
- Use **k = 0.04** unless you are sweeping the parameter.  
- For Shi–Tomasi, ensure fair comparison (same blur and similar thresholds).  
- If you choose a large image, consider resizing to speed up experiments.
