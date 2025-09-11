# Task 3 — Distortion Correction

### 📚 Concept Recap
Cameras often bend straight lines due to lens distortion.  
Calibration provides distortion coefficients so we can **undistort images**.  
This is essential in AR, robotics, and 3D vision — without correction, geometry-based algorithms would be inaccurate.

---

### 🎯 Objective
Show a **side-by-side feed** of the raw webcam image and the undistorted image.

---

### 🛠️ Steps
1. **Run the live undistortion demo**
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
