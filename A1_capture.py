# A1_capture.py
import cv2, os, time

save_dir = "calib_webcam"
os.makedirs(save_dir, exist_ok=True)

cap = cv2.VideoCapture(0)  # change to 1 if you have multiple cams
if not cap.isOpened():
    raise RuntimeError("Webcam not found")

print("Press SPACE to save a frame, ESC to exit.")
count = 0
while True:
    ok, frame = cap.read()
    if not ok: break

    txt = f"Saved: {count}  |  SPACE=save  ESC=quit"
    cv2.putText(frame, txt, (12,30), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255,255,255), 2)
    cv2.imshow("Capture calibration views", frame)

    key = cv2.waitKey(1) & 0xFF
    if key == 27:      # ESC
        break
    elif key == 32:    # SPACE
        fname = os.path.join(save_dir, f"img_{count:02d}.jpg")
        cv2.imwrite(fname, frame)
        print("Saved", fname)
        count += 1
        time.sleep(0.15)  # avoid double taps

cap.release()
cv2.destroyAllWindows()
