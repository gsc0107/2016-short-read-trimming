Evaluating samples with FastQC
##############################

Download some data
------------------

Let's grab some E. coli genomic data from @@::
  
   cd ~/notebooks
   mkdir ecoli
   cd ecoli

   curl -u single-cell:SanDiegoCA http://bix.ucsd.edu/projects/singlecell/nbt_data/ecoli_ref.fastq.bz2 | \
     bunzip2 -c | head -800000 | gzip -9c > ecoli-pe.fq.gz

This data comes already interleaved; let's split it up. ::
     
   split-paired-reads.py ecoli-pe.fq.gz
   mv ecoli-pe.fq.gz.1 ecoli-R1.fq
   mv ecoli-pe.fq.gz.2 ecoli-R2.fq
   gzip ecoli-*.fq

You can take a look at the data files with 'less'::

   zless ecoli-R1.fq.gz

Next, grab some yeast mRNAseq data::

   cd ~/notebooks
   mkdir yeast
   cd yeast

   curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR453/SRR453569/SRR453569_1.fastq.gz | \
     gunzip -c | \
     head -400000 | \
     gzip -9c > yeast-rnaseq-R1.fastq.gz
     
   curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR453/SRR453569/SRR453569_2.fastq.gz | \
     gunzip -c | \
     head -400000 | \
     gzip -9c > yeast-rnaseq-R2.fastq.gz

Running fastqc
--------------

You can run fastqc on all four of these files like so::

  cd ~/notebooks/ecoli
  fastqc ecoli-R1.fq.gz
  fastqc ecoli-R2.fq.gz

  cd ~/notebooks/yeast
  fastqc yeast-rnaseq-R1.fastq.gz
  fastqc yeast-rnaseq-R2.fastq.gz
  

Observations:
* RNAseq has weird first 10 bp. This is not errors but instead due to random
  priming.
* Sequence duplication levels may be "high" for high-coverage RNAseq.
* All sequences have the same length pre-trim; this is how Illumina does it.
* R1 is always worse than R2.


Next: :doc:`4-trimming`
