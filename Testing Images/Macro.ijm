//open images "Actin.tif" and "FAs.tif" and run the macro

selectImage("Actin.tif");
run("Z Project...", "projection=[Sum Slices]");

setOption("ScaleConversions", true);
run("8-bit");
setThreshold(8, 255);
run("Analyze Particles...", "size=2000-infinity show=Nothing add");

selectImage("FAs.tif");
run("Z Project...", "projection=[Sum Slices]");
setOption("ScaleConversions", true);
run("8-bit");
run("Duplicate...", " ");
roiManager("Select", 0);
setBackgroundColor(0, 0, 0);
run("Clear", "slice");
imageCalculator("Subtract create", "SUM_FAs.tif","SUM_FAs-1.tif");
selectImage("Result of SUM_FAs.tif");
setThreshold(36, 255);

roiManager("Select", 0);
roiManager("Deselect");
roiManager("Delete");
run("Analyze Particles...", "size=0.99-9.99 show=Overlay display summarize add");

