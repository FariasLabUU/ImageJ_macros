 outdir = getDirectory("Select output directory")
  macro "Grayscale LUT" {
    reds = newArray(256); 
    greens = newArray(256); 
    blues = newArray(256);
    for (i=0; i<256; i++) {
        reds[i] = i;
        greens[i] = i;
        blues[i] = i;
    }
    setLut(reds, greens, blues);
 macro "Invert LUT"{
    getLut(reds, greens, blues);
    for (i=0; i<reds.length; i++) {
        reds[i] = 255-reds[i];
        greens[i] = 255-greens[i];
        blues[i] = 255-blues[i];
    }
    setLut(reds, greens, blues);

nimg = nImages();
for (j = 0; j < nimg; j++)  {
	id = getTitle();
   	selectWindow(id);
   	saveAs("Tiff", outdir + id);
   	close();
  }
 }