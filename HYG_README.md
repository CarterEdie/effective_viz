**Welcome to the HYG star database archive. The most current version of the database will always be found here.
For additional background details, and older versions of the database, visit http://www.astronexus.com/hyg.

For the most current version of the applications using this database, visit http://www.astronexus.com/endeavour. **

Database field descriptions:
#####hygdata_v3.csv: This is the current version (3) of the HYG stellar database. It is similar to the version 2 (hygxyz.csv) file, but has a few updates. The older file is now deprecated.

All stars now have both an epoch and equinox of 2000.0. In v2 of the catalog, all three primary source catalogs either had or were adjusted to equinox 2000, but all 3 had different epochs, leading to small position errors at high magnifications.
The Flamsteed numbers now include many that were not in the Yale Bright Star Catalog, the primary reference for these numbers in the original catalog. In particular, it now contains all valid numbers listed in "Flamsteed's Missing Stars", M. Wagman, JHA xviii (1987), p 210-223.
Some errors in proper motions have been corrected.
A few additional proper names have been added.
For stars in Hipparcos that are known to be variable, the variable star designations have been added. In general, stars that were merely suspected of variability ("NSV") were excluded.
Fields in the database:

id: The database primary key.
hip: The star's ID in the Hipparcos catalog, if known.
hd: The star's ID in the Henry Draper catalog, if known.
hr: The star's ID in the Harvard Revised catalog, which is the same as its number in the Yale Bright Star Catalog.
gl: The star's ID in the third edition of the Gliese Catalog of Nearby Stars.
bf: The Bayer / Flamsteed designation, primarily from the Fifth Edition of the Yale Bright Star Catalog. This is a combination of the two designations. The Flamsteed number, if present, is given first; then a three-letter abbreviation for the Bayer Greek letter; the Bayer superscript number, if present; and finally, the three-letter constellation abbreviation. Thus Alpha Andromedae has the field value "21Alp And", and Kappa1 Sculptoris (no Flamsteed number) has "Kap1Scl".
ra, dec: The star's right ascension and declination, for epoch and equinox 2000.0.
proper: A common name for the star, such as "Barnard's Star" or "Sirius". I have taken these names primarily from the Hipparcos project's web site, which lists representative names for the 150 brightest stars and many of the 150 closest stars. I have added a few names to this list. Most of the additions are designations from catalogs mostly now forgotten (e.g., Lalande, Groombridge, and Gould ["G."]) except for certain nearby stars which are still best known by these designations.
dist: The star's distance in parsecs, the most common unit in astrometry. To convert parsecs to light years, multiply by 3.262. A value >= 10000000 indicates missing or dubious (e.g., negative) parallax data in Hipparcos.
pmra, pmdec: The star's proper motion in right ascension and declination, in milliarcseconds per year.
rv: The star's radial velocity in km/sec, where known.
mag: The star's apparent visual magnitude.
absmag: The star's absolute visual magnitude (its apparent magnitude from a distance of 10 parsecs).
spect: The star's spectral type, if known.
ci: The star's color index (blue magnitude - visual magnitude), where known.
x,y,z: The Cartesian coordinates of the star, in a system based on the equatorial coordinates as seen from Earth. +X is in the direction of the vernal equinox (at epoch 2000), +Z towards the north celestial pole, and +Y in the direction of R.A. 6 hours, declination 0 degrees.
vx,vy,vz: The Cartesian velocity components of the star, in the same coordinate system described immediately above. They are determined from the proper motion and the radial velocity (when known). The velocity unit is parsecs per year; these are small values (around 1 millionth of a parsec per year), but they enormously simplify calculations using parsecs as base units for celestial mapping.
rarad, decrad, pmrarad, prdecrad: The positions in radians, and proper motions in radians per year.
bayer: The Bayer designation as a distinct value
flam: The Flamsteed number as a distinct value
con: The standard constellation abbreviation
comp, comp_primary, base: Identifies a star in a multiple star system. comp = ID of companion star, comp_primary = ID of primary star for this component, and base = catalog ID or name for this multi-star system. Currently only used for Gliese stars.
lum: Star's luminosity as a multiple of Solar luminosity.
var: Star's standard variable star designation, when known.
var_min, var_max: Star's approximate magnitude range, for variables. This value is based on the Hp magnitudes for the range in the original Hipparcos catalog, adjusted to the V magnitude scale to match the "mag" field.
#####dso.csv: This is a collection of deep-sky objects used in http://www.astronexus.com/endeavour/chart.
There are approximately 220K objects, mostly galaxies, but also all known NGC and IC objects.

Fields in the database:

