function [PD,IR,M,IX,IY,IXY,CX,CY,CR] = platemethod(a,r)

% [PD,IR,M,IX,IY,IXY,CX,CY,CR] = platemethod(a,r)
%
% from Gribble PL, Scott SH (2002) J. Neurosci. Methods 113(2):185-195
%
% INPUTS:
% a: 1D list of angles (in radians)
% r: 1D list of magnitudes
%
% OUTPUTS:
% PD          :preferred direction (radians)
% IR          :sharpness of tuning
% M           :mass
% IX, IY, IXY :moments of inertia
% CX, CY, CR  :centroid (x,y) and radius of centroid

% sort the angle and magnitude data by angles
[yy,ii]=sort(a); a=a(ii); r=r(ii);

% we don't like zero responses
r(r<1e-6) = 1e-6;

% compute individual "plates"
A=[]; CX=[]; CY=[]; IX=[]; IY=[]; IXY=[]; IP=[];
for i=1:length(a)
   i1=i; if i==length(a) i2=1; else i2=i1+1; end;
   r1=r(i1); r2=r(i2); a1=a(i1); a2=a(i2);
   if a2<a1
      a2=a2+(2*pi);
   end;
   [A(i),CX(i),CY(i),IX(i),IY(i),IXY(i)]=oneplate(r1,r2,a1,a2);
end;

% compute various quantities for output
gcx = sum(CX.*A)./sum(A);
gcy = sum(CY.*A)./sum(A);

IX=sum(IX);
IY=sum(IY);
IXY=sum(IXY);
M = sqrt(sum(A)./pi);
PD = getangle([gcx,gcy]); % the preferred direction
CR = sqrt(gcx^2 + gcy^2);
CX=gcx;
CY=gcy;
I1 = (IX+IY)/2 + ((IX-IY)/2)*cos(2*PD) - IXY*sin(2*PD);
I2 = (IX+IY)/2 - ((IX-IY)/2)*cos(2*PD) + IXY*sin(2*PD);
if I1>I2
   tmp=I1; I1=I2; I2=tmp;
end;
IR=I1/I2;

% helper function
function ang = getangle(v1)
% ang = getangle(v1)
%
% given v1 [x,y] n x 2 matrix (n>=1)
% getangle will return the angle (in radians) between the vector(s)
% and the (0,1) x-axis
% (note: 3pm is 0, 12noon is 90, 9am is 180, 6am is 270 deg)
ang=atan2(v1(:,2),v1(:,1));
if ang<0
  ang=ang+(2*pi);
end
end

