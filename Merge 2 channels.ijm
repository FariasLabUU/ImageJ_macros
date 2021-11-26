//This macro merges 2 channels RED-GREEN (but you can change the colors as you like)
//You have to split your stacked images into 1 RED FOLDER and 1 GREEN FOLDER. The third folder is the OUTPUT FOLDER

macro "batch_merge_channels"{
    setBatchMode(true);
    file1 = getDirectory("Red channel");
    //you can change the name of the inquiry to whatever wavelength you need, e.g. CY5
    list1 = getFileList(file1);
    //gets the list of files in the folder RED
    n1 = lengthOf(list1);
    //gets the number of files in folder RED, it should be the same as the number 
    //of files in folder GREEN
    file2 = getDirectory("Green channel");
    list2 = getFileList(file2); 
    file3 = getDirectory("Merge");
    //the output folder. When started first the number of files is 0
    list3 = getFileList(file3);
    n2 = lengthOf(list3);
    small = n1;
    //condition for for-loop

    for(i = n2 + 1; i < small; i++) {
      //i will always follow the aborted number of merges, you might not have the problem, 
      //but with small memory and a huge set of images it is useful
      name = list2[i];
      //not to lose your track, though you can change it to anything else
      open(file1 + list1[i]);
      open(file2 + list2[i]);
      run("Merge Channels...", "c2=[" + list2[i] + "] c1=[" + list1[i] + "] keep");
      saveAs("tiff", file3 + name);
    }
}

// If you have 3 channels, just add 
//fileN = getDirectory("WL");
//listN = getFileList(fileN); 