# Leaf-Disease-Identification

## The main objective of this project is to train the machine to predict the disease. Plant disease will be basically identified by observing different patterns on the parts of the plant. The disease part is detected through image processing and machine learning.

## The system design mainly consists of 
### 1) Image collection 
### 2) Image Preprocessing 
### 3) Image segmentation 
### 4) Feature extraction 
### 5) Training
### 6) Classification using Multiclass SVM

### The available dataset devided in following 5 classes. 1) Alternaria Alternata  2) Anthracnose  3) Bacterial Blight  4) Cercospora Leaf Spot   5) Healthy Leaves.

### Image collection: 
#### The sample images of the diseased leaves are collected and are used in training the system. To train and to test the system, diseased leaf images and fewer healthy images are taken. The images will be stored in some standard format. In this study, the available images from the internet are also taken. The leaf images that are infected by Alternaria Alternata, Anthracnose, Bacterial Blight, Cercospora Leaf Spot and Healthy leaf are also included.

### Image Preprocessing: 
#### Image pre-processing is significant for genuine data that are frequently noisy and uneven. During this phase, the transformation is applied to convert the image into another image to improve the quality that better suits for analyzing. Properties like boundaries and edges are better viewed in black and white images; statistical properties related to intensities are observed in greyscale format, and the information related to color is seen well in RGB and other color formats of the image. In this system, the image will be resized to 256x256 and thresholding is done using Otsu’s method which converts the intensity image to binary image. Convert the RGB image format to a gray-scale image. Input image’s histogram is used to compute the mean of the distribution and then scaled to a normalized value between 0 and 1. 

### Image segmentation: 
#### During image segmentation, the given image is separated into a homogeneous region based on certain features. Larger data sets are put together into clusters of smaller and similar data sets using clustering method.  In this proposed work, K-means clustering algorithm is used in segmenting the given image into three sets as a cluster that contains the diseased part of the leaf. Since we have to consider all of the colors for segmentation, intensities are kept aside for a while and only color information is taken into consideration. The RGB image is transformed into LAB form (L-luminous, a*b-chromous). Of the three dimensional LAB, only last two are considered and stored as AB.  As the image is converted from RGB to LAB, only the “a” component i.e. the color component is extracted.

#### process of K-Means Algorithm are as follows:
#### 1. The given data set should be divided into K number of clusters and data points need to be assigned to each of these clusters             randomly. 
#### 2. For each data point, the distance from data point to each cluster is computed using Euclidean distance The Euclidean distance is         nothing but the distance between two-pixel points and is given as follows: Euclidean Distance=√ ((x1-x2)² + (y1 -y2)²) where             (x1, y1) & (x2, y2) are two pixel points (or two data points).  
#### 3. The data point which is nearer to the cluster to which it belongs to should be left as it is.   
#### 4. The data point which is not close to the cluster to which it belongs to should be then shifted to the nearby cluster.  
#### 5.  Repeat all the above steps for entire data points. 6. Once the clusters are constant, clustering process needs to be stopped. 
 
### Feature extraction:
#### From the input images, the features are to be extracted. To do so instead of choosing the whole set of pixels we can choose only which are necessary and sufficient to describe the whole of the segment. The segmented image is first selected by manual interference. The affected area of the image can be found from calculating the area connecting the components. First, the connected components with 6 neighborhood pixels are found. Later the basic region properties of the input binary image are found. The interest here is only with the area. The affected area is found out. The percent area covered in this segment says about the quality of the result. The histogram of an entity or image provides information about the frequency of occurrence of certain value in the whole of the data/image. It is an important tool for frequency analysis. The co-occurrence takes this analysis to next level wherein the intensity occurrences of two pixels together are noted in the matrix, making the co-occurrence a tremendous tool for analysis.    From gray-co-matrix, the features such as Contrast, Correlation, Energy, Homogeneity' are extracted.

### Training: 
#### 1. Start with images of which classes are known for sure.
#### 2. Find the property set or feature set for each of them and then label suitable.
#### 3. Take the next image as input and find features of this one as new input. 
#### 4. Implement the binary SVM to multi class SVM procedure.         
#### 5. Train SVM using kernel function of choice. The output will contain the SVM structure and information of support vectors, bias           value etc. 
#### 6. Find the class of the input image.  
#### 7. Depending on the outcome species, the label to the next image is given. Add the features set to the database.
#### 8. Steps 3 to 7 are repeated for all the images that are to be used as a database.               
#### 9. Testing procedure consists of steps 3 to 6 of the training procedure. The outcome species is the class of the input image.  
#### 10. To find the accuracy of the system or the SVM, in this case, random set of inputs are chosen for training and testing from the          database. 

### Classification: 
#### The binary classifier which makes use of the hyper-plane which is also called as the decision boundary between two of the classes is called as Support Vector machine (SVM). Some of the problems of pattern recognition like texture classification make use of SVM. Mapping of nonlinear input data to the linear data provides good classification in high dimensional space in SVM. The marginal distance is maximized between different classes by SVM. Different kernels are used to divide the classes. SVM is basically binary classifier which determines the hyper plane in dividing two classes. The boundary is maximized between the hyper plane and the two classes. The samples that are nearest to the margin will be selected in determining the hyper plane are called as support vectors.    Multiclass classification is also possible either by using one-to-one or one-tomany. The highest output function will be determined as the winning class.


