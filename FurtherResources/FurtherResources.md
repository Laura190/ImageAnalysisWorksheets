# Deconvolution

[Deconvolution](https://svi.nl/Deconvolution) is a mathematical method to reverse the blurring caused by optics during imaging. Deconvolution can improve the resolution, contrast, and signal to noise ratio, but only if done carefully! In theory we could deconvolve every image that has been acquired from a microscope, however deconvolution is extremely sensitive to noise, can have artifacts if the light source is not constant and can be very computationally intensive.

For deconvolution the images need to have sufficient sampling density, which means your pixels need to be small enough in both XY and Z (i.e. distance between your slices in the z-stack). You should aim for close to the "Nyquist rate", which can be checked using this [online Nyquist calculator](https://svi.nl/Nyquist-Calculator). You should be able to find the relevant values in the metadata of your image. For confocal microscope images sampling distances may be up to ~1.7 times the Nyquist rate or even 2 when large pinholes are used. For widefield microscopy data it is better to stay below a factor of 1.5. The closer to the Nyquist sampling rate the better.

There are different software available for deconvolution, both free and commercially. For getting started you can use [Deconvolution Lab 2](http://bigwww.epfl.ch/deconvolution/deconvolutionlab2/) and [PSF Generator](http://bigwww.epfl.ch/algorithms/psfgenerator/) plugins for ImageJ/Fiji.

## References and Further reading

[Zeiss' A Practical Guide of Deconvolution.](https://asset-downloads.zeiss.com/catalogs/download/mic/d46800fd-690e-4ea6-b637-10f789e21887/EN_wp_LSM-Plus_Practical-Guide-of-Deconvolution.pdf)

[A practical guide to deconvolution](https://www.cambridge.org/core/journals/microscopy-today/article/practical-guide-to-deconvolution-of-fluorescence-microscope-imagery/27EFEAC4DECAABC516BDF2BD84956734) by David Biggs.

D. Sage, et al, [DeconvolutionLab2 : An Open-Source Software for Deconvolution Microscopy](http://bigwww.epfl.ch/publications/sage1701.pdf), Methods-Image Processing for Biologists, vol. 115, 2017.

H. Kirshner, D. Sage and M. Unser, [3D PSF Models for Fluorescence Microscopy in ImageJ](http://bigwww.epfl.ch/publications/kirshner1103.html), Proceeding of the Twelfth International Conference on Methods and Applications of Fluorescence Spectroscopy, Imaging and Probes, 154, 2011.


# Further Resources

A good starting point for finding new tools or finding more training materials is the [Bioimage Informatics Index](https://biii.eu/)

See if you can find entries for:
- Training materials for 3D image analysis
- Other image analysis software e.g. QuPath or CellProfiler
- An ImageJ plugin for deconvolution

# Example Data

Image repositories are a good place to find images for testing image analysis workflows. We have used some data from repositories in other worksheets. Here are a few others that are used for depositing published data:
- [Image Data Repository (IDR)](https://idr.openmicroscopy.org/)
- [BioImage Archive](https://www.ebi.ac.uk/bioimage-archive/galleries/galleries.html)
- [ProteomeXchange](https://proteomecentral.proteomexchange.org/ui)
- [EMPIAR](https://www.ebi.ac.uk/empiar/)

Choose one of the repositories and explore what type of data they accept.

# Version Control

As you start developing more complicated workflows you may want to start using version control software. [Git](https://git-scm.com/doc), version control software, and [Github](https://github.com/), code repository, are commonly used for scientific software. You can sign up to [Github Education](https://github.com/education) to access additional tools and resources from Github.

# Making data FAIR

When you are ready to publish your results, you will need to make the data available to others. Ideally your data should fulfil the [FAIR principles](https://www.go-fair.org/fair-principles/). What does FAIR stand for? 

There is a series of [RDMBites on Youtube](https://www.youtube.com/playlist?list=PLyCNTVs-UBvuJF7WausQ5q7v7pI1vEpI1) explaining more about what metadata is required to make bioimage data FAIR.

You will also need to publish any code or scripts you have used. The Software Sustainability Institute as a [how-to guide](https://www.software.ac.uk/guide/how-make-your-script-ready-publication) which outlines the necessary steps.
