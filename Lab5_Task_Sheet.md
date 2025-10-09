# CV Lab 5 — Harris Corner Detector: Manual Derivation + Image Experiment

## Learning Objectives
- Derive the second-moment matrix **H** for a small patch and interpret its eigen-system.  
- Compute the Harris response **R** and decide **corner / edge / flat** based on eigenvalues.  
- Apply Harris on a real image, visualize corners, and study the effect of parameters.

---

## Part A — Manual Harris Derivation on a 3×3 Patch (not using library)

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
5. Observe how `blockSize` and `k` affect the number and stability of detected corners.

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
- **Part A:** Manual calculations and the filled tables (`Ix`, `Iy`, `Ixx`, `Iyy`, `Ixy`, `Sxx`, `Syy`, `Sxy`, `H`, eigenvalues/vectors, `R`, interpretation).  
- **Part B:** Corner-overlay images (`PNG/JPEG`) for at least **three** parameter settings. 

**Notes:**  
- Use **k = 0.04** unless you are sweeping the parameter.

# CV Lab 5 — Harris Corner Detector (Tasks C & D)

This part extends Lab 5 to test two properties of the Harris Corner Detector:
1. **Brightness invariance** — adding a constant to pixel intensities should not affect detected corners.
2. **Scale sensitivity** — resizing the image should change which corners are detected.

---

## Part C — Brightness Invariance Test

### Objective
Verify that the Harris corner detector is **invariant to additive brightness changes**.

### Tasks
1. Create bright and dark versions of your grayscale image:
   ```python
   bright = cv2.convertScaleAbs(gray, alpha=1.0, beta=50)   # +50 brightness
   dark   = cv2.convertScaleAbs(gray, alpha=1.0, beta=-30)  # −30 brightness
   ```
2. Run the same Harris parameters (`blockSize`, `ksize`, `k`) on  
   **original**, **bright**, and **dark** images.
3. Normalize the Harris response before thresholding:
   ```python
   dst = dst / dst.max()
   ```
4. Overlay corners and record:
   - Number of detected corners
   - Maximum R value (`R.max()`)

### Expected Observation
- Corner positions remain unchanged.  
- Gradients `Ix`, `Iy` depend on **differences**, so adding a constant brightness offset has no effect.  
- **Conclusion:** Harris is **brightness invariant**.

#### Result Table
| Image | blockSize | k | ksize | Threshold | Corner Count | Max R |
|:------|:-----------|:--|:------|:-----------|:--------------|:------|
| Original | 3 | 0.04 | 3 | 0.01 × max |  |  |
| Bright (+50) | 3 | 0.04 | 3 | 0.01 × max |  |  |
| Dark (−30) | 3 | 0.04 | 3 | 0.01 × max |  |  |

---

## Part D — Scale Sensitivity Test

### Objective
Show that the Harris corner detector is **not scale invariant**.

### Tasks
1. Resize the same image:
   ```python
   scaled  = cv2.resize(gray, None, fx=1.5, fy=1.5, interpolation=cv2.INTER_LINEAR)
   smaller = cv2.resize(gray, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_AREA)
   ```
2. Apply the same Harris parameters (`blockSize`, `k`, `ksize`) on  
   **original**, **scaled-up**, and **scaled-down** images.
3. Normalize and overlay corners as before.
4. Compare:
   - Do the same physical corners appear?
   - How do counts and R values change?

### Expected Observation
- Harris uses a **fixed local window** (`blockSize`), so resizing alters the apparent corner size.  
- Corners may shift, merge, or disappear after scaling.  
- **Conclusion:** Harris is **not scale invariant** — this motivates the need for scale-space detectors such as **SIFT**.

#### Result Table
| Image | Scale | blockSize | k | ksize | Threshold | Corner Count | Max R |
|:------|:-------|:-----------|:--|:------|:-----------|:--------------|:------|
| Original | 1.0× | 3 | 0.04 | 3 | 0.01 × max |  |  |
| Scaled Up | 1.5× | 3 | 0.04 | 3 | 0.01 × max |  |  |
| Scaled Down | 0.5× | 3 | 0.04 | 3 | 0.01 × max |  |  |

---

## Deliverables

| Part | Task | Required Output |
|:-----|:------|:----------------|
| **C** | Brightness Invariance Test | Overlays + table of corner counts and `R.max()` |
| **D** | Scale Sensitivity Test | Overlays + comparison table showing changes |

---

### Key Takeaways

| Property | Invariance | Explanation |
|:-----------|:-------------|:-------------|
| Brightness Shift | ✅ Invariant | Gradient differences remove constant offsets |
| Contrast Scaling | ⚙️ Semi-invariant (if normalized) | Gradients scale proportionally |
| Rotation | ✅ Nearly invariant | Gradient orientations rotate consistently |
| **Scale** | ❌ Not invariant | Fixed `blockSize` fails across scales |

---
