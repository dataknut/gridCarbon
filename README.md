# gridCarbon
Package to support analysis of UK &amp; NZ electricity grid carbon intensity data. Based on original Otago/gridCarbon

Inspired by:

 * [Staffell 2017](http://www.sciencedirect.com/science/article/pii/S0301421516307017) (UK analysis)
 * [Khan et al, 2018](http://www.sciencedirect.com/science/article/pii/S0959652618306474) (NZ Analysis)

Started out as part of a [CfS](https://cfsotago.github.io/) summer student scholarship project and has evolved into something slightly larger and more complicated :-)

## Results

Reports and results best viewed on github [pages](https://dataknut.github.io/gridCarbon/).

 * GB [wind/solar vs coal/gas generation mix](https://dataknut.github.io/gridCarbon/rmd/gbGenMixTrends.html) over time (inspired by https://twitter.com/DrSimEvans/status/1508409309775994892)
 * Analysis of [GB generation mix and emissions](https://git.soton.ac.uk/ba1e12/gbLockdownElecPaper) during COVID19 2020 lockdown:
   * Anderson, B., & James, P. (2021). Covid-19 lockdown: impacts on GB electricity demand and CO2 emissions. Buildings and Cities, 2(1), 134–149. DOI: http://doi.org/10.5334/bc.77
 * Analysis of New Zealand [electricity generation emissions](https://dataknut.github.io/nzGridCarbonPaper/) (tl;dr: renewable ! necessarily = low emissions...)

## Data sources

GB:

 * https://data.nationalgrideso.com/carbon-intensity1/national-carbon-intensity-forecast
 * https://data.nationalgrideso.com/carbon-intensity1/regional-carbon-intensity-forecast
 * https://data.nationalgrideso.com/carbon-intensity1/historic-generation-mix - does not include generation that is embedded (i.e. below GXP so invisible to grid)
 
NZ:

 * https://www.emi.ea.govt.nz/Wholesale/Datasets/Metered_data/Embedded_generation/ - need to add this to...
 * https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD/ - does not include generation that is embedded (i.e. below GXP so invisible to grid)
 * https://www.emi.ea.govt.nz/Wholesale/Datasets/Metered_data/Grid_export/ - flow at GXPs
 
## Code

The repo is intentionally structured as an R package. To install it:

* [fork it](https://git.soton.ac.uk/SERG/workflow/-/blob/master/CONTRIBUTING.md)
* build it
* make a branch & do some edits
* commit & send a pull request

Re-use terms: [License](LICENSE)

# YMMV
