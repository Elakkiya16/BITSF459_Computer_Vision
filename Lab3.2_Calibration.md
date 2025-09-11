# Task 2 — Camera Calibration

### 📚 Concept Recap
The goal of calibration is to find how the camera transforms **3D points → 2D image pixels**.  
This gives us:  
- **Camera Matrix (K):** focal length, optical center.  
- **Distortion Coefficients:** lens bending (radial, tangential).  
- **Reprojection Error:** accuracy of calibration (lower = better).

---

### 🎯 Objective
Use the captured images to compute the **camera matrix** and **distortion coefficients**.

---

### 🛠️ Steps
1. **Run the calibration script**
   ```python
import cv2, os, glob, numpy as np

# === Adjust these to your printed board ===
pattern_size = (7, 6)   # (columns, rows) of INNER corners
square_size  = 1.0      # real-world size of a square (any unit: e.g., 1.0)

# Prepare 3D object points for a single board (Z=0 plane)
objp = np.zeros((pattern_size[0]*pattern_size[1], 3), np.float32)
objp[:, :2] = np.mgrid[0:pattern_size[0], 0:pattern_size[1]].T.reshape(-1, 2) * square_size

# Arrays to store 3D points (objpoints) and 2D points (imgpoints) from all images
objpoints, imgpoints = [], []

image_files = sorted(glob.glob("calib_webcam/*.jpg"))
assert image_files, "No images found in calib_webcam/. Capture first!"

for f in image_files:
    img  = cv2.imread(f)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Try to find corners (fast check)
    ret, corners = cv2.findChessboardCorners(gray, pattern_size,
                    flags=cv2.CALIB_CB_ADAPTIVE_THRESH + cv2.CALIB_CB_NORMALIZE_IMAGE)

    if ret:
        # refine to subpixel accuracy
        corners = cv2.cornerSubPix(
            gray, corners, winSize=(11,11), zeroZone=(-1,-1),
            criteria=(cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)
        )
        objpoints.append(objp)
        imgpoints.append(corners)

        cv2.drawChessboardCorners(img, pattern_size, corners, ret)
        cv2.imshow("Detected corners", img)
        cv2.waitKey(100)
    else:
        print("No corners in:", f)

cv2.destroyAllWindows()
print(f"Good images: {len(imgpoints)} / {len(image_files)}")

# Calibrate (intrinsics, distortion, poses)
h, w = gray.shape[:2]
ret, K, dist, rvecs, tvecs = cv2.calibrateCamera(
    objpoints, imgpoints, (w, h), None, None
)

# Reprojection error (lower is better; < 0.5px is great, < 1.0px is OK)
total_err = 0
for i in range(len(objpoints)):
    imgpoints2, _ = cv2.projectPoints(objpoints[i], rvecs[i], tvecs[i], K, dist)
    err = cv2.norm(imgpoints[i], imgpoints2, cv2.NORM_L2) / len(imgpoints2)
    total_err += err
mean_err = total_err / len(objpoints)

print("\n=== Calibration Results ===")
print("RMS (ret):", ret)
print("Camera Matrix K:\n", K)
print("Distortion Coeffs [k1 k2 p1 p2 k3 ...]:\n", dist.ravel())
print("Mean Reprojection Error (px):", mean_err)

# Save results for reuse
np.savez("calib_results_webcam.npz", K=K, dist=dist, shape=(h,w))
print("\nSaved: calib_results_webcam.npz")
