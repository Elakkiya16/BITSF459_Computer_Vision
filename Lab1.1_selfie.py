# First, let's import the necessary library
import cv2

# Initialize your webcam
camera = cv2.VideoCapture(0)

print("📸 Welcome to Selfie Lab!")
print("👉 Press 's' to take a selfie")
print("👉 Press 'q' to quit without saving")

# Create a window to see yourself
cv2.namedWindow('Your Webcam - Press s to capture!')

while True:
    # Read frame from camera
    success, frame = camera.read()
    
    if not success:
        print("❌ Couldn't access webcam. Check your camera permissions!")
        break
    
    # Show the webcam feed
    cv2.imshow('Your Webcam - Press s to capture!', frame)
    
    # Check for key presses
    key = cv2.waitKey(1) & 0xFF
    
    if key == ord('s'):  # 's' key pressed - save selfie
        cv2.imwrite('my_selfie.jpg', frame)
        print("✅ Selfie saved as 'my_selfie.jpg'!")
        break
    elif key == ord('q'):  # 'q' key pressed - quit
        print("👋 Exiting without saving...")
        break

# Release the camera and close windows
camera.release()
cv2.destroyAllWindows()