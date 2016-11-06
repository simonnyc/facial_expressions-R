####################################
library(OpenImageR)
library(jpeg)
library(pixmap)
############################
#
#
# Author Mohamed Elmoudni
# This function takes a local path where all images (jpg) are stored.
# finds all jpg images. It loops through the images and apply ten different 
# augmentation techniques for each image. Then it writes the augmented images 
# in the same directory as the original image with the postfix "aug" and number of image.  
# Below is an example how to run the function
#
# path<- "C:/CUNY/Courses/IS622/Assignments/Week10Test"
# img_aug(path)
#

img_aug <- function(path) {

# get the list of all images inside the folder 
t<- NULL
t<- data.frame('title'= list.files(path))

# loop through the images and augment the images accordingly 
for   (i in 1:dim(t)[1]) {
  x[i]<- paste(path,sep="/", (t$title[i]))
  img.url <- x[i]
  img <- readJPEG(img.url)
  
  # augment the image flipping horizontally, resizing, shiftting, and zca=100
  img_aug1<-Augmentation(img, flip_mode = 'horizontal', resiz_width = 180, resiz_height = 180, 
                         resiz_method = 'bilinear', shift_rows = 0, shift_cols = 0, 
                         rotate_angle = 350,rotate_method = 'bilinear', zca_comps = 100, 
                         zca_epsilon = 0.1, image_thresh = 0.0)
  
  # write the new augmented image with aug prefix 
  new_image<- sub(".jpg", "_aug1.jpg", img.url)
  writeJPEG( img_aug1, new_image, quality=0.9)
  
  # augment the image by flipping the image horizontally
  img_aug2<- Augmentation(img, flip_mode = 'horizontal')
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug2.jpg", img.url)
  writeJPEG( img_aug2, new_image, quality=0.9)
  
  # augment the image by flipping the image vertically
  img_aug3<- Augmentation(img, flip_mode = 'vertical')
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug3.jpg", img.url)
  writeJPEG( img_aug3, new_image, quality=0.9)
  
  # augment the image by resizing and ratating by 40 degrees
  img_aug4<- Augmentation(img, resiz_width = 90, resiz_height = 90, rotate_angle = 40)
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug4.jpg", img.url)
  writeJPEG( img_aug4, new_image, quality=0.9)
  
  # augment the image by shifting 100 columns
  img_aug5<- Augmentation(img, shift_cols=100)
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug5.jpg", img.url)
  writeJPEG( img_aug5, new_image, quality=0.9)
  
  # augment the image  # augment the image flip, resize, shift, and zca=100
  img_aug6<- Augmentation(img, flip_mode = 'horizontal', resiz_width = 180, resiz_height = 180,
                          shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                          rotate_method = 'bilinear', zca_comps = 10, zca_epsilon = 0.2, image_thresh = 0.0)
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug6.jpg", img.url)
  writeJPEG( img_aug6, new_image, quality=0.9)
  
  # augment the image flipping vertically, resizing, shiftting, and zca=100
  img_aug7<- Augmentation(img, flip_mode = 'vertical', resiz_width = 180, resiz_height = 180, 
                          resiz_method = 'bilinear',shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                          rotate_method = 'bilinear', zca_comps = 100, zca_epsilon = 0.1, image_thresh = 0.0)
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug7.jpg", img.url)
  writeJPEG( img_aug7, new_image, quality=0.9)
  
  #   # augment the image by resizing, shiftting, and zca=100
  img_aug8<- Augmentation(img,  resiz_width = 180, resiz_height = 180, 
                          resiz_method = 'bilinear',shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                          rotate_method = 'bilinear', zca_comps = 100, zca_epsilon = 0.1, image_thresh = 0.0)
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug8.jpg", img.url)
  writeJPEG( img_aug8, new_image, quality=0.9)
  
  # augment the image by resizing using nearest method, shiftting, and zca=100
  img_aug9<- Augmentation(img,  resiz_width = 180, resiz_height = 180, 
                          resiz_method = 'nearest',shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                          rotate_method = 'nearest', zca_comps = 100, zca_epsilon = 0.1, image_thresh = 0.0)
  
  # write the new augmented image with aug# prefix 
  new_image<- sub(".jpg", "_aug9.jpg", img.url)
  writeJPEG( img_aug9, new_image, quality=0.9)
  
  # augment the image by resizing using nearest/bilinear method, shiftting, and zca=100
  img_aug10<- Augmentation(img,  resiz_width = 180, resiz_height = 180, 
                           resiz_method = 'bilinear',shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                           rotate_method = 'nearest', zca_comps = 100, zca_epsilon = 0.1, image_thresh = 0.0)
  
  # write the new augmented image with aug# prefix
  new_image<- sub(".jpg", "_aug10.jpg", img.url)
  writeJPEG( img_aug10, new_image, quality=0.9)
  
}
}

