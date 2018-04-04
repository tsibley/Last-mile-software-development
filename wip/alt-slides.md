---

<!-- .slide: class="headers-left" -->

### Data usability
### Process and workflow
### Hypothesis exploration

Notes:

The work I do can be broadly lumped into a few categories:

1. Data usability
2. Process and workflow
3. Hypothesis exploration

---

## Data usability

Notes:

Data usability is a core goal upon which almost every other goal or task
depends.  ...

Data usability is a "fitness of use" property which is relative to the person
interested in the data.

How easily can this data be used after generation?

~~~

### Data management
### <del>Data</del> transformation
### <del>Data</del> discovery
### <del>Data</del> preparation for analysis

<!-- .slide: class="header-madlib" -->

---

### Process and workflow

Notes:

...

---

![HHV8 pipeline diagram](images/HHV8-Pipeline.svg)
<!-- .element: class="padded" -->

Notes:

Process and workflow support also include the ubiquitous "pipelines" you hear
so much about in bioinformatics.

This is a diagram for a pipeline I built that characterizes the genomic
structure of and mutations in human herpesvirus-8.  This pipeline uses a
combination of new and existing tools written in Perl, Python, bash, R, and C;
whatever does the job best!

Everyone is excited about pipelines and wants pipeline for this and a pipeline
for that; a pipeline on every corner!  But what they're really expressing is,
"Isn't it great that we can do this obscure, tedious set of tasks
automatically!?"

Good bench scientists are nothing if not great at following instructions, what
they call "protocols".  It's a huge win if they can make the protocol simpler
though, and pipelines do that for bioinformatics work.

---

### Hypothesis generation
### <del>Hypothesis</del> testing
### <del>Hypothesis</del> exploration

<!-- .slide: class="header-madlib" -->

---

# Faceted search

Notes:

* Benefits of faceted search are very clear and well-supported
* All Pg
    - Able to be used with more exotic search functionality in the future
* Immediately graspable by playing around
    - don't have to know what values exist to search for, they're just all shown!
* Now we're replacing data tables with slimmed down versions of the faceted search, as it makes for a good filtered table component too
* Replaced terrible advanced search, which no one could use (including me, without reading the source again first to remind me how conditions combined)

---

# qPCR screening

Notes:

* Generate experiment templates to load into the instrument
* Printable setup guides
* Import data from instruments' exported data files
* Reduces error prone

---

# Visualizations

qPCR plots
TC plate maps
    coloring seems extraneous, until you realize it can reveal edge effects
experiment to experiment comparisons
is meta genes
patient chart
lab lines
sequence location

---





---

# YAGNI!

Notes:

Bench scientists are really good at this.  Their job all day is to minimize
waste and maximize efficiencies in their benchtop reactions and the way they
schedule, setup, and run experimental procedures.

---

## If it's not used, remove it!

<small>If it's barely used, make it unused!</small>

Notes:

The corrolary of YAGNI is that if its not used, remove it!  And if it's barely
used, consider if you can make it unused.

We all use version control.  If you need to resurrect something later, it's
trivial.  [I wonder about Viroverse lines of code over time?]

~~~

[swoosh]

Notes:

Just delete it!

Deleting unused code will make your codebase simpler to understand easier to
extend with features you do use.

~~~

[commit msg of sequence annotation removal?]

Notes:

This has come up for me a few times after building out features we thought we
needed for upcoming projects that changed methods or that just never came to
fruition.

[Experiment codes? Sequence annotations]

---







# ISDB and HIRIS

Notes:

* Most data from flat files and external sources; no direct entry
* Specifies conventions for data and provides tools for transforming and loading data
* Database isn't precious
* Provides analysis-ready datasets and standardized access
* Data exports, direct SQL, R + dplyr, or Redash





---

### Act III

🙛 🙙  <!-- .element: class="fleuron snug" -->

## Final Thoughts

---

Notes:

Designing and building software for research scientists is different than
building a product to your vision.  Research software must fit into the
workflows that already exist, by and large, outside of the computer and not
dictate them.

You're modeling real-world steps that happen in experiments, things that
experiments produce, and actions that people perform.  You don't typically get
to decide what someone does at the bench, and so the challenges are different
from designing many software products or applications.

The software is in service to the science and scientific goals.  The job is to
save labor, not create it out of thin air by imposing new demands.  My
colleague Evan talks about this process of "building right up to the edges of
what researchers are already doing."

[photo of edges, something very close together, a bridge or building]

---

