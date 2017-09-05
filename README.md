#  Cellular Level Model

###  Description:
The cellular level model focuses on the gene expression profiles and the interactions between various genes. The aim is to analyze genes and generate a dynamic network model which will allow us to study following 2 characteristics:
- Node interference: The effect of removal of a node from the network to study it's effects on the remaining nodes. In other words, the virtual knockout of a gene will correspond to interference.
- Node robustness: The resilience of a node to modification of the network. In other words, how much the other ndoes will be affected by removing one node.

### Code References
[State space model from Krouk et al, 2010](https://github.com/piotrmirowski/DFG4GRN)

### License
Genome Biology OpenAccess, GNU General Public License, The MathWorks Inc.

### Runtime Requirements:
- Softwares: MATLAB

### Development Environment/Requirements:
- Packages: bolasso (including in code source)

### Inputs:
- Type: Data matrix with gene ID in column 1 and their expression profile in other columns. (sample data included in the code source)
- Size: ~50kb
- Number: -
- Test Data Location: DFG4GRN/Arabidopsis/Arabidopsis_n76_RMA.mat

### Outputs
- Type: Graphs showing level of influence of transcription factors
- Size: ~500kb total
- Count: same as # of TFs
  
### Build Instructions
- //Check-out codebase
- //Run Tutorial.m

### Test Instructions
- How to test and verify that it is working properly

### Setup/Build/Run example output:
 - screen/terminal capture of building the tool and running it.
