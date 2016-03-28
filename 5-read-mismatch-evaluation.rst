Evaluating read mismatch statistics: mapping and de novo
########################################################

Looking at read mismatch profiles by mapping to a reference
-----------------------------------------------------------

Do::

   cd ~/notebooks/ecoli
   curl -O https://s3.amazonaws.com/public.ged.msu.edu/ecoliMG1655.fa.gz
   gunzip ecoliMG1655.fa.gz

   bowtie2-build ecoliMG1655.fa ecoli
   gunzip -c ecoli-R1.fq.gz | bowtie2 -p 4 -x ecoli -U - -S ecoli-R1.sam

   ~/notebooks/sam-scan-errhist.py ecoliMG1655.fa ecoli-R1.sam -o ecoli-mapped.errhist

Evaluate de novo::

   cd ~/notebooks/ecoli

   load-into-counting.py -M 1e8 -k 21 ecoli.kh ecoli-R1.fq.gz
   ~/notebooks/report-errhist-2pass.py -C 1 ecoli.kh ecoli-R1.fq.gz > ecoli-kmer.errhist

Plot: @@

RNAseq: @@


Next: :doc:`6-final-thoughts`
