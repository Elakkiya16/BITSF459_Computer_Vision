# 🧪 Computer Vision Lab — Image Transformations & Mini Snapchat Filter

This lab extends your work from **Step 3: Image Transformations** into fun applications. You will first complete static transformations, then explore tasks on **pencil sketching**, **image formats**, and finally an **interactive Mini Snapchat Filter**.

---

## ✅ Step 3 Recap: Image Transformations

* You have already implemented transformations on your selfie (`my_selfie.jpg`):

  * Mirror (flip)
  * Negative
  * Brighten / Darken
  * Rotation
  * Blur
* You also created a **comparison subplot** to see all transforms side by side.

---

## ✏️ Task A — Pencil Sketch (Color Dodge)

**Goal:** Convert your selfie into a pencil sketch.

**Algorithm:**

1. Convert image to **grayscale**
2. **Invert** grayscale image
3. **Blur** the inverted image (try kernel sizes `(11,11)`, `(21,21)`, `(31,31)`)
4. Apply **color dodge blend**:

   ```text
   sketch = gray / (255 - blur)
   ```

**Deliverables:**

* Save result as `pencil_sketch.jpg`
* 2–3 lines about how kernel size affects the sketch

**Hints:**

* Use `cv2.bitwise_not()` or `255 - gray` for inversion
* Use `cv2.GaussianBlur()` for smoothing
* Use `cv2.divide()` for color dodge

---

## 📦 Task B — Image Format Playground

**Goal:** Save and compare the same selfie in multiple formats.

**Steps:**

1. Save `my_selfie.jpg` as:

   * PNG (lossless)
   * JPEG (quality=95)
   * JPEG (quality=30)
   * WEBP (quality=80)
2. Reload and show all four in a **2×2 subplot** with file sizes in titles
3. (Optional) Create a **difference map** between PNG and JPEG(30)

**Deliverables:**

* `format_comparison.png` (subplot with file sizes)
* Short paragraph: when to use PNG vs JPEG vs WEBP

**Hints:**

* Use `os.path.getsize(file)//1024` for size in KB
* Use `cv2.absdiff()` for difference map

---

## 🎥 Extension — Mini Snapchat Filter (Instructor Demo + Student Task)

After you finish static tasks, we move to a **live webcam demo**. The instructor will show how pressing keys can switch between filters in real time — like Snapchat filters.

### Instructor Demo (shown live)

* Press `m` → Mirror
* Press `n` → Negative
* Press `b` → Bright
* Press `d` → Dark
* Press `r` → Rotate
* Press `g` → Blur
* Press `q` → Quit

### Student Task — Build Your Own Mini Snapchat Filter

**Pseudo-code Scaffold:**

```text
1. Open webcam (VideoCapture)
2. While webcam is running:
    a. Capture frame
    b. If key == 'm' → Mirror filter
       If key == 'n' → Negative filter
       If key == 'b' → Brighten filter
       If key == 'd' → Darken filter
       If key == 'r' → Rotate frame
       If key == 'g' → Gaussian blur
       If key == 'p' → Pencil sketch filter (extra challenge)
    c. Show transformed frame
3. Quit when key == 'q'
```

**Deliverables:**

* Working live filter script
* At least 3 filters implemented
* Add a **pencil sketch filter** as `p`
* Bonus: save a frame on pressing `s`

### Rubric (10 pts)

* Webcam loop works (2)
* At least 3 filters implemented (3)
* Pencil sketch added live (3)
* Creativity / bonus features (2)

---

## 📦 Submission Package

* `pencil_sketch.jpg`
* `format_comparison.png`
* (Optional) difference map
* Live filter script + screenshot / short video
* Short write-up:

  * Blur kernel size effect on sketch
  * When to use different formats
  * Which live filters you added

---

### 🎯 Learning Outcomes

* Understand **intensity transformations** (bright, dark, negative)
* Apply **geometric transformations** (flip, rotate)
* Explore **blur and sketching** as creative effects
* Learn differences between **image formats**
* Connect to **real-world AR apps** through a **mini Snapchat filter**
