Trimming reads with Trimmomatic
###############################

Note: the `trimmomatic manual
<http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf>`__
is the go-to-guide for parameters and commands.

E. coli trimming
----------------

Trim the E. coli data lightly::

   cd ~/notebooks
   cd ecoli

   java -jar /home/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
    ecoli-R1.fq.gz ecoli-R2.fq.gz \
    ecoli-R1-pe.fq ecoli-R1-orphans.fq ecoli-R2-pe.fq ecoli-R2-orphans.fq \
     ILLUMINACLIP:/home/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:40:15 \
     LEADING:2 TRAILING:2 \
     SLIDINGWINDOW:4:2 \
     MINLEN:50

You should see::

   Input Read Pairs: 100000 Both Surviving: 99802 (99.80%) Forward Only Surviving: 186 (0.19%) Reverse Only Surviving: 12 (0.01%) Dropped: 0 (0.00%)

Trim the E. coli data stringently::

   java -jar /home/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
    ecoli-R1.fq.gz ecoli-R2.fq.gz \
    ecoli-R1-pe.fq ecoli-R1-orphans.fq ecoli-R2-pe.fq ecoli-R2-orphans.fq \
     ILLUMINACLIP:/home/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:40:15 \
     LEADING:2 TRAILING:2 \
     SLIDINGWINDOW:4:20 \
     MINLEN:50

You should see::

   Input Read Pairs: 100000 Both Surviving: 83439 (83.44%) Forward Only Surviving: 8960 (8.96%) Reverse Only Surviving: 4821 (4.82%) Dropped: 2780 (2.78%)

You can use khmer's readstats.py to evaluate the loss of sequence -- ::

   readstats.py ecoli-R?.fq.gz
   readstats.py ecoli-R?-*.fq

Now, run fastqc on the trimmed data::

   fastqc ecoli-R1-pe.fq
   fastqc ecoli-R2-pe.fq

Trimming the yeast RNAseq data
------------------------------

Next, try building your own commands to trim the yeast RNAseq data -
stringently, and lightly.

Next: :doc:`5-read-mismatch-evaluation`
