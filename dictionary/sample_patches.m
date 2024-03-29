function [tmp_X] = sample_patches(im, patch_size, patch_num)

%generate patch_size*patch_size*3 patches for X
[m n] = size(im(:,:,1));

%rand('state',51);
x = randperm(m-2*patch_size) + patch_size;%1*240
y = randperm(n-2*patch_size) + patch_size;
[X,Y] = meshgrid(x,y);%Cartesian grid in 2-D/3-D space 240*240double

x_row = X(:);%57600*1double
y_col = Y(:);
if patch_num < length(x_row)%
    x_row = x_row(1:patch_num);
    y_col = y_col(1:patch_num);
end
patch_num = length(x_row);% get random grid, also the number of patches

for ii = 1:patch_num
    row = x_row(ii);
    col = y_col(ii);
    tmp_patch = im(row:row+patch_size-1,col:col+patch_size-1,:);%8*8*3
    tmp_X(:,ii) = tmp_patch(:);%192*10002
end



