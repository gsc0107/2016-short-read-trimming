Some background
###############

Discussion of how Illumina sequencing works - base calling.
Qwhatever. What does B mean.
Statistics and point about errors.
Sensitivity and specificity.

Basic Recommendations:
----------------------

Always adapter trim! It doesn't do any harm.

Impose a length filter to throw away short sequences - something like 25-50.
This will eliminate newly-useless reads that might mismap.

* for quantification (RNAseq), trim lightly
* for RNAseq assembly, trim lightly
* for variant calling, trim stringently

...unless otherwise indicated, or if you have biological reasons otherwise.

The basic logic is that *stringent trimming* can remove lots of *good*
sequence:

.. thumbnail:: images/stringent-trimming.png
   :width: 20%

.. @@ Discuss stuff with RNA editing.
.. @@ Discuss MacManes results

.. @@ 3 pic slide goes here

Structure of a FASTQ file
-------------------------

.. thumbnail:: images/paired-reads.png
   :width: 20%

Paired / split, paired interleaved

Next: :doc:`3-fastqc-evaluation`
