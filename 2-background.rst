Some background
###############

Discussion of how Illumina sequencing works - base calling.

The Illumina machine encodes its quality information in the
`FASTQ format <https://en.wikipedia.org/wiki/FASTQ_format>`__.

Quality scores are provided per base, in a log-10 scaled format.
The likelihood of a base call being erroneous is 10 to the power
of (-Q/10) - so for a Q value of 3, you get an error rate of 1/2,
for a Q value of 30, you get an error rate of 0.001, and for a Q
value of 40, you get an error rate of .0001.

Illumina typically uses a Q value of 2 to mean "ignore this base."

It's easy to know what to do with Ns and bad bases. But the challenge
for us with Q scores is that they are *statistical* in nature - if we
throw away every base with a Q value of 30, then 99.9% of the data
we are discarding will be correct!

What do we use Illumina sequencing for?
---------------------------------------

.. thumbnail:: images/slide-1.png
   :width: 20%
           
.. thumbnail:: images/slide-2.png
   :width: 20%
           
.. thumbnail:: images/slide-3.png
   :width: 20%

In the end, the question is, what effect will *losing real data* have
vs *including spurious data*, given the biological goal and the tools
you have to reach it?

Basically, trimming tends to decrease sensitivity, while increasing
specificity.

Basic Recommendations:
----------------------

Always adapter trim! It doesn't do any harm.

Impose a length filter to throw away short sequences - something like 50.
This will eliminate newly-useless reads that might mismap.

* for quantification (RNAseq), trim lightly
* for RNAseq assembly, trim lightly
* for variant calling, trim stringently

...unless otherwise indicated, or if you have biological reasons otherwise.

The basic logic is that *stringent trimming* can remove lots of *good*
sequence; in addition to removing actual errors.

.. thumbnail:: images/stringent-trimming.png
   :width: 20%

In case it's not clear, trimming (or not) can have real impact on your
outcome --

See `Questioning the evidence for non-canonical RNA editing in humans <http://genomesunzipped.org/2012/03/questioning-the-evidence-for-non-canonical-rna-editing-in-humans.php>`__; and also `Trimming RNAseq <http://journal.frontiersin.org/article/10.3389/fgene.2014.00013/full>`__.

Structure of a FASTQ file
-------------------------

.. thumbnail:: images/paired-reads.png
   :width: 20%

Next: :doc:`3-fastqc-evaluation`
