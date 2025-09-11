# Task 1 — Webcam Capture

### 🎯 Objective
Use your laptop webcam to capture calibration images of a checkerboard at different orientations.

---

## Steps
1. Print a checkerboard (e.g., 9×7 squares → 8×6 inner corners).
2. Run the capture script:

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
    if key == 27: break  # ESC
    elif key == 32:      # SPACE
        fname = f"{save_dir}/img_{count:02d}.jpg"
        cv2.imwrite(fname, frame)
        print("Saved", fname)
        count += 1
        time.sleep(0.2)
cap.release()
cv2.destroyAllWindows()
