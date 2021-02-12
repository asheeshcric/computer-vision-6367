import cv2
import os

def get_index(name):
    if name[-3:-1].isdigit():
        return int(name[-3:-1])
    else:
        return int(name[-2:-1])


for image_name in os.listdir():
    if not image_name.endswith('.jpg'):
        continue
    img = cv2.imread(image_name)
    name = image_name.split('.jpg')
    index = get_index(name[0])
    if name[0][-1:] == 'l':
        cv2.imwrite(f'checkerboardl{index}.jpg', img)
    else:
        cv2.imwrite(f'checkerboardr{index}.jpg', img)

    os.remove(image_name)