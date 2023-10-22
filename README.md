# FuzzyClusteringSimilarity.R

An R wrapper of [FuzzyClusteringSimilarity.jl](https://github.com/ryandewolfe33/FuzzyClusteringSimilarity.jl) for comparing fuzzy clusterings

## Getting Started

Install from github using devtool. Before getting started, call `fuzzy_setup()` to configure (and install if necessary) julia for computation.

```R
library(devtools)
install_github("ryandewolfe33/FuzzyClusteringSimilarity.R")
library(FuzzyClusteringSimilarity.R)
fuzzy_setup()
```

## References
E. Hullermeier, M. Rifqi, S. Henzgen and R. Senge, "Comparing Fuzzy Partitions: A Generalization of the Rand Index and Related Measures," in IEEE Transactions on Fuzzy Systems, vol. 20, no. 3, pp. 546-556, June 2012. https://doi.org/10.1109/TFUZZ.2011.2179303

D’Ambrosio, A., Amodio, S., Iorio, C. et al. Adjusted Concordance Index: an Extensionl of the Adjusted Rand Index to Fuzzy Partitions. J Classif 38, 112–128 (2021). https://doi.org/10.1007/s00357-020-09367-0

Andrews, J.L., Browne, R. & Hvingelby, C.D. On Assessments of Agreement Between Fuzzy Partitions. J Classif 39, 326–342 (2022). https://doi.org/10.1007/s00357-021-09407-3
