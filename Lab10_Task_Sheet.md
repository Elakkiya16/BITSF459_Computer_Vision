# ConvNetJS CIFAR-10 Exploration Lab

This lab explores Convolutional Neural Networks (CNNs) using Andrej Karpathy’s ConvNetJS CIFAR-10 Demo, which trains a full CNN entirely in the browser using JavaScript.

Demo Link:
[https://cs.stanford.edu/people/karpathy/convnetjs/demo/cifar10.html](https://cs.stanford.edu/people/karpathy/convnetjs/demo/cifar10.html)

## Lab Objectives

By completing this lab, students will:

* Understand how CNN layers are defined and executed in ConvNetJS
* Visualize activations, gradients, and learned weights
* Explore effects of learning rate, momentum, batch size, and weight decay
* Modify CNN architectures and evaluate training behaviour
* Compare shallow, deep, and pooling-free architectures
* Analyze test predictions and mistakes

## Part A — Explore the Default CNN Architecture

The default ConvNetJS model uses:

layer_defs.push({type:'input', out_sx:32, out_sy:32, out_depth:3});
layer_defs.push({type:'conv', sx:5, filters:16, stride:1, pad:2, activation:'relu'});
layer_defs.push({type:'pool', sx:2, stride:2});
layer_defs.push({type:'conv', sx:5, filters:20, stride:1, pad:2, activation:'relu'});
layer_defs.push({type:'pool', sx:2, stride:2});
layer_defs.push({type:'conv', sx:5, filters:20, stride:1, pad:2, activation:'relu'});
layer_defs.push({type:'pool', sx:2, stride:2});
layer_defs.push({type:'softmax', num_classes:10});

### A1. Start Training

* Click "Start Training"
* Observe training accuracy, validation accuracy, loss, and example predictions for 2–3 minutes

### A2. Record Training Stats

| Metric                          | Value |
| ------------------------------- | ----- |
| Forward time per example        |       |
| Backprop time per example       |       |
| Classification Loss             |       |
| L2 Weight Decay Loss            |       |
| Training Accuracy               |       |
| Validation Accuracy             |       |
| Examples Seen                   |       |
| Test Accuracy (last 200 images) |       |

### A3. Layer-by-Layer Visualization

For each Conv, ReLU, Pool, and FC layer, record:

* Max activation
* Min activation
* Max gradient
* Min gradient
* Number of parameters
* Feature map dimensions

### A4. Questions

1. What features do Conv Layer 1 filters capture?
2. Why are Conv Layer 3 activations more abstract?
3. Do gradients vanish or explode anywhere?
4. Why is validation accuracy lower than training accuracy?
5. How does pooling affect spatial resolution?

## Part B — Hyperparameter Experiments

Modify these parameters:

* Learning Rate: 0.001, 0.01, 0.05
* Momentum: 0.5, 0.9
* Batch Size: 1, 4, 32
* Weight Decay: 0, 0.0001, 0.001

### B1. Observations

* Which learning rate caused unstable loss?
* Which momentum produced smooth convergence?
* Did larger batch sizes affect speed or accuracy?
* Did disabling L2 regularization increase overfitting?

## Part C — Try Different CNN Architectures

### Architecture 1 — Shallow Network

layer_defs = [];
layer_defs.push({type:'input', out_sx:32, out_sy:32, out_depth:3});
layer_defs.push({type:'conv', sx:5, filters:8, stride:1, pad:2, activation:'relu'});
layer_defs.push({type:'pool', sx:2, stride:2});
layer_defs.push({type:'softmax', num_classes:10});

Questions:

1. How does reduced depth affect accuracy?
2. Are features more primitive (edges/textures)?

### Architecture 2 — Deeper Network with More Filters

layer_defs = [];
layer_defs.push({type:'input
