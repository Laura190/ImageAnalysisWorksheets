roiManager("select",0);
Roi.getCoordinates(xpoints1, ypoints1);
X1=Array.resample(xpoints1,12);
Y1=Array.resample(ypoints1,12);
roiManager("select",1);
Roi.getCoordinates(xpoints2, ypoints2);
X2=Array.resample(xpoints2,12);
Y2=Array.resample(ypoints2,12);
Array.show(xpoints1,X1,ypoints1, Y1,xpoints2,X2,ypoints2, Y2);

rmse=0;
for (i = 0; i < lengthOf(xpoints1); i++) {
	rmse=rmse+sqrt(pow((xpoints1[i]-xpoints2[i]),2)+pow((ypoints1[i]-ypoints2[i]),2));
}
rmse=rmse/lengthOf(xpoints1);
print(rmse);

rmse=0;
for (i = 0; i < lengthOf(X1); i++) {
	rmse=rmse+sqrt(pow((X1[i]-X2[i]),2)+pow((Y1[i]-Y2[i]),2));
}
rmse=rmse/lengthOf(X1);
print(rmse);