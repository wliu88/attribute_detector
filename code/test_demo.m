addpath(genpath('..'))
imdir = '../data/VOCdevkit/VOC2008/JPEGImages';
fname = fullfile('attribute_data', 'apascal_test.txt');
% Load training data
[img_names, img_classes, bbox, attributes, attribute_names] = read_att_data(fname);
% Collect per image data
[image_list, dk, image_inds] = unique(img_names);
% Collect class data
[class_list dk class_ind] = unique(img_classes);
% Load feature data
codewords = load_codewords;
att_classifiers = load_att_classifiers;

% randomly choose an image
i = round(length(image_list) * rand(1,1));
this_im = image_inds == i;
att_labels{i} = attributes(this_im, :);
cls_labels{i} = class_ind(this_im);
boxes{i} = bbox(this_im, :);
im = imread(fullfile(imdir, image_list{i}));

features{i} = extract_features(im, boxes{i}, codewords);
predictions{i} = extract_predictions(im, boxes{i}, att_classifiers, codewords);

% randomly choose an object in the image
obji = round(length(cls_labels{i}));
imshow(im);
hold on
box = boxes{i}(obji,:);
rectangle('Position',[box(1), box(2), box(3)-box(1), box(4)-box(2)],'EdgeColor','r', 'LineWidth', 3);
title(class_list(cls_labels{i}(obji)));
pred = predictions{i}(obji,:);
display(attribute_names(pred >= 0));



