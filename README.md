# FakeModel

## Model Description
The cellular level model focuses on the gene expression profiles and the interactions between various genes. The aim is to analyze genes and generate a dynamic network model.


## References
Krouk, G., Mirowski, P., LeCun, Y., Shasha, D.E., Coruzzi, G.M. (2010). Predictive network modeling of the high-resolution dynamic plant transcriptome in response to nitrate. Genome Biology 11, R123. [Link] (https://doi.org/10.1186/gb-2010-11-12-r123)
[State space model from Krouk et al, 2010](https://github.com/piotrmirowski/DFG4GRN)

## Running the model

```
matlab src/GrNM_model.m /r Input/GrNM_input.txt Input/GrNM_Static.txt
```

## Model Inputs/Outputs

### Inputs

Name | Units | Data Type | Description
---- | ----- | --------- | -----------
GrNM_Input | n/a | 4x2 matrix of character and floats | Tha parameters required for the model.
GrNM_Static | n/a | float matrix m x n | A normalized gene expression matrix of size mxn, m=number of genes, n=number of samples.


### Outputs

Name | Units | Data Type | Description
---- | ----- | --------- | -----------
GrNM_Output | n/a | float matrix m x m | A matrix of expected weights for the gene expression, m=number of genes.
