# 🧪 Lab Sheet — Gaussian, Sharpening, Prewitt & Sobel Gradients, and Canny (Webcam)

## Duration
2 hours

## Learning Outcomes
- Apply Gaussian smoothing and explain its weighting.
- Perform unsharp masking (sharpening) and interpret its effect.
- Compute edge gradients using **Prewitt** and **Sobel** (magnitude and direction).
- Explain and implement the key stages of **Canny**: Non-Maximum Suppression, Double Thresholding, and Hysteresis.
- Capture a **live image from a webcam** and run the complete pipeline end-to-end.

---

## Prerequisites
- Laptop with a working webcam.
- Python + OpenCV or equivalent.
- You will **not** be given starter code; implement from scratch or using libraries.
- Create a repo folder named `cv-lab-canny-<yourname>` with:
  - `labsheet.md` (this file)
  - `src/` (your code files)
  - `results/` (all images you save)
  - `notes.md` (your answers and observations)

---

## Background

### Gaussian Filter (σ = 1, actual 3×3 from formula)
[ [0.059, 0.097, 0.059],
[0.097, 0.159, 0.097],
[0.059, 0.097, 0.059] ]

shell
Copy code

### Unsharp Masking (Sharpening)
Sharpened = Original + α * (Original – Smooth)

shell
Copy code

### Prewitt Kernels
Px = [ [-1, 0, 1],
[-1, 0, 1],
[-1, 0, 1] ]

Py = [ [ 1, 1, 1],
[ 0, 0, 0],
[-1, -1, -1] ]

shell
Copy code

### Sobel Kernels
Sx = [ [-1, 0, 1],
[-2, 0, 2],
[-1, 0, 1] ]

Sy = [ [-1, -2, -1],
[ 0, 0, 0],
[ 1, 2, 1] ]

shell
Copy code

### Gradient Magnitude and Direction
|∇f| = sqrt(Gx^2 + Gy^2)
θ = atan2(Gy, Gx)

yaml
Copy code

### Canny Pipeline
1. Gaussian smoothing  
2. Gradient (Sobel recommended)  
3. Non-Maximum Suppression (NMS)  
4. Double Thresholding  
5. Hysteresis

---

## Part A — Manual Exercises

### A1. Gaussian Smoothing (Center Pixel)
Given the patch:
10 20 30
20 30 40
30 40 50

scss
Copy code
Compute the smoothed center pixel using the Gaussian kernel above (use replicate padding if needed).

### A2. Gaussian Smoothing (Corner Pixel)
Compute the smoothed top-left pixel using replicate padding.

### A3. Unsharp Masking (Center Pixel)
Using A1’s smooth value:
Detail = Original(center) – Smooth(center)
Sharpened(center) = Original(center) + α * Detail

mathematica
Copy code
Do this for α = 1.0 and α = 1.5.

### A4. Prewitt Gradient (Vertical Edge)
Patch:
10 10 200
10 10 200
10 10 200

makefile
Copy code
Compute `Gx, Gy, |∇f|, θ`. State edge orientation.

### A5. Sobel Gradient (Horizontal Edge)
Patch:
10 10 10
10 10 10
200 200 200

csharp
Copy code
Compute `Gx, Gy, |∇f|, θ`. Compare with Prewitt.

### A6. Non-Maximum Suppression (1D Concept)
Gradient magnitudes:
[0, 5, 10, 6, 2]

scss
Copy code
After NMS, which pixel(s) survive?

### A7. Double Thresholding + Hysteresis
Magnitudes:
[40, 80, 20, 100, 50]

yaml
Copy code
Thresholds: low = 30, high = 70.  
1. Label as Strong, Weak, or Non-edge.  
2. Apply hysteresis: which weak edges remain?

---

## Part B — Webcam Implementation

### B1. Capture a Frame
Capture one grayscale frame from the webcam.  
Save as `results/webcam_gray.png`.

### B2. Gaussian Smoothing
Apply Gaussian blur with at least 3 σ values (e.g., 0.8, 1.5, 2.5).  
Save results in `results/`.

### B3. Unsharp Masking
Apply unsharp masking with α = 0.5, 1.0, 1.5.  
Save results.

### B4. Prewitt Gradients
Apply Prewitt Px, Py.  
Save:
prewitt_gx.png
prewitt_gy.png
prewitt_mag.png
prewitt_dir.png

makefile
Copy code

### B5. Sobel Gradients
Apply Sobel Sx, Sy.  
Save:
sobel_gx.png
sobel_gy.png
sobel_mag.png
sobel_dir.png

yaml
Copy code

### B6. Non-Maximum Suppression
Implement NMS (quantize θ to {0°, 45°, 90°, 135°}).  
Save `results/nms.png`.

### B7. Double Thresholding
Pick thresholds systematically (e.g., percentiles).  
Save `results/double_threshold.png`.

### B8. Hysteresis
Implement edge tracking by connectivity.  
Save `results/hysteresis.png`.

### B9. Full Canny (Optional)
Run library Canny for comparison.  
Save `results/canny_lib.png`.

### B10. Sensitivity Study
Vary σ and thresholds, save different results.  
Summarize in `notes.md`.

---

## Deliverables
- `notes.md`: manual calculations (Part A) + answers.
- `results/`: all output images.
- `src/`: your code files.
- `README.md`: short run instructions.

---

## Marking Scheme
- Part A (manual): 30 pts  
- Part B (implementation): 60 pts  
- Sensitivity + reflection: 10 pts

---

## Appendix — Kernels

### Gaussian (σ=1, 3×3)
[ [0.059, 0.097, 0.059],
[0.097, 0.159, 0.097],
[0.059, 0.097, 0.059] ]

shell
Copy code

### Prewitt
Px = [ [-1, 0, 1],
[-1, 0, 1],
[-1, 0, 1] ]

Py = [ [ 1, 1, 1],
[ 0, 0, 0],
[-1, -1, -1] ]

shell
Copy code

### Sobel
Sx = [ [-1, 0, 1],
[-2, 0, 2],
[-1, 0, 1] ]

Sy = [ [-1, -2, -1],
[ 0, 0, 0],
[ 1, 2, 1] ]
