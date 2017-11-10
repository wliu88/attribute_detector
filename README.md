# attribute_detector

## Overview
This project contains modified matlab code for **Describing Objects by Their Attributes**.

Original implementation of the paper can be found in http://vision.cs.uiuc.edu/attributes/.

## Getting Started
1. Download aYahoo images, and Features in MATLAB format in [here](http://vision.cs.uiuc.edu/attributes/).
2. Download Pascal VOC 2008 train/validation data from [here](http://host.robots.ox.ac.uk/pascal/VOC/voc2008/).
3. Put them in the `data/`.
4. Compile all .c or .cc files in `code/feature_extraction/code` by running command `$mex filename.c`.
5. Compile anigauss_mex.c in `code/feature_extraction/code/textons` by running `$mex -v -g anigauss_mex.c anigauss.c`.
6. Run `test_demo.m` or `prediction_demo.m` in `code/`.

