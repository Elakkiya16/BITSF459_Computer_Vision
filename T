````markdown
# BITS F459 – Computer Vision
## Lab 08 – Manual Image Recognition (No ML Models)
**Instructor:** Dr. Elakkiya Rajasekar  
**Duration:** 100 minutes

---

## 📘 Overview
This lab introduces the fundamentals of **Recognition, Detection, Classification, Identification, and Scene Categorization** *without using any Machine Learning or Deep Learning models*. All tasks are done manually using logical reasoning, simple cropping, drawing rectangles, and interpreting visual cues.

To ensure students can complete the tasks independently, this sheet now includes **direct image links** and **step-by-step instructions**.

Your next lab will build on this with actual ML/DL models.

---

## 📁 Image Dataset Links
To make this lab fully self-contained, the following **public-domain / open-license images** are used. These links are stable and suitable for student access.

### **Verification Images (Lamps / Non‑lamps)**
Use the following CC0 images:
- Lamp 1: https://images.unsplash.com/photo-1504208434309-cb69f4fe52b0
- Lamp 2: https://images.unsplash.com/photo-1507226983735-a838615193b0
- Non-lamp 1: https://images.unsplash.com/photo-1503602642458-232111445657

### **Detection Image (People in a Street Scene)**
- Street crowd (public domain): https://images.unsplash.com/photo-1500530855697-b586d89ba3ee

### **Identification Images (Landmarks)**
- Eiffel Tower: https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg
- Taj Mahal: https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg
- Potala Palace: https://upload.wikimedia.org/wikipedia/commons/1/12/Potala_Palace_2016.jpg
- Mixed query set can be created from crops of the above.

### **Classification Image (City Scene)**
- City scene with multiple objects: https://images.unsplash.com/photo-1508057198894-247b23fe5ade

### **Scene Categorization Images (Optional)**
- Indoor: https://images.unsplash.com/photo-1505691938895-1758d7feb511
- Nature: https://images.unsplash.com/photo-1501785888041-af3ef285b470
- Sports: https://images.unsplash.com/photo-1508609349937-5ec4ae374ebf

---

# 🔬 Part A – Manual Recognition Tasks

## **Task 1: Verification – *Is that a lamp?***
Download verification images from the link above.

### **What to do:**
1. Inspect each image visually. No code needed.
2. Answer **Yes/No** for each: *"Is there a lamp?"*
3. Justify with 1–2 sentences: shape, texture, context, silhouette.

**Deliverable:** `verification.txt`

---

## **Task 2: Detection – *Where are the people?***
Image link: https://raw.githubusercontent.com/your-repo/Lab08/data/detection/street.png

### **What to do:**
1. Load the image in Python:
   ```python
   img = cv2.imread('street.png')
````

2. Visually inspect and identify people manually.
3. Record bounding box coordinates as `(x1, y1, x2, y2)`.
4. Draw rectangles manually:

   ```python
   cv2.rectangle(img, (x1, y1), (x2, y2), (0,255,0), 2)
   cv2.imwrite('output/manual_people_detection.png', img)
   ```
5. Crop each detected region and save to: `output/crops/`

**Deliverables:**

* `manual_people_detection.png`
* bounding box coordinate file

---

## **Task 3: Identification – *Which landmark is this?***

Use the landmark dataset link above.

### **What to do:**

1. Compare each query image with known reference landmarks.
2. Decide the identity: *Potala Palace / Eiffel Tower / Taj Mahal / Unknown*.
3. Justify briefly (roof style, silhouette, symmetry, color).

**Deliverable:** `identification_answers.txt`

---

## **Task 4: Classification – *What objects are present?***

Image link: [https://raw.githubusercontent.com/your-repo/Lab08/data/classification/city_scene.jpg](https://raw.githubusercontent.com/your-repo/Lab08/data/classification/city_scene.jpg)

### **What to do:**

1. Identify **at least 8 object categories** manually.
2. Locate one region per class.
3. Crop using:

   ```python
   crop = img[y1:y2, x1:x2]
   cv2.imwrite('output/classification_crops/car.png', crop)
   ```
4. Write short justification for each object.

**Deliverables:**

* `classification_list.txt`
* Crop folder: `classification_crops/`

---

## **Task 5: Scene Categorization**

### **What to do:**

1. Look at global cues: sky, road, buildings, trees, lighting.
2. Assign one category: city, indoor, nature, sports, etc.
3. Brief reasoning.

**Deliverable:** `scene_category.txt`

---

# 🧠 Part B – Why Recognition Is Hard

## **Task 6: Variability Challenges**

For each challenge:

* Scale
* Illumination
* Occlusion
* Deformation
* Background clutter
* Viewpoint

### **What to do:**

1. Select any image from the dataset.
2. Crop a region illustrating the difficulty.
3. Explain why **template matching fails**.

**Deliverable:** `recognition_challenges.pdf`

---

# 🎨 Part C – Creative Extension

## **Task 7: Create Your Own Recognition Problem**

### **What to do:**

1. Take a photo yourself OR pick a complex scene online.
2. Pose two questions like:

   * *“Is there a dog?”*
   * *“Where is the book?”*
3. Solve them manually using bounding boxes or crops.
4. Discuss difficulty.

**Deliverable:** `my_custom_recognition_problem.pdf`

---

# 💬 Reflection

## **Task 8: Manual vs Model-Based Recognition**

### **What to do:**

Write 3–5 sentences addressing:

* Which manual task was hardest
* What ML/DL would automate
* One insight you gained about recognition

**Deliverable:** `reflection.txt`

---

# 📦 Final Submission Checklist

Submit your final folder with:

```
manual_recognition_lab/
│── verification.txt
│── output/manual_people_detection.png
│── identification_answers.txt
│── classification_list.txt
│── output/classification_crops/
│── scene_category.txt
│── recognition_challenges.pdf
│── my_custom_recognition_problem.pdf
│── reflection.txt
```

```
```
