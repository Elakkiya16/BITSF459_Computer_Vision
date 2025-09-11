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
   import cv2, glob, numpy as np

   pattern_size = (8,6)  # inner corners if 9x7 squares printed
   square_size = 1.0     # any unit (e.g., 1.0 or cm)

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
           cv2.drawChessboardCorners(img, pattern_size, corners, ret)
           cv2.imshow("Corners", img)
           cv2.waitKey(200)
   cv2.destroyAllWindows()

   # Calibration
   ret, K, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

   print("\nCamera Matrix (K):\n", K)
   print("Distortion Coefficients:\n", dist.ravel())

   # Compute reprojection error
   total_err = 0
   for i in range(len(objpoints)):
       imgpoints2, _ = cv2.projectPoints(objpoints[i], rvecs[i], tvecs[i], K, dist)
       err = cv2.norm(imgpoints[i], imgpoints2, cv2.NORM_L2)/len(imgpoints2)
       total_err += err
   mean_err = total_err/len(objpoints)
   print("Mean Reprojection Error (px):", mean_err)

   # Save results
   np.savez("calib_results_webcam.npz", K=K, dist=dist, shape=gray.shape[::-1])
