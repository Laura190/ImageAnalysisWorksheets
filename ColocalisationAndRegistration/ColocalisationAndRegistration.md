# Colocalisation

Uncredited image in this section are from [Dave Mason's image analysis course](https://bitbucket.org/davemason/imageanalysiswithfiji/src/master/).

Colocalisation analysis is used to understanding the spatial relationship between different fluorescent markers in microscopy images. However, it can mean different things:

<img src="coloc_00.png" alt="comparing co-expression, co-occurence and correlation" width="400"/><br>
Adapted from a slide by Fabrice Cordelieres

Colocalisation is **highly** dependent on resolution. For example, the [CAMDU](https://warwick.ac.uk/fac/sci/med/research/biomedical/facilities/camdu/) (green circle on right side of map) is not located in the same place as in Senate House (red circle on left side of map).

<img src="map.png" alt="map of Warwick campus with CAMDU location shown by a green circle and Senate House location shown by a red circle" width="400"/><br>

However, if we consider the whole world, both the CAMDU office and Senate House are located in the UK.

<img src="coloc_02b.png" alt="map of the globe with a yellow circle in the UK" width="400"/><br>

If you plan to use colocalisation analysis for your research, it is important to learn more about colocalisation than what is covered in this worksheet. One useful paper is by [Bolte and Cordelieres](https://doi.org/10.1111/j.1365-2818.2006.01706.x).

To quantify the colocalisation in an image different correlation coefficients can be used.

## Pearson's correlation coefficient

For each pixel, plot the intensities of two channels in a scatter plot
Ignore pixels with only one channel
P value describes the goodness of fit (-1 to 1)
    1 = perfect correlation
    0 = no positive or negative correlation
    -1 = exclusion


    PCC is calculated using the intensity values of corresponding pixels in the two channels. The formula for Pearson’s rr (as mentioned earlier) can be applied directly to these intensity values.
    A high PCC value indicates that high intensities in one channel correspond to high intensities in the other, suggesting that the two signals are colocalized.

Interpretation of Results:

    Values Close to +1: Strong positive correlation indicates high colocalization; the two signals are likely interacting or present in the same regions.
    Values Close to 0: No significant correlation suggests that the signals are spatially independent.
    Values Close to -1: A negative correlation might suggest that as one signal increases, the other decreases, indicating potential competition or exclusion.

     The formula for Pearson's r is:
$r = \frac{n(\sum xy) - (\sum x)(\sum y)}{\sqrt{[n\sum x^2 - (\sum x)^2][n\sum y^2 - (\sum y)^2]}}$


Where:

    $n$ is the number of data points.
    $x$ and $y$ are the intensity values for two channels.
    $\sum$ denotes the summation.

## Prerequisites

- Fiji (ImageJ) installed
- `ijp-jacop-b` plugin installed. You can find it [here](https://github.com/BIOP/ijp-jacop-b).

## Steps

### 1. Open Your Images

1. Launch Fiji.
2. Open the images you want to analyze by navigating to `File > Open` and selecting your files.

### 2. Install the `ijp-jacop-b` Plugin

1. Download the `ijp-jacop-b` plugin from the [GitHub repository](https://github.com/BIOP/ijp-jacop-b).
2. Place the downloaded `.jar` file into the `plugins` folder of your Fiji installation.
3. Restart Fiji to load the new plugin.

### 3. Perform Colocalisation Analysis

1. With your images open, go to `Plugins > JACoP > Colocalisation`.
2. Select the channels you want to analyze for colocalisation.
3. Configure the parameters as needed:
    - **Thresholding method**: Choose an appropriate method for your images.
    - **PSF (Point Spread Function)**: Enter the PSF value if known.
4. Click `OK` to run the analysis.

### 4. Review Results

1. The plugin will generate several metrics and visualizations, including:
    - Pearson's correlation coefficient
    - Manders' coefficients
    - Overlap coefficient
2. Review these metrics to understand the degree of colocalisation between your channels.

### 5. Save Your Results

1. Save the results by navigating to `File > Save As` and choosing the desired format.
2. Document your findings and any observations.

## Conclusion

By following this worksheet, you should be able to perform colocalisation analysis using the `ijp-jacop-b` plugin in Fiji. This analysis will help you understand the spatial relationships between different markers in your microscopy images.

## References

- [ijp-jacop-b GitHub Repository](https://github.com/BIOP/ijp-jacop-b)
- Fiji Documentation: [Fiji](https://imagej.net/Fiji)

# Registration