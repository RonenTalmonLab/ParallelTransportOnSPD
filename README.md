# ParallelTransportOnSPD

## 1. Parallel transport on the cone manifold of SPD matrices for domain adaptation:

Link to the article:
https://ronentalmon.com/wp-content/uploads/2019/03/TSP_Yair_2019.pdf

* Folder Fig3 holds the code for figure 3 in that article.

## 2. Domain adaptation using Riemannian geometry of SPD matrices:
Link to the article:
https://sipl.eelabs.technion.ac.il/wp-content/uploads/sites/6/2019/06/ICASSP-2019-Paper.pdf

* Download the data from the following link (data set 2a): 
  *.gdf files are downloaded from here (you need to subscribe first): http://www.bbci.de/competition/iv/#dataset2a
  *.mat files are downloaded from here (link that says 'labels'): http://www.bbci.de/competition/iv/results/index.html#dataset2a
  you can find its description here: http://www.bbci.de/competition/iv/desc_2a.pdf.
* The data files are read using BioSig. You can download it from here: http://biosig.sourceforge.net.
  Please note that you need to INSTALL the package before using it.
  For matlab users, you need to run the install.m file in 'biosig' folder.
  Before installing define the parameter 'BIOSIG_DIR' according to the relevant path on your computer.
* The ‘GetEvents.m’ script (function) reads the data and applies a simple preprocessing to it as reported in the
  previous works by Barachant et al. (2012); Zanini et al. (2018); Yair et al. (2019).
  Before using it you need to update the 'dirPath' parameter to the dataset folder.
* The ‘MainBciPtSameSubject.m’ script applies the proposed algorithm for domain adaptation to the data. 
  The script plots the t-SNE representation before and after the adaptation similarly to the figures.

