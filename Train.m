% Training Part
%Features of Anthracnose
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Anthracnose\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Anthracnose Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Anthracnose_Feat(i,:) = feat_disease;
    save Anthracnose_Feat;
    close all
end

% Features of Bacterial Blight
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Bacterial Blight\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Blight Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Blight_Feat(i,:) = feat_disease;
    save Blight_Feat;
    close all
end

% Features of Alternaria Alternata
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Alternaria Alternata\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Alternaria Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Alternaria_Feat(i,:) = feat_disease;
    save Alternaria_Feat;
    close all
end

% Featurs of Cercospora Leaf Spot
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Cercospora Leaf Spot\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Cercospora Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Cercospora_Feat(i,:) = feat_disease;
    save Cercospora_Feat;
    close all
end

% Features of Healthy Image
for i=1:25
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Healthy Leaves\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    img = imadjust(img,stretchlim(img));
    imshow(img);title('Healthy Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Healthy_Feat(i,:) = feat_disease;
    save Healthy_Feat;
    close all
end


%
% Accuracy Evaluation Dataset Preparation
close all
clear all
clc
load('Alternaria_Feat.mat')
load('Anthracnose_Feat.mat')
load('Blight_Feat.mat')
load('Cercospora_Feat.mat')
load('Healthy_Feat.mat')

Train_Feat = [Alternaria_Feat;Anthracnose_Feat;Blight_Feat;Cercospora_Feat;Healthy_Feat];
Train_Label = [ zeros(100,1); ones(25,1) ];
save Accuracy_Data

%