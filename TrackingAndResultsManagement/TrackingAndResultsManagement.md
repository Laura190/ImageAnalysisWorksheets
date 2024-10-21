# Tracking

Uncredited image in this section are from [Dave Mason's image analysis course](https://bitbucket.org/davemason/imageanalysiswithfiji/src/master/).

Life exists in the four dimensions. Tracking allows you to correlate spatial and temporal properties. Most particles look the same! Without any way to identify them, tracking is probabilistic. In the image below, the particles on the left look as if they are moving from left to right. However, if we consider that the two particles are different, e.g. an x fighter and a TIE fighter, it's possible that the upper and lower particles swap position. However, we wouldn't know as they look the same!

<img src="particle_starships.png" alt="two particles in different positions at 4 time points represented by x fighter and a TIE fighter spaceships. Demonstrates that particles can look the same so it's possible they don't track as expected." width="800"/>

Tracking has two parts: Feature Identification and Feature Linking.

## Feature Identification

<img src="tracks_03.png" alt="A series of image showing individual timepoints. The particles in each image are highlighted by purple circles in slightly different positions" width="800"/>

For every frame, features are detected, typically using a Gaussian-based method, e.g. [Laplacian of Gaussian (LoG)](https://en.wikipedia.org/wiki/Blob_detection#The_Laplacian_of_Gaussian).

The position of particles can be determined with subpixel precision. One method determine the subpixel position is by fitting a Gaussian model to the pixel intensity values around the detected spot. Without sub-pixel localisation, the precision of detection is limited to whole pixel values.

<img src="tracks_05.png" alt="A graph with pixels on the x axis and intensity on the y axis. The data points plotted are fitted to a Gaussian, the peak of which shows the position of the peak to lie between two integer pixel values" width="400"/>

## Feature Linkage

For each feature, all possible links in the next frame are calculated. This includes the spot disappearing completely. A **cost matrix** is formed to compare the cost of each linkage. A cost matrix is a two-dimensional array that represents the cost of the particle moving from one position to another. This is globally optimised to calculate the lowest cost for all linkages.

<img src="tracks_07.png" alt="A series of images showing the position of two particles highlighted with magenta circles. In the first two images there are arrows pointing from the left most particle to the other particles to show different possible movements of the particle" width="700"/> <br>
<img src="tracks_08.png" alt="A series of images showing the position of two particles highlighted with magenta circles. In the first two images there are arrows pointing from the right most particle to the other particles to show different possible movements of the particle" width="700"/>

In it's simplest form, a cost matrix will usually consider distance. Many other parameters can be used such as:
- Intensity
- Shape
- Quality of fit
- Speed
- Motion type

This can allow for a more accurate linkage especially in crowded environments or images with low signal to noise.

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open 10-tracks.tif in Fiji  | Click and drag the 10-tracks.tif file in to the main window of Fiji or open it using `File > Open...` |
| 2      | Play the movie | Click the ▶️ arrow in the lower left hand corner of the image window.  |
| 3      | Change the playback speed | Right click on the ▶️ arrow and change the parameters to set the playback speed |

<img src="tracks_11.png" alt="An image stack in Fiji with the animate options overlayed" width="400"/>

If you're interested in how the dataset was made see [this snippet](https://bitbucket.org/snippets/davemason/Ke9zz7).

## TrackMate

[TrackMate](https://imagej.net/plugins/trackmate/) is distributed in Fiji and has a user-friendly interface for performing tracking, data visualization and track analysis. In this example, only a few of the capabilities of TrackMate are used. Please read the documentation to learn more about how TrackMate can be used.

<img src="trackmate_02.png" alt="Trackmate first window" width="400"/>

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Start TrackMate  | Run ```[Plugins > Tracking > Trackmate]``` |
| 2      | The first dialog allows you to select a subset (in space and time) to process. This is handy on large datasets when you want to calculate parameters before processing the whole dataset. Our dataset it small so use the default settings to process the full stack | Click ```Next``` |
| 3      | Use the default detector (LoG) | Click ```Next``` |
| 4      | Enter appropriate parameters to detect the particles | Set the ```Estimated object diameter``` to 2. Set the ```Quality threshold``` to 0.1. Click ```Preview``` to check the output. |

### 🤔 Investigate
- Do the same settings work for other time points? (change the stack position and click ```Preview``` again)
- What units are used for the object diameter?
- What objects are detected if the quality threshold is 0?
- What happens if you uncheck the ```Sub-pixel localisation``` box?

Aim to use the minimum threshold that prevents the noise from being detected. 

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Select the chosen parameters  | Click ```Next``` |
| 2      | Wait for the detection to complete, the proceed | Wait until ```Dectection done in...``` appears near the bottom of the window, then Click ```Next``` |
| 3      | Use the default ```Initial threshold``` | Click ```Next``` |
| 4      | Use the default ```Set filters on spots``` settings | Click ```Next``` |
| 5      | Use the default track (Simple LAP tracker) | Click ```Next``` |
| 6      | Enter appropriate parameters for the tracker | Set the ```Linking max distance``` and ```Gap-closing max distance``` to 5. |

### 🤔 Investigate
- What parameters does the [Simple LAP tracker](https://imagej.net/plugins/trackmate/trackers/lap-trackers) use for the cost matrix?
- What do the ```Linking max distance```, ```Gap-closing max distance``` and ```Gap-closing max frame gap``` parameters do? [This TrackMate tutorial](https://imagej.net/plugins/trackmate/tutorials/getting-started#configuring-the-simple-lap-tracker) might help. Please ask if you are unsure.

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Select the chosen parameters  | Click ```Next``` |
| 2      | Wait for the tracking to complete, the proceed | Wait until ```Tracking done in...``` appears near the bottom of the window, then Click ```Next``` |
| 3      | Use the default ```Set filters on tracks``` settings | Click ```Next``` |


# Built-in Functions

There are some useful Built-in Functions for managing results in Fiji:

- getStatistics()
- getResult("Column", row)
- setResult("Column", row, value) and updateResults()
- nResults or getValue("results.count")

# Results windows

You can only have one active results window at a time. This must be named "Results".
Other results windows should be renamed. You can use IJ.renameResults to do this.
To make a renamed results window active again, rename the previously active window something else and rename the original window "Results" again.

# Graphs

Fiji is not designed to create graphs
You will need to export your results to another programme (e.g. excel, python, matlab, ...)
saveAs(format, path)
Export the results as a .csv (comma separated value) file


# Results windows

You can only have one active results window at a time. This must be named "Results".
Other results windows should be renamed. You can use IJ.renameResults to do this.
To make a renamed results window active again, rename the previously active window something else and rename the original window "Results" again.

# Graphs

Fiji is not designed to create graphs
You will need to export your results to another programme (e.g. excel, python, matlab, ...)
saveAs(format, path)
Export the results as a .csv (comma separated value) file