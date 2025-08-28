# Lab 01 — Selfie I/O, Color Spaces & Transformations

This lab introduces image I/O, webcam capture, color‐space conversions, histograms, and basic geometric/intensity transforms. Designed for **Anaconda (Python 3.10)** on Windows/macOS/Linux.

---

## Objectives

* Capture a selfie from the webcam and save it.
* Convert the selfie to **Gray, HSV, Lab, YCrCb** and understand display vs. storage.
* Plot **grayscale** and **RGB channel** histograms.
* Apply simple transforms: flip, negative, brightness, rotation, blur.

## Prerequisites

* Activate the course environment: `conda activate cvlab`
* Use **Jupyter Lab** for all visualization (avoid `cv2.imshow` in notebooks).

## Suggested Folder Layout

```
Labs/Lab01_SelfieIO/
  ├── README.md
  ├── capture_selfie.py
  ├── my_selfie.jpg                 # produced in Step 1
  ├── gray_selfie.jpg               # produced in Step 3A
  ├── hsv_selfie.jpg                # produced in Step 3A (HSV raw channels)
  ├── lab_selfie.jpg                # produced in Step 3A (Lab encoded channels)
  ├── ycrcb_selfie.jpg              # produced in Step 3A (YCrCb raw channels)
  ├── color_spaces_comparison.jpg   # optional (Step 3B)
  └── transformations_comparison.jpg# optional (Step 4B)
```

---

## Step 1 — Capture a Selfie (desktop script)
Capture your selfie using the webcam. You'll learn:
  - How to initialize and access webcam feed
  - Real-time video display with OpenCV
  - Image capture and saving techniques

> Run as a **standalone script** from Terminal/Command Prompt (or create python file inside Jupyter).

Save as `capture_selfie.py` and run `python capture_selfie.py`.

```python
import cv2

cap = cv2.VideoCapture(0)
cv2.namedWindow('Webcam — press s to save, q to quit')

while True:
    ok, frame = cap.read()
    if not ok:
        print('Camera not accessible. Check permissions.')
        break
    cv2.imshow('Webcam — press s to save, q to quit', frame)
    k = cv2.waitKey(1) & 0xFF
    if k == ord('s'):
        cv2.imwrite('my_selfie.jpg', frame)
        print("Saved my_selfie.jpg")
        break
    elif k == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```

> Tips: Click the window to focus before pressing keys. On macOS, grant Camera permissions to Terminal/VS Code.

---
## Step 2: Color Space Exploration (Individual)
Explore different color spaces one by one:
  - **BGR/RGB**: Default color space in OpenCV
  - **Grayscale**: Single-channel intensity representation
  - **HSV**: Hue, Saturation, Value color space
  - **LAB**: Perceptually uniform color space
  - **YCrCb**: Luminance and chrominance components

### Step 2A — Color Space Conversions (notebook‑safe, no subplots)

Use **Matplotlib** for display and save raw color‐space arrays to disk.

```python
import cv2
import matplotlib.pyplot as plt

selfie = cv2.imread('my_selfie.jpg')
assert selfie is not None, "my_selfie.jpg not found. Complete Step 1 first."

# Conversions
gray  = cv2.cvtColor(selfie, cv2.COLOR_BGR2GRAY)
hsv   = cv2.cvtColor(selfie, cv2.COLOR_BGR2HSV)
lab   = cv2.cvtColor(selfie, cv2.COLOR_BGR2LAB)
ycrcb = cv2.cvtColor(selfie, cv2.COLOR_BGR2YCrCb)

# Save raw channels (HSV/Lab/YCrCb are not directly viewable images)
cv2.imwrite('gray_selfie.jpg', gray)
cv2.imwrite('hsv_selfie.jpg', hsv)
cv2.imwrite('lab_selfie.jpg', lab)
cv2.imwrite('ycrcb_selfie.jpg', ycrcb)

# Display (convert to RGB for natural viewing)
plt.figure(figsize=(6,5)); plt.imshow(cv2.cvtColor(selfie, cv2.COLOR_BGR2RGB)); plt.axis('off'); plt.title('Original (BGR→RGB)'); plt.show()
plt.figure(figsize=(6,5)); plt.imshow(gray, cmap='gray'); plt.axis('off'); plt.title('Grayscale'); plt.show()
plt.figure(figsize=(6,5)); plt.imshow(cv2.cvtColor(hsv,   cv2.COLOR_HSV2RGB));   plt.axis('off'); plt.title('HSV (display)');   plt.show()
plt.figure(figsize=(6,5)); plt.imshow(cv2.cvtColor(lab,   cv2.COLOR_LAB2RGB));   plt.axis('off'); plt.title('Lab (display)');   plt.show()
plt.figure(figsize=(6,5)); plt.imshow(cv2.cvtColor(ycrcb, cv2.COLOR_YCrCb2RGB)); plt.axis('off'); plt.title('YCrCb (display)'); plt.show()
```

### Optional Step 2B — Comparison Grid (subplots)

