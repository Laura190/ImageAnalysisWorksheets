# Segmentation

Segmentation is the separation of an image into areas of interest and areas that are not of interest. The end point for most segmentation is a binary mask. This can be represented as a logical array with true and false values; or a binary array with 0 and 1 values; or an array with only minimum and maximum values e.g. 0 and 255 for an 8-bit image.

| Original Image | Segmentation |
|----------------|--------------|
| <img src="cells.png" alt="cells" width="200"/> | <img src="binary_cells.png" alt="binary cells" width="200"/> |
| <img src="building.png" alt="building" width="200"/> | <img src="binary_building.png" alt="binary building" width="200"/> |

A binary mask can be used to count, measure or viualise objects.

## :performing_arts: Thresholding: The Art of Separation

Thresholding separates the pixels in an image into two (or more) classes based on intensity. Usually the classes are **foreground** (the objects we care about) and the **background** (the area we don't). This creates a binary mask which can be used for counting, measuring, or visualizing the objects of interest.

### :clipboard: Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open Fiji | Find the executable in the downloaded Fiji folder and double-click to launch it. |
| 2      | Open the Macro Recorder | Navigate to `Plugins > Macro > Record`. |
| 3      | Open an Image | Go to `File > Open Samples > Blobs`. |
| 4      | Experiment with Manual Thresholds | Go to `Image > Adjust > Threshold` and move the sliders. Watch how the red area on the image changes as you move the slider. <br> <img src="Threshold.png" alt="Threshold" width="250"/> |
| 5      | Create a Mask | Click "Apply" |

### :thinking: **Investigate**
- What do the two sliders do?​
- What difference does checking the Dark background box make to the mask?​
- Look in the macro recorder output, which lines set the threshold value and apply the mask?​

## :computer: Automatic Thesholding: Let the Computer Do It

A manual threshold can be inconsistent and subjective. To overcome these issues, automatic thresholding methods can be used.

### :clipboard: Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open an Image | Go to `File > Open Samples > Blobs`. |
| 2      | Open the Auto Threshold Tool | Navigate to `Image > Adjust > Auto Threshold`. <br> <img src="Auto Threshold.png" alt="Threshold" width="400"/> |
| 3      | Use the Default Settings | Click "OK" |

A montage showing the results from the different automatic thresholding methods should appear. The name of the method is written under each thesholded copy of blobs, you may need to zoom in using the magnifying tool to read them. Ask for help if you don't get an image montage or you can't see the method names.

### :thinking: **Investigate**
- Which automatic thresholding method gives the best results for thresholding the blobs image?
- Look up the description of that method on the [Auto Threshold page on the ImageJ website](https://imagej.net/plugins/auto-threshold). Decide if the method you chose is suitable for thresholding the blobs image, e.g. does the method make any assumptions about the histogram?
- Why are the results for the Default and IsoData algorithms similar?

### :clipboard: Step-by-Step Instructions

| Step  | Action | Details |
|-------|-----------|------------|
| 1     | Open an Image | Go to `File > Open Samples > Blobs`. |
| 2     | Open the Auto Threshold Tool | Navigate to `Image > Adjust > Auto Threshold`. |
| 3     | Select a method based on the previous exercise | Click on the Method drop down box and choose a method, then click "OK" |

You should now have a binary mask of the blobs image. If not, please ask for help.

## :link: Connected Component Analysis

Connected component analysis (CCA) is used to identify contiguous objects in a mask. In Fiji for 2D images this can be done using the [Analyze Particles](https://imagej.net/imaging/particle-analysis#analyze-particles) tool.

### :clipboard: Step-by-Step Instructions
<img src="lut_glasbey.png" style="float: right;" alt="lut glasbey" width="300"/> 

| Step  | Action | Details |
|-------|-----------|------------|
| 1     | Make your binary mask the active image | Click on the window containing the binary mask |
| 2     | Start the Analyze Particles tool | Navigate to `Analyze > Analyze Paricles`. |
| 3     | Select the required settings and run the tool | Match the settings shown in the image <br> <img src="analyze_particles.png" alt="analyze particles" width="250"/> <br> then click "OK" |

You should get results table containg a count (64) and some other measurements as well as an image where each blob is a different shade of grey. If you want to display the results more clearly change the Look Up Table (LUT) to glasbey_on_dark



## :pencil: Creating a Macro

In the macro recorder window, there will now be a list of all the things you've done by clicking in the graphical interface. Some of these will be things you meant to do, some will be things you clicked accidentally and some will be things you tried and rejected.

| Step  | Action | Details |
|-------|-----------|------------|
| 4     | Create a macro from the recorder | Click the `Create` button in the Macro Recorder window. |
| 5     | Edit the macro | Delete all lines except the last two or three. First line should be `run("Blobs (25K)");`. Last line should be begin `run("Auto Threshold", ...` |
| 6     | Try running the macro | Click `Run` in the Script Editor Window. |

### :thinking: **Investigate**
- Did the macro stop unexpectedly? Did an error message appear after clicking `Run`? If so, ask for help to fix the errors.
- Is the result from running the macro the same as when you did it manually? If not, why not?
- Think about what each line of code does. Try explaining it to someone or write an annotation.