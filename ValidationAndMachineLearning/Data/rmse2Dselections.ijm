interp_points=400;

roiManager("select",0);
Roi.getCoordinates(xpoints1, ypoints1);
X1=Array.resample(xpoints1,interp_points);
Y1=Array.resample(ypoints1,interp_points);

roiManager("select",1);
Roi.getCoordinates(xpoints2, ypoints2);
X2=Array.resample(xpoints2,interp_points);
Y2=Array.resample(ypoints2,interp_points);
Array.show(xpoints1,X1,ypoints1, Y1,xpoints2,X2,ypoints2, Y2);

rmse=0;
for (i = 0; i < lengthOf(X1); i++) {
	rmse=rmse+sqrt(pow((X1[i]-X2[i]),2)+pow((Y1[i]-Y2[i]),2));
}
rmse=rmse/lengthOf(X1);
print(rmse);