clc
clear
close all;

beta = 100; lambda=0.5; gama = 1; eta = 0.1; eta1=0.5;
Out_iter = 10; patchsize = 13;%according to the patchsize table in the paper
k=0; Reduce_DC = 1; C = 1.15;

load kodim03 
%the kodim03 is a mat file, which contains 
%the noise image with noise level 50 and 
%the corresponding clean image

CleanImg = I; %read the clean image
sigma=50/255; %the noise level is 50
errorGoal = sigma*C;


%learning the dictionary 
par=dicpar(errorGoal,sigma,patchsize,Out_iter);                               
%[blocks,idx,D,output] = QTVmy0130(Im, CleanImg,par);
load DIC 
%the DIC is a mat file, which contains the trained dictionary
%generated by the function QTVmy0130 (this mat file is for save your time)

params = paramsettings(beta, lambda, gama, eta, eta1, Out_iter,errorGoal,sigma,patchsize);

%%%the pQSTV denoising model
tic
[DenoisedImg, psnrout, ssimout, iter, sparisty, Im_dict, output] = xsub(Im, CleanImg,blocks,idx,params,D,output);
toc
                             
%show results
figure;imshow(DenoisedImg)
 %figure;imshow(Im_dict)
disp('PSNR= ');disp(psnrout)
disp('SSIM= ');disp(ssimout)



                       



