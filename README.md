Loss engineering expansion for MPB

This is the 2D version of the free MPB extension code for the computation of the bandstructure, group index and propagation loss of photonic crystal (PhC) slab waveguides. The effective period method is used to approximate the behaviour of the 3D structure, as outlined in reference [1]. Any 2D simulation of a 3D structure is always an approximation and therefore we recommend that this approach issued for larger parameter sweeps, with final results validated using either 3D simulations or experimental results. 

It consists of several parts. First a control file for the free MIT Photonics-Bands (MBP) package, written in scheme, to calculate the electromagnetic modes and dispersion curve of the photonic crystal waveguide as well as calculating the out-of-plane and back-scattering coefficients as outlined in reference [2]. The additional files are for data analysis and consist of Linux shell and Matlab scripts. All files are contained in Loss_engineering_2D.zip.

All scripts can be downloaded under the free GPL license, and no installation is required. However, an installed version of MPB (available free from: HTTP://ab-initio.mit.edu/wiki/index.php/MPB) is required.  Additionally, Matlab is required for the (optional) analysis tools.

When publishing results obtained with this software, please cite references [1,2]. Furthermore we suggest a statement similar to the exemplary one below in the text of your manuscript:
"Simulations were performed using the effective period method [1], with the propagation loss modeled according to reference [2]."

Features

Efficient 2D simulation (approx. 100 times faster than 3D)
Calculation of propagation loss for different line defect waveguides
Prebuild support for dispersion engineering, using a variety of designs [3]
Simultaneous calculation of bandstructure, field distributions, group index curves and propagation loss possible.
Free software under the GNU General Public License. 

The calculation is time efficient and a 2D computation of the bandstructure, the group velocity curve, as well as the out-of-plane and back-scattering coefficients for a slow light waveguide on an Intel i-7 desktop (2.6GHz), using mpb-split 8, over 51k-points using 16x16x30 grid is finished in approximately 1 min and uses 100MB of RAM.

Contact info

For support using this script or suggestion for improving it please contact Sebastian Schulz (sschulz@uottawa.ca or sebastianandreasschulz@gmail.com) alternatively Sebastian Schulz also follows discussions on the mpb-discuss mailing list.
For general problems or questions regarding MPB, please consult the MPB Documentation (HTTP://ab-initio.mit.edu/wiki/index.php/MPB_manual), the mpb-discuss archives or the mpb-discuss mailing list. 

References
[1] S.A.Schulz, A.H. K. Park, I. De Leon, J. Upham and R. W. Boyd “Beyond the effective index method: improved accuracy for 2D simulations of photonic crystal waveguides”, Journal of Optics 17, 075006 (2015). 
[2] L.O'Faolain, S. A. Schulz, D. M. Beggs, T. P. White, M. Spasenović, L. Kuipers, F. Morichetti, A. Melloni, S. Mazoyer, J. P. Hugonin, P. Lalanne and T. F. Krauss “Loss engineered slow light waveguides”, Optics Express 18, 27627-27638 (2010).
[3] S.A.Schulz, L. O. Faolain, D. M. Beggs, T. P. White, A. Melloni and T. F. Krauss “Dispersion engineered slow light in photonic crystals: a comparison”,  Journal of Optics 12, 104004 (2010). 
