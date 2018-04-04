DEFINE: bench scientists


# ISDB and HIRIS

Notes:

* Most data from flat files and external sources; no direct entry
* Specifies conventions for data and provides tools for transforming and loading data
* Database isn't precious
* Provides analysis-ready datasets and standardized access
* Data exports, direct SQL, R + dplyr, or Redash


# Polish

While it would have been simpler for me to write as a command line script — and
indeed that was my first prototype — it wouldn't have served Dylan as well.
The extra time spent making it an interactive web app with a polished UI and UX
was well worth it.

There are other tools that provide similar features, but they're all very
clunky and hard to use.  The output they produce isn't nice enough to use
directly, and the data outputs are only in machine formats, not formats that
take into account humans who want to look at the analyzed data itself.


# Is this for you?

Currently demand vastly outstrips supply for bioinformatics skills in biology.
There's a general consensus that the field needs to, as a whole, incorporate
more bioinformatics and software development training into undergraduate and
graduate biology curriculums.  While this certainly must happen to a degree,
it's a little like saying, "Well, to be a successful rocket scientist, you now
also need a law degree."  The practices of bioinformatics and software
development are vast!  While familiarity and literacy in both is a good goal,
it's unreasonable to expect biology students to start mastering multiple
fields.

There's another strategy that I think should be part of the solution: create
staff positions for and recruit professional software developers into research
science.  There are interesting and meaningful problems to solve in biology and
a different culture than the tech industry, both of which can be attractive
selling points.

The rewards of working in a lab are many:

You'll learn a new domain; scientists are happy to teach and explain

You'll be doing scientific research.  It's not just doing what other people
ask.  There's broad space for your own thoughts, decision making, and
implementation, and feedback. [reword in dire need]

Pace is often fast.  Can never keep up with bench scientists, whether they're
working on a new assay or churning through a rote set of experiments, thinking
on your feet is necessary.  Building the "MVP" that works now to smoothly
capture data and allows ongoing analysis.  Prepare to adapt your schemas!
(and yes, you want schemas to keep data integrity)

Scientists are the ultimate pragmatists: if you make somesthing that's easier
and produces better output, they'll use it!  But you need to empathize with
what's a real problem and what's not.  They are big believers in YAGNI.

...

The bright side is that we don't need to bring data lakes or distributed
messaging systems or data center orchestration that last mile to every lab in
America, just basic modern software development using the current tools and
practices of the trade.

There are plenty of labs with big data needs, but most of biology is
encountering "medium data" problems: too much data to analyze by hand or in
Excel — though that doesn't stop folks from trying anyway — but not enough data
to warrant Hadoop.  I like to think of this as data that's "just right".
[Goldilocks pic?]  The problems to solve are more about the domain than the
scale.  [eh?]

...

As programmers who know Perl, you're well-poised to think in terms of both
high-level applications and raw data manipulation.  You don't need a PhD to do
this work.  You do need to have empathy and a determination to help others.

"Compassionate" computing

...

The field of biology has a dire need for people who can think computationally
and write good software at all levels.  The field is currently grappling with
how to build out these last mile ...
