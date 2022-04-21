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

1. Healthy life years <b>(hlty_total)</b> (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_hlye_esms.htm">Description</a>)
  - Statistical unit : years,
  - Statistical population : the whole EU population is covered,
  - Units of measure : indicator Health expectancies based on self-perceived health is presented for women and men and at different ages (at birth, at 50 and at 65),
  - Character : stimulant.
2. Healthy life expectancy <b>(hlte_sph_total)</b> (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_17_esms.htm">Description</a>)
  - Statistical unit : years,
  - Statistical population : the whole EU population aged 15+ is covered,
  - Units of measure : indicator Health expectancies based on self-perceived health is presented for women and men and at different ages (at birth, at 50 and at 65),
  - Character : stimulant.
3. Self-perceived health <b>(sph_total)</b> (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_01_esms.htm">Description</a>)
  - Statistical unit : individuals aged 16 years old and over living in private households,
  - Statistical population : individuals aged 16 years old and over living in private households.
  - Units of measure : percentage,
  - Character : stimulant.
4. Hospital beds <b>(hbds_number)</b> (<a href = "https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
  - Statistical unit : Administrative data sources refer to registered health professionals or health care facility categories. The underlying totality of institutions, for which data collections are available, may differ. In some countries, data may not be available for a subgroup of institutions (e.g. private hospitals),
  - Statistical population : the target populations are all available beds or equipment in hospitals or in nursing and residential care facilities,
  - Units of measure : number of hospital beds in facilities mentioned above in a given country,
  - Character : stimulant.
5. Health graduates <b>(hlt_graduates)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
  - Statistical unit : Administrative data sources refer to registered health professionals or health care facility categories. The underlying totality of institutions, for which data collections are available, may differ. In some countries, data may not be available for a subgroup of institutions (e.g. private hospitals),
  - Statistical population : the target population is all health care staff,
  - Units of measure : number of health graduates in a given country,
  - Character : stimulant.
6. Health personnel (excluding nursing and caring professionals) <b>(hlt_per_exp_ncp)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
  - Statistical unit : Administrative data sources refer to registered health professionals or health care facility categories. The underlying totality of institutions, for which data collections are available, may differ. In some countries, data may not be available for a subgroup of institutions (e.g. private hospitals),
  - Statistical population : the target population is all health care staff,
  - Units of measure : number of health personnel excluding nursing and caregiving professionals in a given country,
  - Character : stimulant.
7. Accidents at work <b>(acc_at_work)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hsw_acc_work_esms.htm">Description</a>)
  - Statistical unit : Microdata are collected for the victim of each accident. When this is not feasible, estimation and imputation, even if based on survey and not case-by-case data, may be used to fill gaps in data coverage,
  - Statistical population : in principle all accidents at work should be covered that fulfil the definition of '3.4. Statistical concepts and definitions' (check Description link for further reading),
  - Units of measure : number of accidents,
  - Character : destimulant.
8. Current depressive symptoms <b>(cds)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_det_esms.htm">Description</a>)
  - Statistical unit : the statistical unit is the individual,
  - Statistical population : all persons aged 15 years or over living in private households and residing in the territory of the country,
  - Units of measure : all indicators are calculated in terms of percentages,
  - Character : destimulant.
9. Physicians by medical speciality <b>(phy_number)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_res_esms.htm">Description</a>)
  - Statistical unit : administrative data sources refer to registered health professionals or health care facility categories. The underlying totality of institutions, for which data collections are available, may differ. In some countries, data may not be available for a subgroup of institutions (e.g. private hospitals).
  - Statistical population : the target population is all health care staff,
  - Units of measure : number of physicians in a given country,
  - Character : stimulant.
10. Causes of death - deaths by country of residence and occurrence <b>(cod)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_cdeath_sims.htm">Description</a>)
  - Statistical unit : the statistical unit is the deceased person,
  - Statistical population : the statistical population is the population of a given country, including both residents and non-residents (check Description for further reading),
  - Units of measure : number of deceased people in a given country,
  - Character : destimulant.
11. Self-reported unmet needs for medical examination by sex, age, main reason declared and groups of country of birth <b>(unm_needs)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_01_esms.htm">Description</a>)
  - Statistical unit : individuals aged 16 years old and over living in private households,
  - Statistical population : the EU-SILC target population in each country consists of all persons living in private households. Persons living in collective households and in institutions are generallyexcluded from the target population,
  - Units of measure : percentage,
  - Character : destimulant.
12. Health care expenditure by provider <b>(hlt_care_exp)</b> (<a href="http://ec.europa.eu/eurostat/cache/metadata/en/hlth_sha11_esms.htm">Description</a>)
  - Statistical unit : statistical and administrative sources refer usually to institutional units active in providing health (care) services to the population (check Description for further reading),
  - Statistical population : the data aim at providing a complete overview of expenditure on health care goods and services consumed by the domestic population and produced by providers of health care, from whichever source this consumption is financed.
  - Units of measure : milion euro,
  - Character : stimulant.
13. People having a long-standing illness or health problem, by sex, age and educational attainment level <b>(lng_stnd_illness)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_01_esms.htm">Description</a>)
  - Statistical unit : individuals aged 16 years old and over living in private households,
  - Statistical population : the EU-SILC target population in each country consists of all persons living in private households. Persons living in collective households and in institutions are generallyexcluded from the target population,
  - Units of measure : percentage,
  - Character : destimulant.
14. Self-perceived long-standing limitations in usual activities due to health problem by sex, age and educational attainment level <b>(splong_lim)</b> (<a href="https://ec.europa.eu/eurostat/cache/metadata/en/hlth_silc_01_esms.htm">Description</a>)
  - Statistical unit : individuals aged 16 years old and over living in private households,
  - Statistical population : the EU-SILC target population in each country consists of all persons living in private households. Persons living in collective households and in institutions are generallyexcluded from the target population,
  - Units of measure : percentage,
  - Character : destimulant.

All code is in <b>Script.Rmd</b> file, output is in <b>Output.html</b>.