```python
import cv2, matplotlib.pyplot as plt
selfie = cv2.imread('my_selfie.jpg')
gray  = cv2.cvtColor(selfie, cv2.COLOR_BGR2GRAY)
hsv   = cv2.cvtColor(selfie, cv2.COLOR_BGR2HSV)
lab   = cv2.cvtColor(selfie, cv2.COLOR_BGR2LAB)
ycrcb = cv2.cvtColor(selfie, cv2.COLOR_BGR2YCrCb)

plt.figure(figsize=(15,8))
plt.subplot(2,3,1); plt.imshow(cv2.cvtColor(selfie, cv2.COLOR_BGR2RGB)); plt.title('BGR→RGB'); plt.axis('off')
plt.subplot(2,3,2); plt.imshow(gray, cmap='gray'); plt.title('Gray'); plt.axis('off')
plt.subplot(2,3,3); plt.imshow(cv2.cvtColor(hsv, cv2.COLOR_HSV2RGB)); plt.title('HSV'); plt.axis('off')
plt.subplot(2,3,4); plt.imshow(cv2.cvtColor(lab, cv2.COLOR_LAB2RGB)); plt.title('Lab'); plt.axis('off')
plt.subplot(2,3,5); plt.imshow(cv2.cvtColor(ycrcb, cv2.COLOR_YCrCb2RGB)); plt.title('YCrCb'); plt.axis('off')
plt.subplot(2,3,6); plt.imshow(cv2.split(hsv)[0], cmap='hsv'); plt.title('Hue channel'); plt.axis('off')
plt.tight_layout(); plt.savefig('color_spaces_comparison.jpg', dpi=150, bbox_inches='tight'); plt.show()
```

---
## Step 3: Image Transformations (Individual)
Apply various transformations to your image:
  - **Mirror Effect:** Horizontal flipping
  - **Negative Effect:** Photo negative transformation
  - **Brightness Adjustment:** Increase and decrease intensity
  - **Rotation:** 45-degree image rotation
  - **Blur Effect:** Gaussian smoothing
### Step 3A — Image Transformations (notebook‑safe, no subplots)

```python
import cv2, matplotlib.pyplot as plt
img = cv2.imread('my_selfie.jpg')
assert img is not None

mirror   = cv2.flip(img, 1)                             # horizontal flip
negative = 255 - img                                     # intensity invert
bright   = cv2.convertScaleAbs(img, alpha=1, beta=50)    # brighten
dark     = cv2.convertScaleAbs(img, alpha=1, beta=-50)   # darken
h, w = img.shape[:2]; M = cv2.getRotationMatrix2D((w//2,h//2), 45, 1.0)
rotated_45 = cv2.warpAffine(img, M, (w, h))
blurred  = cv2.GaussianBlur(img, (15,15), 0)

# Save results
cv2.imwrite('mirror_selfie.jpg', mirror)
cv2.imwrite('negative_selfie.jpg', negative)
cv2.imwrite('bright_selfie.jpg', bright)
cv2.imwrite('dark_selfie.jpg', dark)
cv2.imwrite('rotated_45.jpg', rotated_45)
cv2.imwrite('blurred_selfie.jpg', blurred)

# Display individually
for title, im in [
    ('Original', img), ('Mirror', mirror), ('Negative', negative),
    ('Bright +50', bright), ('Dark -50', dark), ('Rotated 45°', rotated_45), ('Blurred', blurred)
]:
    plt.figure(figsize=(6,5)); plt.imshow(cv2.cvtColor(im, cv2.COLOR_BGR2RGB)); plt.axis('off'); plt.title(title); plt.show()
```

### Optional Step 3B — Transformations Grid (subplots)

```python
import cv2, matplotlib.pyplot as plt
img = cv2.imread('my_selfie.jpg')
mirror = cv2.flip(img,1); negative = 255-img
bright = cv2.convertScaleAbs(img, alpha=1, beta=50)
dark   = cv2.convertScaleAbs(img, alpha=1, beta=-50)
h,w=img.shape[:2]; M=cv2.getRotationMatrix2D((w//2,h//2),45,1.0); rotated_45=cv2.warpAffine(img,M,(w,h))
blurred=cv2.GaussianBlur(img,(15,15),0)

plt.figure(figsize=(15,10))
for i,(title,im) in enumerate([
    ('Original',img),('Mirror',mirror),('Negative',negative),('Bright',bright),('Dark',dark),('Rotated 45°',rotated_45),('Blurred',blurred)
], start=1):
    plt.subplot(2,4,i); plt.imshow(cv2.cvtColor(im, cv2.COLOR_BGR2RGB)); plt.title(title); plt.axis('off')
# Bonus: edges
edges = cv2.Canny(cv2.cvtColor(img, cv2.COLOR_BGR2GRAY), 100, 200)
plt.subplot(2,4,8); plt.imshow(edges, cmap='gray'); plt.title('Edges'); plt.axis('off')
plt.tight_layout(); plt.savefig('transformations_comparison.jpg', dpi=150, bbox_inches='tight'); plt.show()
```

---

## Step 4 — Histograms (grayscale + RGB channels)

```python
import cv2, numpy as np, matplotlib.pyplot as plt
img = cv2.imread('my_selfie.jpg')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Grayscale histogram
plt.figure(figsize=(6,4))
plt.hist(gray.ravel(), bins=256, range=[0,256], color='black'); plt.title('Grayscale Histogram'); plt.xlabel('Intensity'); plt.ylabel('Count'); plt.show()

# RGB channel histograms
plt.figure(figsize=(6,4))
for i, col in enumerate(('b','g','r')):
    hist = cv2.calcHist([img],[i],None,[256],[0,256])
    plt.plot(hist, label=col)
plt.xlim([0,256]); plt.title('RGB Channel Histograms'); plt.xlabel('Intensity'); plt.ylabel('Count'); plt.legend(); plt.show()
```

---

