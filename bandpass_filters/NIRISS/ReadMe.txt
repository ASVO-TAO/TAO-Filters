NIRISS Filter Information
2017 May

This distribution contains two subdirectories:
./PLOTS/
   PDF files containing plots of the transmission profiles for each of the 
   NIRISS filters 

./DATA
   ASCII files containing the transmission and photo-to-electron conversion (PCE)
   factors for each filter as a function of wavelength
 
   Each ASCII file has 3 columns:
      Column 1: Wavelength        [microns         ]
      Column 2: Filter Throughput [dimensionless   ]
      Column 3: PCE               [electrons/photon]
   
   The wavelength is sampled from 0.5 to 5.5 microns in increments of
   0.001 microns.  There are 5001 rows per file.  
      
Additional Notes:

a) The filter transmission profiles were measured at cryogenic temperatures by the 
   vendor.  Transmissions below 10E-8 of the peak value have been set to 0.  
   In the case of double-stack filters, the transmission of the blocking filter has
   been incorporated.

b) The PCE represents the net throughput of the Optical Telescope Element (OTE) and
   the optical train of NIRISS, which consists of
       the Pick-off Mirror                (POM)
       a collimator three-mirror assembly (colTMA)
       a camera     three-mirror assembly (camTAM)
       the detector                       (Det)
   In addition, the throughput of the CLEAR element (for short-wavelength filters) or
   CLEARP element (for long-wavelength filters) is included.  
   
   Contamination has been added to the optical surfaces of the POM, colTMA, and camTMA. 
   The contamination model incorporates 
       - the effects of scattering due to surface roughness
       - dust appropriate to a Cleanliness Level of 508 for the POM and 300 for 
         the colTMA and camTMA
       - scattering and absorption from a layer of water ice that is assumed to
         be 100 Angstroms thick on the POM, and 50 Angstroms thick on each 
         surface of the collimator and camera three-mirror assemblies
         
    The throughput of the OTE is take from Lightsey et al. (2012)
    ADS Bibcode: 2012SPIE.8442E..3AL    
    

Please consult the STScI/JWST Exposure Time Calculator 
    https://jwst.etc.stsci.edu

for the most up-to-date estimates of the PCE.   