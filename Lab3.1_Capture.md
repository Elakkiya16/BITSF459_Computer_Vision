# Task 3.1 — Webcam Capture

### 📚 Concept Recap
Camera calibration requires **multiple images** of a known pattern (checkerboard).  
A single picture is not enough — we need different **angles, distances, and tilts** to estimate how the camera lens distorts the image.  
This task focuses on **building your calibration dataset**.

---

### 🎯 Objective
Capture **12–20 images** of a checkerboard using your laptop webcam at different orientations.

---

### 🛠️ Steps
1. **Prepare the checkerboard**
   - Print a checkerboard (e.g., 9×7 squares → 8×6 inner corners).
   - Stick it onto a flat surface (cardboard or wall).

2. **Run the capture script**
   ```python
   import cv2, os, time

   save_dir = "calib_webcam"
   os.makedirs(save_dir, exist_ok=True)

   cap = cv2.VideoCapture(0)
   count = 0
   while True:
       ret, frame = cap.read()
       if not ret: break
       cv2.imshow("Press SPACE=save | ESC=quit", frame)
       key = cv2.waitKey(1) & 0xFF
       if key == 27: break  # ESC to quit
       elif key == 32:      # SPACE to save
           fname = f"{save_dir}/img_{count:02d}.jpg"
           cv2.imwrite(fname, frame)
           print("Saved", fname)
           count += 1
           time.sleep(0.2)
   cap.release()
   cv2.destroyAllWindows()
```
