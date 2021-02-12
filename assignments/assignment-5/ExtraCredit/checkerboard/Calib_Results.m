% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 674.426906898407992 ; 675.271512619090913 ];

%-- Principal point:
cc = [ 341.880188509905793 ; 228.347710804105219 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.047024253276764 ; 0.361130866370750 ; -0.009295199381293 ; -0.007615402721706 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 17.534973661654611 ; 16.118515964489585 ];

%-- Principal point uncertainty:
cc_error = [ 21.382660025586738 ; 17.806742057681646 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.108407449024431 ; 0.399730000453885 ; 0.009252500451736 ; 0.015202339448281 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.127941e+00 ; 1.889659e+00 ; -1.110226e-01 ];
Tc_1  = [ -6.860667e+02 ; -4.025313e+02 ; 3.634175e+03 ];
omc_error_1 = [ 1.947077e-02 ; 2.145238e-02 ; 5.411843e-02 ];
Tc_error_1  = [ 1.153495e+02 ; 9.664574e+01 ; 9.088909e+01 ];

%-- Image #2:
omc_2 = [ -2.093742e+00 ; -2.102643e+00 ; -2.901685e-01 ];
Tc_2  = [ -1.136253e+03 ; -3.781452e+02 ; 3.737244e+03 ];
omc_error_2 = [ 2.379879e-02 ; 2.296875e-02 ; 5.344748e-02 ];
Tc_error_2  = [ 1.189407e+02 ; 1.006723e+02 ; 1.032756e+02 ];

%-- Image #3:
omc_3 = [ 1.852011e+00 ; 1.106367e+00 ; 4.471877e-01 ];
Tc_3  = [ -1.041580e+03 ; -2.446427e+02 ; 3.483838e+03 ];
omc_error_3 = [ 2.320356e-02 ; 2.100105e-02 ; 3.651182e-02 ];
Tc_error_3  = [ 1.109109e+02 ; 9.357152e+01 ; 9.654156e+01 ];

%-- Image #4:
omc_4 = [ -2.068899e+00 ; -1.833460e+00 ; 1.083339e+00 ];
Tc_4  = [ -7.248946e+02 ; -1.418170e+02 ; 4.024215e+03 ];
omc_error_4 = [ 2.982598e-02 ; 1.651741e-02 ; 4.212181e-02 ];
Tc_error_4  = [ 1.264411e+02 ; 1.066864e+02 ; 9.165488e+01 ];

%-- Image #5:
omc_5 = [ -2.396583e+00 ; -2.098198e+00 ; -2.546188e-01 ];
Tc_5  = [ 1.793141e+02 ; -5.663302e+02 ; 4.143209e+03 ];
omc_error_5 = [ 3.975814e-02 ; 3.609804e-02 ; 9.027444e-02 ];
Tc_error_5  = [ 1.332174e+02 ; 1.091880e+02 ; 1.048865e+02 ];

%-- Image #6:
omc_6 = [ -1.827558e+00 ; -1.913073e+00 ; -8.905070e-01 ];
Tc_6  = [ -1.035630e+03 ; -1.507456e+03 ; 5.660232e+03 ];
omc_error_6 = [ 2.072297e-02 ; 2.647146e-02 ; 4.504895e-02 ];
Tc_error_6  = [ 1.832166e+02 ; 1.538852e+02 ; 1.588302e+02 ];

%-- Image #7:
omc_7 = [ -1.796226e+00 ; -1.842624e+00 ; -9.379307e-01 ];
Tc_7  = [ -9.796638e+02 ; -1.006821e+03 ; 4.222044e+03 ];
omc_error_7 = [ 1.853241e-02 ; 2.430566e-02 ; 4.199712e-02 ];
Tc_error_7  = [ 1.361677e+02 ; 1.147246e+02 ; 1.188098e+02 ];

%-- Image #8:
omc_8 = [ -1.758039e+00 ; -1.738043e+00 ; -8.907912e-01 ];
Tc_8  = [ -9.608301e+02 ; -5.914158e+02 ; 3.277504e+03 ];
omc_error_8 = [ 1.927274e-02 ; 2.309879e-02 ; 3.984483e-02 ];
Tc_error_8  = [ 1.049813e+02 ; 8.893007e+01 ; 9.382214e+01 ];

%-- Image #9:
omc_9 = [ -2.179993e+00 ; -2.217567e+00 ; 3.481907e-02 ];
Tc_9  = [ -8.154061e+02 ; -9.873637e+01 ; 2.336658e+03 ];
omc_error_9 = [ 2.521902e-02 ; 2.326732e-02 ; 4.919368e-02 ];
Tc_error_9  = [ 7.414377e+01 ; 6.300494e+01 ; 6.244265e+01 ];

%-- Image #10:
omc_10 = [ 1.728952e+00 ; 1.672457e+00 ; 1.089860e+00 ];
Tc_10  = [ -8.503390e+02 ; -2.739414e+02 ; 2.855489e+03 ];
omc_error_10 = [ 2.725708e-02 ; 2.115607e-02 ; 3.972620e-02 ];
Tc_error_10  = [ 9.046420e+01 ; 7.665518e+01 ; 7.982381e+01 ];

