from unittest import result
import cv2 as cv
from google.colab.patches import cv2_imshow


#class RobotEyesExtended(object):
def __init__(self, img1, img2, diff):
    self.img1 = img1
    self.img2 = img2
    self.diff = diff

@property
def compare_images_custom(self):
    cv.imread(self.img1)
    cv.imread(self.img2)
    self.diff = cv.hconcat((self.img1, self.img2))
    return cv2_imshow(self.diff)
