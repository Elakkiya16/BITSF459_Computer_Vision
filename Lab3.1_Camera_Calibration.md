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
```

---

## 📄 Task 2 — Calibration (`README_Task2.md`)

```markdown
# Task 2 — Camera Calibration

### 🎯 Objective
Calibrate your webcam to compute the camera matrix and distortion coefficients.

---

## Steps
1. Use the images saved in `calib_webcam/`.
2. Run the calibration script:

```python
import cv2, glob, numpy as np

pattern_size = (8,6)  # inner corners (if 9x7 squares printed)
square_size = 1.0

objp = np.zeros((pattern_size[0]*pattern_size[1],3), np.float32)
objp[:,:2] = np.mgrid[0:pattern_size[0],0:pattern_size[1]].T.reshape(-1,2) * square_size

objpoints, imgpoints = [], []
images = glob.glob("calib_webcam/*.jpg")

for fname in images:
    img = cv2.imread(fname)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    ret, corners = cv2.findChessboardCorners(gray, pattern_size, None)
    if ret:
        corners = cv2.cornerSubPix(gray, corners, (11,11), (-1,-1),
                                   (cv2.TERM_CRITERIA_EPS+cv2.TERM_CRITERIA_MAX_ITER,30,0.001))
        objpoints.append(objp)
        imgpoints.append(corners)

ret, K, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

print("\nCamera Matrix (K):\n", K)
print("Distortion Coefficients:\n", dist.ravel())
```

---

## 📄 Task 3 — Distortion Correction (`README_Task3.md`)

```markdown
# Task 3 — Distortion Correction

### 🎯 Objective
Demonstrate distortion correction in a live webcam feed.

---

## Steps
1. Load your saved calibration results (`K`, `dist`).
2. Run the undistortion demo:

```python
import cv2, numpy as np

data = np.load("calib_results_webcam.npz", allow_pickle=True)
K, dist, shape = data["K"], data["dist"], tuple(data["shape"])

cap = cv2.VideoCapture(0)
while True:
    ret, frame = cap.read()
    if not ret: break
    und = cv2.undistort(frame, K, dist, None, K)
    both = cv2.hconcat([frame, und])
    cv2.imshow("Original (Left) vs Undistorted (Right)", both)
    if cv2.waitKey(1) == 27: break
cap.release()
cv2.destroyAllWindows()
```