ra, dec: The object's right ascension and declination, for epoch 2000.0 and equinox 2000.0.
type: The object's type, as in the Historically Corrected NGC (see "dso_source"). A full list of types is in http://www.ngcicproject.org/public_HCNGC/The_HCNGC_intro.pdf, p. 19. This is the canonical list of types for objects in this catalog, regardless of source.
const: The object's constellation, if known.
mag: The object's visual magnitude.
name: A common name for the object.
rarad, decrad: The object's right ascension and declination, in radians.
id: Database unique ID.
r1, r2: Semi-major and semi-minor axes of the object, in arcminutes. If r2 is undefined, r1 is interpreted as the object's radius.
angle: Position angle of the semimajor axis of the object, in degrees. Only defined if r1 and r2 are present.
dso_source: Source identifier for the object's position, size, and magnitude. Valid values are: "0": miscellaneous, limited detail (e.g. Wikipedia). "1": NGC 2000 (Sinott, 1988). "2": Historically Corrected New General Catalogue from the NGC/IC project (http://www.ngcicproject.org). "3": PGC galaxy catalog (http://leda.univ-lyon1.fr/). "4": Collinder open cluster catalog, items not already in Messier,Caldwell,NGC,IC and with defined size and magnitude (http://www.cloudynights.com/item.php?item_id=2544). "5": Perek-Kohoutek catalog IDs, from original (Perek + Kouhoutek, 1967) and update (Perek + Kohoutek, 2001). "6": Faint globulars (Palomar + Terzian) from http://www.astronomy-mall.com/Adventures.In.Deep.Space/obscure.htm and http://www.astronomy-mall.com/Adventures.In.Deep.Space/palglob.htm.
id1, cat1: Primary (most commonly used) ID number/designation and catalog name for this object.
id2, cat2: Additional, frequently-used ID and catalog name for this object (e.g., an NGC or IC number for Messier objects).
dupid, dupcat: Duplicate ID number+catalog name. Unlike id2 and cat2, a duplicate ID normally means this object is better known by the duplicate ID, and should be excluded from display.
display_mag: For objects whose actual magnitude is either not known or is not representative of their visibility (such as very large diffuse nebulas like the Veil or North America Nebula), this is a suggested magnitude cutoff for chart drawing software. This field can be safely ignored for other purposes.
Catalogs represented in the database:

M: Messier (bright objects of all types)
NGC: New General Catalogue (all types)
IC: Index Catalog (all types)
C: Caldwell (bright objects of all types)
Col: Collinder (open clusters and associations)
PK: Perek + Kohoutek (planetary nebulas)
PGC: Principal Galaxy Catalog
UGC: Uppsala Galaxy Catalog
ESO: European Southern Observatory Catalog (galaxies)
Ter: Terzian (globular clusters)
Pal: Palomar (globular clusters)
Older databases (version 2)
These are still available, but are no longer current or being actively updated, and should be considered deprecated for higher-precision applications.

#####hygfull.csv:

StarID: The database primary key from a larger "master database" of stars.
HD: The star's ID in the Henry Draper catalog, if known.
HR: The star's ID in the Harvard Revised catalog, which is the same as its number in the Yale Bright Star Catalog.
Gliese: The star's ID in the third edition of the Gliese Catalog of Nearby Stars.
BayerFlamsteed: The Bayer / Flamsteed designation, from the Fifth Edition of the Yale Bright Star Catalog. This is a combination of the two designations. The Flamsteed number, if present, is given first; then a three-letter abbreviation for the Bayer Greek letter; the Bayer superscript number, if present; and finally, the three-letter constellation abbreviation. Thus Alpha Andromedae has the field value "21Alp And", and Kappa1 Sculptoris (no Flamsteed number) has "Kap1Scl".
RA, Dec: The star's right ascension and declination, for epoch 2000.0. Stars present only in the Gliese Catalog, which uses 1950.0 coordinates, have had these coordinates precessed to 2000.
ProperName: A common name for the star, such as "Barnard's Star" or "Sirius". I have taken these names primarily from the Hipparcos project's web site, which lists representative names for the 150 brightest stars and many of the 150 closest stars. I have added a few names to this list. Most of the additions are designations from catalogs mostly now forgotten (e.g., Lalande, Groombridge, and Gould ["G."]) except for certain nearby stars which are still best known by these designations.
Distance: The star's distance in parsecs, the most common unit in astrometry. To convert parsecs to light years, multiply by 3.262. A value of 10000000 indicates missing or dubious (e.g., negative) parallax data in Hipparcos.
Mag: The star's apparent visual magnitude.
AbsMag: The star's absolute visual magnitude (its apparent magnitude from a distance of 10 parsecs).
Spectrum: The star's spectral type, if known.
ColorIndex: The star's color index (blue magnitude - visual magnitude), where known.
#####hygxyz.csv: the fields in hygfull, plus some additional fields useful for mapping tools:

X,Y,Z: The Cartesian coordinates of the star, in a system based on the equatorial coordinates as seen from Earth. +X is in the direction of the vernal equinox (at epoch 2000), +Z towards the north celestial pole, and +Y in the direction of R.A. 6 hours, declination 0 degrees.
VX,VY,VZ: The Cartesian velocity components of the star, in the same coordinate system described immediately above. They are determined from the proper motion and the radial velocity (when known). The velocity unit is parsecs per year; these are small values (around 10-5 to 10-6), but they enormously simplify calculations using parsecs as base units for celestial mapping.