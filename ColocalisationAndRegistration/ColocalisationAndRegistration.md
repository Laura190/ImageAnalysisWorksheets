# Colocalisation

Uncredited image in this section are from [Dave Mason's image analysis course](https://bitbucket.org/davemason/imageanalysiswithfiji/src/master/).

Colocalisation analysis is used to understanding the spatial relationship between different fluorescent markers in microscopy images. However, it can mean different things:

<img src="coloc_00.png" alt="comparing co-expression, co-occurence and correlation" width="400"/><br>
Adapted from a slide by Fabrice Cordelieres

Colocalisation is **highly** dependent on resolution. For example, the [CAMDU](https://warwick.ac.uk/fac/sci/med/research/biomedical/facilities/camdu/) (green circle on right side of map) is not located in the same place as in Senate House (red circle on left side of map).

<img src="map.png" alt="map of Warwick campus with CAMDU location shown by a green circle and Senate House location shown by a red circle" width="400"/><br>

However, if we consider the whole world, both the CAMDU office and Senate House are located in the UK.

<img src="coloc_02b.png" alt="map of the globe with a yellow circle in the UK" width="400"/><br>

If you plan to use colocalisation analysis for your research, it is important to learn more about colocalisation than what is covered in this worksheet as there are many pitfalls. The ImageJ documentation has a [page on colocalisation](https://imagej.net/imaging/colocalization-analysis) and a useful paper is by [Bolte and Cordelieres](https://doi.org/10.1111/j.1365-2818.2006.01706.x).

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open coloc.tif in Fiji  | Click and drag the coloc.tif file in to the main window of Fiji or open it using `File > Open...` |
| 2      | Compare the channels to see which have areas that overlap | Open the channels tool ```Image > Color > Channels Tool...```. Uncheck the boxes to hide the respective channel. Check two boxes at a time to see how each pair overlap. |

### 🤔 Investigate
- Can you view the channels in greyscale?
- Which channels do you think will colocalise?
- How can you change the colour of a channel?

To quantify the colocalisation in an image different coefficients can be used. Colocalisation plugins for Fiji will often offer a choice of coefficients. For this worksheet, we will use the [BIOP JACoP plugin](https://github.com/BIOP/ijp-jacop-b). This plugin is based on [JACoP](https://imagej.net/plugins/jacop) and [Coloc2](https://imagej.net/plugins/coloc-2) plugins and has been developed by the BioImaging and Optics Platform (BIOP) at EPFL (École polytechnique fédérale de Lausanne, Switzerland)). The BIOP JACoP plugin is not included with Fiji so we need to install it.

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open Fiji's Updater  | Navigate to ```Help > Update...``` |
| 2      | Open the list of update sites | Click ```Manage Update Sites``` |
| 3      | Add the PTBIOP update site | In the search bar at the top enter ```biop```. Click the check box next to PTBIOP that will appear in the list below. Click ```Apply and Close``` |
| 4      | Apply the changes | Click ```Apply Changes``` and wait for the download to complete. Click ```OK``` when the "Updates successfully" message appears  |
| 5      | Restart Fiji | Close Fiji and open it again |
| 6      | Check the plugin has been installed | Open the Plugins menu and check that ```BIOP``` is listed. |

The BIOP update site contains more than just the JACoP plugin, however this is the only one we will use for this worksheet.

## Pearson's correlation coefficient

Pearson's correlation coefficient compares how two variable change together compared to how they change on their own. In the context of colocalisation it is used to compare if the intensity value of channels change together or not. The formula for Pearson's correlation coefficient is
$$ \frac{n(\sum xy) - (\sum x)(\sum y)}{\sqrt{[n\sum x^2 - (\sum x)^2][n\sum y^2 - (\sum y)^2]}} $$
where $n$ is the number of data points; $x$ and $y$ are the intensity values for two channels and $\sum$ denotes the summation. The numerator is the covariance between the intensity values in the two channels. This indicates how much the variables change together verses on their mean values. The denominator is the product of the variability in the intensity values of the two individual channels.

If the Pearson's correlation coefficient is close to:
- +1: Positive correlation. As the intensity in one channel increases so does the intensity in the second channel.
- 0: No significant correlation, the signals are spatially independent.
- -1: Negative correlation. As the intensity in one channel increases, it decreases in the second channel.

The Pearson's correlation coefficient works well for complete colocalisation or exclusion. Reliable conclusions cannot be drawn from midrange values (-0.5 to 0.5). This makes it unsuitable for cases where there is a lot of noise or only partial colocalisation. Bleedthrough can be particularly problematic as it will bias the results towards a correlated value. 

### 📋 Step-by-Step Instructions

| Step | Action | Details |
|--------|-----------|------------|
| 1      | Open coloc.tif in Fiji  | Click and drag the coloc.tif file in to the main window of Fiji or open it using `File > Open...` |
| 2      | Compare the channels to see which have areas that overlap | Open the channels tool ```Image > Color > Channels Tool...```. Uncheck the boxes to hide the respective channel. Check two boxes at a time to see how each pair overlap. |

## Manders' Overlap Coefficient

Manders' Overlap Coefficient is the ratio of the summed intensities of pixels from one channel for which the intensity in the second channel is above zero to the total intensity in the first channel. It removes some of the intensity dependence of Pearson's and provides channel-specific overlap coefficients (M1 and M2). The values of Manders' Overlap Coefficient range from from 0, no overlap, to 1, complete overlap.


# Registration