# Lab Sheet – Image Recognition using SLP & MLP  
### Course: Image Recognition & Neural Networks  
### Instructor: Dr. R. Elakkiya

---

## 📌 1. Objective

In this lab, you will:

1. Load a **real-world grayscale image**  
2. Convert it into a **numerical pixel matrix**  
3. Extract **image features** (statistical + edge + histogram)  
4. Build a **Single-Layer Perceptron (SLP)** classifier  
5. Build a **Multi-Layer Perceptron (MLP)** classifier  
6. Compare the two models

---

## 🖼️ 2. Real Images Provided

Two real images are used in this lab.  
Both are grayscale and publicly available (license-free).

### **Image 1 – Handwritten Digit '3'**
Source: MNIST (Open Dataset)

![Image 1](https://upload.wikimedia.org/wikipedia/commons/2/27/MnistExamples.png)

> **Use only the top-left digit ('0') for this lab.**  
> Crop it to 28×28 or resize to 14×14 before extracting features.

---

### **Image 2 – Simple Geometric Shape (Triangle)**  
Source: Wikimedia Public Domain

![Image 2](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Simple_triangle.svg/240px-Simple_triangle.svg.png](https://upload.wikimedia.org/wikipedia/commons/4/4f/Simple_triangle.svg)

> Convert this to **grayscale**, resize to **28×28**, and use it as Image 2.

---

# 🎯 3. Tasks

## 🔹 Task A — Image Processing & Feature Extraction

### **A1. Convert Image to Grayscale Matrix**
Using Python or manual inspection:

- Convert each image into a grayscale matrix (shape 28×28).
- Normalize pixel values to 0–255.
- Display matrix as:

| 128 | 130 | 129 | … |
| 140 | 142 | 141 | … |
| …   | …   | …   | … |

---

### **A2. Compute Global Statistical Features**
For each image, compute:

- Minimum pixel value  
- Maximum pixel value  
- Mean intensity  
- Variance  
- Standard deviation  

Show the formula:

\[
\mu = \frac{1}{N}\sum I_{ij},
\qquad 
\sigma^2 = \frac{1}{N}\sum (I_{ij}-\mu)^2
\]

---

### **A3. Edge-Based Features (Using 3×3 Sobel)**

Use the filters:

Horizontal:

\[
G_x = 
\begin{bmatrix}
-1 & 0 & 1\\
-1 & 0 & 1\\
-1 & 0 & 1
\end{bmatrix}
\]

Vertical:

\[
G_y =
\begin{bmatrix}
1 & 1 & 1\\
0 & 0 & 0\\
-1 & -1 & -1
\end{bmatrix}
\]

Steps:

1. Extract the **3×3 neighborhood around pixel (14,14)**  
2. Compute:

\[
G_x = \sum I \cdot G_x,\quad
G_y = \sum I \cdot G_y
\]

3. Compute gradient magnitude:

\[
G = \sqrt{G_x^2 + G_y^2}
\]

---

### **A4. 4-bin Histogram Feature**
Compute bins:

- 0–63  
- 64–127  
- 128–191  
- 192–255  

Obtain:

\[
H = [h_1, h_2, h_3, h_4]
\]

---

### **A5. Construct Final Feature Vector**

\[
x = [1,\; f_1,\; f_2,\; f_3,\; h_1,\; h_2,\; h_3,\; h_4]^T
\]

Where:

- **1** → bias  
- **\(f_1\)** → |G_x|  
- **\(f_2\)** → |G_y|  
- **\(f_3\)** → mean intensity  
- **\(h_1\)–\(h_4\)** → histogram bin counts  

---

---

# 🔹 Task B — Single Layer Perceptron (SLP)

Given initial SLP weights:

\[
w(0) =
\begin{bmatrix}
-50\\0.3\\0.4\\0.05\\0.02\\-0.01\\0.03\\0.04
\end{bmatrix}
\]

Learning rate:

\[
\eta = 0.01
\]

### **B1. Compute SLP net input**

\[
v = w^T x
\]

Output:

\[
y =
\begin{cases}
+1 & v \ge 0\\
-1 & v < 0
\end{cases}
\]

---

### **B2. SLP Weight Update**

If misclassified:

\[
\Delta w = \eta(d - y)x
\]

\[
w_{\text{new}} = w + \Delta w
\]

Perform at least **one weight update** for each image.

---

---

# 🔹 Task C — Multi Layer Perceptron (MLP)

Use the vector **without bias**:

\[
x_{MLP} = [f_1,\; f_2,\; f_3,\; h_1,\; h_2,\; h_3,\; h_4]
\]

### **MLP Architecture**

Hidden layer (2 neurons):

\[
W^{(1)} =
\begin{bmatrix}
0.1 & 0.2 & 0.3 & 0.4 & 0.2 & -0.1 & 0.05\\
-0.2& 0.1& 0.05& 0.1& -0.3& 0.2& 0.1
\end{bmatrix}
\]

\[
b^{(1)} =
\begin{bmatrix}
0.4\\0.3
\end{bmatrix}
\]

Sigmoid activation:

\[
\sigma(z)=\frac{1}{1+e^{-z}}
\]

Output layer:

\[
W^{(2)} = [1.2,\; -0.5], \quad b^{(2)} = -0.2
\]

---

### **C1. Hidden-layer computation**

\[
z^{(1)} = W^{(1)} x_{MLP} + b^{(1)}
\]

\[
h_i = \sigma(z_i)
\]

---

### **C2. Output-layer computation**

\[
z^{(2)} = W^{(2)}h + b^{(2)}
\]

\[
y = \sigma(z^{(2)})
\]

Decision:

- **Class A** if \(y > 0.5\)  
- **Class B** otherwise  

---

# 🔹 Task D — Compare SLP and MLP

Answer:

1. Which model classified both images correctly?  
2. Which feature had the highest influence on prediction?  
3. Is the problem linearly separable based on your SLP results?  
4. When would you prefer MLP over SLP in real-world image tasks?

---