% helper function
function [area,cx,cy,Ix,Iy,Ixy] = oneplate(r1,r2,a1,a2)
% [area,cx,cy,Ix,Iy,Ixy] = plate(r1,r2,a1,a2)
%
% from Gribble PL, Scott SH (2002) J. Neurosci. Methods 113(2):185-195
   c1=(r2-r1)/(a2-a1);
   c2=a1*c1;
   c3=r1-c2;
   area=(1/6)*(c1^2)*((a2^3)-(a1^3)) + (1/2)*c3*c1*((a2^2)-(a1^2)) + (1/2)*(c3^2)*(a2-a1);
   cx=(((1/3)*sin(a2) - (1/3)*sin(a1))*(c3^3) + (cos(a2) - cos(a1) - a1*sin(a1) + a2*sin(a2))*c1*(c3^2) + ...
      (((a2^2)-2)*sin(a2) + (-(a1^2) + 2)*sin(a1) + 2*a2*cos(a2) - 2*a1*cos(a1)) * ...
      (c1^2)*c3 + (((a2^2)-2)*cos(a2) + (-(a1^2)+2)*cos(a1) + ((1/3)*(a2^3) - 2*a2)*sin(a2) + ...
      (-(1/3)*(a1^3) + 2*a1)*sin(a1))*(c1^3)) / ...
      (((1/2)*a2 - (1/2)*a1)*(c3^2) + (1/2)*c3*c1*((a2^2)-(a1^2)) + ((1/6)*(a2^3) - (1/6)*(a1^3))*(c1^2));
   cy=((-(1/3)*cos(a2) + (1/3)*cos(a1))*(c3^3) + (sin(a2) - sin(a1) + a1*cos(a1) - a2*cos(a2))*c1*(c3^2) + ...
      ((-(a2^2)+2)*cos(a2) + ((a1^2) - 2)*cos(a1) + 2*a2*sin(a2) - 2*a1*sin(a1)) * ...
      (c1^2)*c3 + ((2*a2 - (1/3)*(a2^3))*cos(a2) + ((1/3)*(a1^3) - 2*a1)*cos(a1) + ((a2^2) - 2)*sin(a2) + ...
      (-(a1^2) + 2)*sin(a1))*(c1^3)) / ...
      (((1/2)*a2 - (1/2)*a1)*(c3^2) + (1/2)*c3*c1*((a2^2)-(a1^2)) + ((1/6)*(a2^3) - (1/6)*(a1^3))*(c1^2));
   Ix=((1/18)*sin(2*a1) - (1/9)*a1 + (1/9)*a2 - (1/18)*sin(2*a2))*(c3^4) + (-(2/9)*(a1^2) + (1/9)*cos(2*a1) - ...
      (1/9)*cos(2*a2) - (2/9)*a2*sin(2*a2) + (2/9)*a1*sin(2*a1) + (2/9)*(a2^2))*c1*(c3^3) + ...
      ((-(1/6) + (1/3)*(a1^2))*sin(2*a1) + ((1/6) - (1/3)*(a2^2))*sin(2*a2) - (1/3)*a2*cos(2*a2) + ...
      (1/3)*a1*cos(2*a1) + ...
      (2/9)*(a2^3) - (2/9)*(a1^3))*(c1^2)*(c3^2) + (((1/3)*a2 - (2/9)*(a2^3))*sin(2*a2) + ...
      ((2/9)*(a1^3) - (1/3)*a1)*sin(2*a1) + ((1/6) - (1/3)*(a2^2))*cos(2*a2) + (-(1/6) + ...
      (1/3)*(a1^2))*cos(2*a1) - (1/9)*(a1^4) + (1/9)*(a2^4))*(c1^3)*c3 + (((1/6)*a2 - ...
      (1/9)*(a2^3))*cos(2*a2) + ((1/9)*(a1^3) - (1/6)*a1)*cos(2*a1) + ...
      ((1/6)*(a2^2) - (1/18)*(a2^4) - (1/12))*sin(2*a2) + (-(1/6)*(a1^2) + (1/12) + (1/18)*(a1^4))*sin(2*a1) + ...
      (1/45)*(a2^5) - (1/45)*(a1^5))*(c1^4);
   Iy=(-(1/9)*a1 + (1/18)*sin(2*a2) + (1/9)*a2 - (1/18)*sin(2*a1))*(c3^4) + (-(1/9)*cos(2*a1) - ...
      (2/9)*(a1^2) + (2/9)*a2*sin(2*a2) + (2/9)*(a2^2) + (1/9)*cos(2*a2) - ...
      (2/9)*a1*sin(2*a1))*c1*(c3^3) + ((-(1/6) + (1/3)*(a2^2))*sin(2*a2) + ...
      ((1/6) - (1/3)*(a1^2))*sin(2*a1) - (1/3)*a1*cos(2*a1) + (2/9)*(a2^3) + ...
      (1/3)*a2*cos(2*a2) - (2/9)*(a1^3))*(c1^2)*(c3^2) + ((-(1/6) + (1/3)*(a2^2))*cos(2*a2) + ...
      ((1/6) - (1/3)*(a1^2))*cos(2*a1) + (-(1/3)*a2 + (2/9)*(a2^3))*sin(2*a2) + ...
      ((1/3)*a1 - (2/9)*(a1^3))*sin(2*a1) - (1/9)*(a1^4) + (1/9)*(a2^4))*(c1^3)*c3 + ...
      ((-(1/6)*a2 + (1/9)*(a2^3))*cos(2*a2) + (-(1/9)*(a1^3) + (1/6)*a1)*cos(2*a1) + ...
      (-(1/6)*(a2^2) + (1/18)*(a2^4) + (1/12))*sin(2*a2) + ...
      ((1/6)*(a1^2) - (1/18)*(a1^4) - (1/12))*sin(2*a1) + (1/45)*(a2^5) - (1/45)*(a1^5))*(c1^4);
   Ixy=(-(1/18)*cos(2*a2) + (1/18)*cos(2*a1))*(c3^4) + ...
      ((2/9)*a1*cos(2*a1) + (1/9)*sin(2*a2) - (1/9)*sin(2*a1) - (2/9)*a2*cos(2*a2))*c1*(c3^3) + ...
      (((1/6) - (1/3)*(a2^2))*cos(2*a2) + ((1/3)*(a1^2) - (1/6))*cos(2*a1) - ...
      (1/3)*a1*sin(2*a1) + (1/3)*a2*sin(2*a2))*(c1^2)*(c3^2) +  ...
      (((1/3)*a2 - (2/9)*(a2^3))*cos(2*a2) + (-(1/3)*a1 + (2/9)*(a1^3))*cos(2*a1) + ...
      ((1/3)*(a2^2) - (1/6))*sin(2*a2) + (-(1/3)*(a1^2) + (1/6))*sin(2*a1))*(c1^3)*c3 + ...
      ((-(1/18)*(a2^4) - (1/12) + (1/6)*(a2^2))*cos(2*a2) + ...
      (-(1/6)*(a1^2) + (1/12) + (1/18)*(a1^4))*cos(2*a1) + ...
      (-(1/6)*a2 + (1/9)*(a2^3))*sin(2*a2) + ((1/6)*a1 - (1/9)*(a1^3))*sin(2*a1))*(c1^4);
   end

end
