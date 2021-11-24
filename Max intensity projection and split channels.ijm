// This_script_is_used_to_compress_the_z_stack_and_split_the_channels
dir = getDirectory("Select source directory with lsm files");
outdir = getDirectory("Select output directory");
list = getFileList(dir);
setBatchMode(true);
for (i = 0; i < list.length; i++) {
 path = dir + list[i];
 if (endsWith(path, ".lsm")) {
  open(path);
  run("Z Project...", "projection = [Max Intensity]");
  run("Split Channels");
  selectWindow(list[i]);
  close();
  nimg = nImages();
  for (j = 0; j < nimg; j++)  {
   id = getTitle();
   selectWindow(id);
   saveAs("Tiff", outdir + id);
   close();
  }
 }
}