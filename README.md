# ml-eu-countries-health-factors
Unsupervised machine learning algorithms used to establish similarities in chosen EU countries in regards to health factors.

## Data description

### General description

Data in the area of health care was taken from the official database of Eurostat https://ec.europa.eu/eurostat (official subpage of ec.europa.eu). 28 countries were selected for analysis, shown in map below. All countries are members of the European Union.

Variable measurements are mainly from 2018, but because of the lack of values in some of the variables, the closest available value in the database was taken.

#### 1. Medical personnel, excluding caregivers in a given country (hlt_per_exp_ncp),
  - Missing value for the country Luxembourg, filled with observation from year 2017,
  - Missing value for the country Poland, filled with observation from year 2017,
  - Missing value for the country Slovakia, filled with observation from year 2014,
  - Missing value for the country Finland, filled with observation from year 2014.
#### 2. Percentage of population with depression (cds),
  - Missing value for the country United Kingdom, filled with observation from year 2014.
#### 3. The number of physicians in a given country (phy_number),
  - No value for the country Luxembourg, filled with observation from year 2017,
  - No value for the country Poland, filled with observation from year 2017,
  - No value for the country Finland, filled with observation from year 2015.
#### 4. Number of deaths in a given country (cod),
  - No value for the country France, filled with observation from year 2017.

The missing observations in total:
  - Luxembourg (Luxembourg) - 2 values,
  - Poland (Poland) - 2 values,
  - Slovakia (Slovakia) - 1 value,
  - Finland (Finland) - 2 values,
  - France (France) - 1 value,
which gives a total of 8 observations.

### Overwiew of data

#### 1. Healthy life years (hlty_total) (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_hlye_esms.htm">Description</a>)

w określonym wieku powinna przeżyć bez żadnych poważnych lub umiar-
kowanych problemów zdrowotnych.

  - Healthy life years indicator measures 
