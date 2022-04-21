# ml-eu-countries-health-factors
Unsupervised machine learning algorithms used to establish similarities in chosen EU countries in regards to health factors.

## Data description

### General description

Data in the area of health care was taken from the official database of <a href = "https://ec.europa.eu/eurostat">Eurostat</a> (official subpage of ec.europa.eu). 28 countries were selected for analysis, shown in map below. All countries are members of the European Union.

Variable measurements are mainly from 2018, but because of the lack of values in some of the variables, the closest available value in the database was taken.

1. <b>Medical personnel, excluding caregivers in a given country (hlt_per_exp_ncp)</b>,
  - Missing value for the country Luxembourg, filled with observation from year 2017,
  - Missing value for the country Poland, filled with observation from year 2017,
  - Missing value for the country Slovakia, filled with observation from year 2014,
  - Missing value for the country Finland, filled with observation from year 2014.
2. <b>Percentage of population with depression (cds)</b>,
  - Missing value for the country United Kingdom, filled with observation from year 2014.
3. <b>The number of physicians in a given country (phy_number)</b>,
  - No value for the country Luxembourg, filled with observation from year 2017,
  - No value for the country Poland, filled with observation from year 2017,
  - No value for the country Finland, filled with observation from year 2015.
4. <b>Number of deaths in a given country (cod)</b>,
  - No value for the country France, filled with observation from year 2017.

The missing observations in total:
  - Luxembourg - 2 values,
  - Poland - 2 values,
  - Slovakia - 1 value,
  - Finland - 2 values,
  - France - 1 value,
which gives a total of 8 observations.

### Variables description

1. Healthy life years (hlty_total) (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_hlye_esms.htm">Description</a>)
2. Healthy life expectancy (hlte_sph_total) (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_17_esms.htm">Description</a>)
3. Self-perceived health (sph_total)(<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_01_esms.htm">Description</a>)
4. Hospital beds (hbds_number) (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
5. Health graduates (hlt_graduates) (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
6. Health personnel, caregivers excluded (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
7. Accidents at work (acc_at_work) (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hsw_acc_work_esms.htm">Description</a>)
8. Current depressive symptoms (cds) (<a href="">Description</a>)

w określonym wieku powinna przeżyć bez żadnych poważnych lub umiar-
kowanych problemów zdrowotnych.

  - Healthy life years indicator measures 