![Methylation Station](images/methylation-station/start.png) <!-- .element: class="frameless" -->

Notes:

A good example of this a small, single-page JavaScript app I wrote called
Methylation Station.  My lab mate Dylan come to me one day and asked me to help
him with some data he was generating.  He's looking at patterns of something
called DNA methylation, which is a non-inherited modification of DNA.  While he
was able to manually analyze data during the initial stages of the project, the
data was piling up and starting to get too unwieldy to keep doing that.

---

![](images/methylation-station/dylan-excel.png) <!-- .element: class="wide" -->

Notes:

Notably, he didn't want an all-singing, all-dancing, end-to-end pipeline, which
was good because we didn't have time for that amidst other projects.  He just
thought there must be a better way to analyze this than spending tedious hours
in front of Excel.

In software development we talk about libraries which are drop in replacements
for other libraries.  These are attractive because they make it easy to swap in
a better version of something else you're already using.  What Dylan wanted
was a drop in replacement for the tedious part of his workflow.

---

![data flow](images/methylation-station/data.png) <!-- .element: class="frameless" style="max-height: 550px" -->

Notes:

To accomplish that, Methylation Station leaves the assembly and quality control
of the input data up to the researcher's judgement and produces output data
files which match what Dylan was already producing by hand.  He can just copy
and paste into existing spreadsheets he was maintaining to compile data.

---

![Visualizations](images/methylation-station/viz.png) <!-- .element: class="frameless" -->

Notes:

With the analyzed data now in a tidy, machine-readable format, it was
relatively simple for the app to match an existing visualization Dylan was
producing to help comprehend the data, dropping in for that part of his
workflow too.

---

XXX TODO

Notes:

And perhaps most importantly, it replaces the labor-intensive parts of his
previous workflow, while building "up to the edges" of the rest of his workflow
by presenting figures and data that slot right in to the workflow.

It's a successful little app because it's a) easy to use, b) doesn't require
any workflow changes from him, and c) produces prettier, less error-prone
results quicker.

While it would have been simpler for me to write as a command line script — and
indeed that was my first prototype — it wouldn't have served Dylan as well.
The extra time spent making it an interactive web app with a polished UI and UX
was well worth it.

There are other tools that provide similar features, but they're all very
clunky and hard to use.  The output they produce isn't nice enough to use
directly, and the data outputs are only in machine formats, not formats that
take into account humans who want to look at the analyzed data itself.

When other lab members saw this app, they wanted to know if I could do
something similar for their analysis tasks.  This is a common reaction, and
it's really satisfying to be on the receiving end of.

[XXX TODO more on this command line (old) vs. polished app (new)]

---




---

<figure>
![stickers in use](images/stickers-vials.png)
<figcaption>Evan Silberman</figcaption>
</figure>

Notes:

A good example of this when we realized our scientists were hand labeling
dozens of tiny stickers for every experiment they did.  Each sticker's label
had to be different, making even using a Word template laborious.

In this photo, each white dot is a sticker on top of a small vial.  That's not
a giant marker, the stickers are just _tiny_!

These aren't the normal printable stickers you'd buy at OfficeDepot either.
They're cryo-safe stickers which will stay stuck to vials for years at minus
200°C (-328°F) while they chill out in the liquid nitrogen freezer.

While our scientists just buckled down to get the job done every time, it was
obvious that we couldn't let that stand.

---

![sticker generation](images/stickers-tcozy.png) <!-- .element: class="frameless" -->

Notes:

After only a couple days of hacking, testing, and discussing stickers, our
scientists can now come to the lab's tissue culture app, TCozy, and generate
labels based on the relevant data for the experiment they're wrapping up and
freezing down.

Once they no longer had to worry about actually labeling the stickers
themselves, they started suggesting improvements like color coding the label
text and creating a second sticker for each vial which contained additional
information.

---

There _are_ times when you get to impose sanity, as long as you're empathatic
about the consequences of doing so and design with those in mind.  For example,
when building TCozy, our application to track tissue culture data, we decided
that we had to impose a standardized culture naming scheme so that the software
stood a chance of being able to interpret data associated with a set of
cultures.  We adapted the ad-hoc naming sequence our scientists were already
using, making it robust and creating a central naming authority.

Tissue culture, or cell culture, is the process of growing cells in a dish in
the lab.  Tissue culture is the backbone of a lot of molecular biology, as it
enables researchers to study how cells respond to stimuli and provides a method
of obtaining the sheer numbers of cells necessary for some experiments.


