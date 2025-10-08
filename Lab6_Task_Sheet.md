# 🧪 Lab 6: Scale Invariant Detection — Laplacian of Gaussian (LoG) Response

## 🎯 Objective

To understand *scale-space representation* and how feature detection becomes **scale invariant** by finding the scale at which a feature’s response is maximal.

---

## 🧠 Concept Recap

In earlier labs, we detected corners at a single scale (Harris detector).  
In this lab, we explore how the **Laplacian of Gaussian (LoG)** behaves as the *scale parameter σ* changes.

The function \( f(x, \sigma) \) gives the **blob strength** at position *x* and scale *σ*.  
We search for points that are **local maxima** in both **position and scale** — meaning they stand out both spatially and across different blur levels.

---

## 🧩 Task 1 — Manual Computation

We study a **blob** of radius \( r = 3 \) pixels.  
For different σ (1–5), compute the normalized LoG response:

\[
f(\sigma) = \sigma^2 \cdot e^{-r^2 / (2\sigma^2)}
\]

Use \( r = 3 \).

| σ | Formula Substitution | Computed f(σ) | Observation |
|:-:|:-:|:-:|:-:|
| 1 | \( 1^2 \cdot e^{-9 / 2} \) | ______ | Too small |
| 2 | \( 2^2 \cdot e^{-9 / 8} \) | ______ | Moderate |
| 3 | \( 3^2 \cdot e^{-9 / 18} \) | ______ | **Strongest** |
| 4 | \( 4^2 \cdot e^{-9 / 32} \) | ______ | Weakens |
| 5 | \( 5^2 \cdot e^{-9 / 50} \) | ______ | Fades |

✳️ **Instructions**
1. Compute each f(σ) value manually (or in Excel).  
2. Plot f(σ) vs. σ.  
3. Identify the σ where f(σ) reaches its **maximum** — this is the **characteristic scale** of the blob.

---

## 💻 Task 2 — Verify with Python

Use the following snippet to visualize the response curve:

```python
import numpy as np
import matplotlib.pyplot as plt

# Blob radius
r = 3

# σ values
sigma = np.arange(1, 6)

# Laplacian of Gaussian response
f = sigma**2 * np.exp(-(r**2) / (2 * sigma**2))

# Plot response
plt.plot(sigma, f, 'o-', linewidth=2)
plt.title('LoG Response vs Scale (r = 3 px)')
plt.xlabel('Scale (σ)')
plt.ylabel('f(σ)')
plt.grid(True)
plt.show()

print("Maximum response at σ =", sigma[np.argmax(f)])

