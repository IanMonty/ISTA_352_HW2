function hw2_test(a2)
i = 300;
j = 300;
% [h1, h] = house();
% [img_w,img_h]=img_size();
 r = 0;
 g = 0;
 b = 0;
% img = draw_blank(img_w,img_h);
% img = draw_image(h1,img,i,j,r,g,b);
% h2 = sheer(h)+1;
% img = draw_image(h2,img,i,j,r,g,b);
% h3 = sheer(h)+1;
% img = draw_image(h3,img,i,j,r,g,b);
% pause();
img = draw_blank(600,600);
blk = block();
img = draw_image(blk,img,i,j,r,g,b);
pause();
r = 0;
g = 0;
b = 1;
l = length(a2)
pause();
for n = 1:length(a2)
    [i1,j1] = def_ij(a2(n,1),a2(n,2));
    img = draw_image(blk,img,i1+i,j1+j,r,g,b);
    % n
    %pause();
end



end
% this function creates a house
function [h1,h] = house()
y = zeros(1,51);
x = [0:1:50];
h = [x',y'];

y = [0:1:50];
x = x + 50;
h = [h; [x',y']];

y = [50:1:100];
x = -x + 150;
h = [h; [x',y']];

y = 100 * ones(1,51);
x = [50:-1:0];
h = [h; [x',y']];

y = [100:-1:0];
x = zeros(1,101);
h = [h; [x',y']];
h1 = uint32(h+1);
end

%design size of picture created
function [side_x,side_y] = img_size()
side_x = input('enter width of image: ');
side_y = input('enter height of image: ');
end

%designs blank image
function img = draw_blank(p_w,p_h)
img= ones(p_w,p_h,3);
image(img);
end

%draws image as designed by the matrix... can be designed to draw at user
%defined center
function img = draw_image(mat,img,i,j,r,g,b)
[wt,ht,col] = size(img);
for t=1:size(mat)
%    fprintf('working?\n');
%    [mat(t,1),mat(t,2)]
    for k=1:length(mat)
        if j - mat(k,1) < 0;
            0;
        elseif j - mat(k,1)> wt;
            0;
        elseif mat(k,2) + i < 0;
            0;
        elseif mat(k,2) + i > ht;
            0;
        else
            img(-mat(k,1)+j,mat(k,2)+i,1) = r;
            img(-mat(k,1)+j,mat(k,2)+i,2) = g;
            img(-mat(k,1)+j,mat(k,2)+i,3) = b;
        end
            
    end
end
image(img);
end

%user defined (0,0)
function [i,j] = pos()

i = input('enter new center x: ');
j = input('enter new center y: ');


end

%define sheer
function h2 = sheer(h)
sh = input('enter sheer value: ');
sh_er = [1,sh;0,1]
h2 = h * sh_er;
h2 = int32(h2);
end

%draw a 21X21 square
function bl = block()
b = [];
for b_l = 1:length(-10:10)
    for b_w = 1:length(-10:10)
        b = [b; [b_l-11, b_w-11]];
    end
end
bl = b;
end

function [i,j] = def_ij(x,y);

i = x;
j = y;

end