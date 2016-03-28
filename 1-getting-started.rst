Getting started
###############

Local installs and Web site
---------------------------

* make sure you are using the latest version of Google Chrome
* here is `an etherpad link for copy/paste <https://etherpad.wikimedia.org/p/2016-03-28-short-read-trim-qual>`__

Software we'll be using on the server
-------------------------------------

* `Trimmomatic <http://www.usadellab.org/cms/?page=trimmomatic>`__
* `FastQC <http://www.bioinformatics.babraham.ac.uk/projects/fastqc/>`__
* `khmer <https://khmer.readthedocs.org/en/v2.0/>`__
* `bowtie2 <http://bowtie-bio.sourceforge.net/bowtie2/index.shtml>`__
* a few custom scripts in the `workshop repository <https://github.com/ngs-docs/2016-short-read-trimming>`__

The `Dockerfile
<https://github.com/ngs-docs/2016-short-read-trimming/blob/master/Dockerfile>`__
shows the basic installation instructions for an Ubuntu machine.

A first test
------------

Click here:

.. image:: http://mybinder.org/badge.svg
   :target: http://mybinder.org/repo/ngs-docs/2016-short-read-trimming

Once you're at the console, go to New... Terminal... and copy/paste
this text into it::

  echo hello, world

If it doesn't work, could you `e-mail me <mailto:titus@idyll.org>`__
with your browser and OS version, please?

If copy/paste doesn't work for you, you can do the following:

* open a new file in the editor, and name it 'commands.sh';
* copy/paste stuff into commands.sh, clearing it each time;
* to execute the commands, run::

    . commands.sh

Next: :doc:`2-background`
