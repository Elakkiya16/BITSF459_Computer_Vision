# Lab 3 Task Sheet
### 📚 Concept Recap
Calibration is not only about one camera or one test.  
Exploring different setups helps us understand **robustness and limitations** of the method.

---

### 🎯 Objective
Perform additional experiments to deepen your understanding of calibration.

---

### 🛠️ Tasks
#### 1. Experiment on Different Cameras (if available)
- Calibrate both your **laptop webcam** and a **phone camera**.
- Compare results:
  - Camera Matrix (K)
  - Distortion Coefficients
- Answer: *Which camera shows more distortion?*

#### 2. Apply Undistortion to a Saved Image
- Take a photo of an object with straight edges (e.g., door frame, bookshelf).
- Use your calibration results to undistort the image.
- Compare **before vs after**.

#### 3. Different Pattern Size Test
- Modify `pattern_size` in your code (e.g., set `(7,5)` instead of `(8,6)`).
- Observe:
  - Does corner detection fail?
  - Does calibration run incorrectly?
- Write down your observations.

---

### 📦 Deliverables
- Comparison results: **Laptop vs Phone Camera distortion**.  
- **Before/After images** of a saved photo after undistortion.  
- Short notes on **pattern size experiment**.  

---

### 🤔 Reflection Questions
1. Why does calibration fail if the wrong `pattern_size` is given?  
2. Which type of camera (wide-angle phone lens vs laptop webcam) is more prone to distortion?  
