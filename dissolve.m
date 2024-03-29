#This will hopefully be a program that will model
#a dissolving/erosion problem.
#The surface, Y(x,t), will dissolve and 'melt' away
#as the liquid is applied. This is a bit weird, as
#it isn't a strict ODE, because I am measuring how
#a surface changes, not just a scalar.

#I will approximate Y(x,t) with 100 points, and see
#how that goes.

1;
clear all


function [YSur,HSur] = surface_begin()
x = [-10:10];
YSurInit = x.^2;
numOfSteps = 100;
YSur=[];
HSur=[];
#y = lsode ("f", [100,102], (t = linspace (0, 40, 100)'));
#plot(t,y)
for i = [1:length(x)]
   y = lsode("f",[YSurInit(i), 110], (t = linspace (0, 80, 200)'));
   length(y(1,:))
   HSur = [HSur,y(:,2)]
   YSur = [YSur,y(:,1)];
     y = 0
endfor

endfunction
   
function ydot  = f(y,t)
#alpha is dissolve rate
#beta is geological growth (for mountains)
    
   beta = 0.;
   alpha = 2.;
   alpha2 = 2;
   ydot(1) = -alpha*heaviside(y(2)-y(1))+beta;
   ydot(2) = ydot(1) -alpha2*(heaviside(y(2)-y(1)));
   
endfunction

function h = movie(HSur,YSur,x)
system("rm -rf plot-output; mkdir plot-output")
t = linspace(0,80,200)'
for i = [1:length(HSur(:,1))]
	plot(x,HSur(i,:),x, YSur(i,:));
	axis([-10 10 -150 100]);
	print(sprintf("plot-output/%05d.png",i));
endfor;
system("ffmpeg -sameq -i plot-output/%05d.png -y plot-output/erosionmovie.avi");
system("open plot-output/erosionmovie.avi");
endfunction

function V = liquid_volume(t)
   #in 1d land, you have got 5 m of rain
   startingVolume = 5. 
   alpha = 2.;
   liquid_height = startingHeight-alpha*t

   if (liquid_height < 0 )
      liquid_height = 0

   endif

endfunction

function h=heaviside(x)
   if (x> 0)
      h = 1.;
   elseif (x < 0)
      h = 0.;
   elseif (x = 0)
      h = 0.5;
   endif
endfunction
l2=heaviside(1)
l3=heaviside(-1)
#x= begin()
[x2,height] = surface_begin()
h = movie(x2,height, [-10:10]);
