Final thoughts on short-read trimming
#####################################

A summary of recommendations
----------------------------

* Run FastQC before trimming; trim; look again.
* Always trim paired sequences together.
* Always adapter trim!
* Impose a length filter, 50.
* for quantification (RNAseq), trim lightly
* for RNAseq assembly, trim lightly
* for variant calling, trim stringently
* use the same trimming parameters on all your data unless you have a VERY
  good reason otherwise!
* ignore the first 10 bp composition bias in RNAseq;
* ignore sequence duplication levels in high-coverage RNAseq;
* look at your read positional bias with mapping (or de novo) as well;

Some references
---------------

MacManes, 2014, http://journal.frontiersin.org/article/10.3389/fgene.2014.00013/full - recommends gentle trimming for RNAseq.

Williams et al., 2015, http://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-0956-2 - recommends imposing a length filter.

Mbandi et al., 2014, http://journal.frontiersin.org/article/10.3389/fgene.2014.00017/full - complicated, but start with gentle trimming.

Del Fabbro et al., 2013, http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0085024 - evaluation across data sets.
