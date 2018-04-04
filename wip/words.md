Hello!  I'm here today to talk about modern software development in a biology
research lab.  You've probably heard horror stories about the kind of
spaghetti, write-only code that academic research produces, or even worse,
maybe you've looked at the BioPerl source code.¹  I'm here to tell you it
doesn't have to be that way!  This talk is my thoughts on software in science
based upon _my_ experience; your mileage may vary.

My name is Thomas Sibley, and I work in the Mullins Molecular Retrovirology Lab
at the University of Washington in Seattle.  Molecular retrovirology means we
look at viruses with RNA genomes, as opposed to DNA genomes, and the
interaction of these viruses with molecules in the cell.  [reasonable?]

The lab's been around for 23 years at UW and for 12 years before that at
Stanford and Harvard.  That's a lot of time to generate data!  Some of the
lab's ongoing projects span decades, with new data being collected from the
start until now.  The success of those projects is directly related to the
lab's ability to make sense of the data over time and not lose it to bit rot
and the frequent turnover of students and postdocs.

I've been working in the lab for going on four years now while I've helped
shepherd a large, legacy informatics application called Viroverse into the
modern age and kicked off several new projects.

When I first started, Viroverse was running on mod\_perl, using a homemade ORM
plus Class::DBI _and_ DBIx::Class, and version controlled in an unholy
combination of centralized CVS and personal Mercurial repositories.  Over about
a decade, various individuals had made their mark on the application.  After a
while you could pretty much tell who wrote what by how the code looked and
how well it functioned.

Most of the people in my position before me had come to the job with a
background primarily in biology not software.  The development practices that
had been used were _years_ behind current best practices.  Coming from an
open-source and commercial software background, I saw many opportunities for
modernization.  It was clear that many improvements in the field, from better
development tools to design practices to error handling to user experience,
simply hadn't reached the lab.

I don't attribute this to a lack of caring on the part of the folks before me.
Rather, I think for reasons ranging from the traditional funding structures in
science to the obtuseness of modern software stacks, that the advances in
software just hadn't _reached them yet_.

    ???
    The tech industry is busy building towers upon towers up in the clouds and
    putting software in everything from toothbrushes to toasters, and seemingly
    doesn't have the interest in seeing the tech we've had for a while put to
    more widespread use.

[Too paternalistic?]

...

[bridge directly to [a], or go through [b]?]

...

[a]

There's this idea in telecommunications that's been applied more generally to
providing any service: covering the "last mile" of distance, i.e. to someone's
home, is much harder than providing coverage up to that point.  It's this "last
mile" that necessitates your distribution network (physical or virtual) leaf
out immensely, seemingly immeasurably compared to more concentrated service
delivery points.

Mail services are a good example.  Every day the US Postal Service touches,
often _literally_, every mailbox in America.  USPS would be a much smaller
business if it just had to get mail to regional distribution centers or even
local post offices.  The difficulty and expense of bridging that "last mile" is
the reason why private mail carriers like UPS and FedEx, as they handled more
and more packages with the rise of online shopping, started using USPS for
final delivery.  USPS already had a "last mile" network because it's a much
older organization that had the mandate to do so.

...

[b]

**.
I think you can relate the concept of the "last mile" to the lack of
professional software developers practicing in the academic sciences.

To me, the bioinformatics problem shares similarities with the last mile
problem because it requires attention at the level of the individual lab.  You
can't service all the needs of most biology labs with standard analyses, or even
necessarily standard software.

> No project was identical, and we were surprised at how common one-off
> requests were. … Most researchers came to the bioinformatics core seeking
> customized analysis, not a standardized package.
>       —[Core services: Reward bioinformaticians](https://www.nature.com/news/core-services-reward-bioinformaticians-1.17251)

Now the same way the postal worker can deliver mail to many addresses in a day,
core facilities at universities and other research institutions can help
address the needs of multiple labs without putting a developer in each lab, as
long as the core can handle the workloads.  There are benefits to a developer
in every lab too such as avoiding the perils of consultants, but it's certainly
not required.
.**

...

The idea of the last mile is related to a quote you've undoubtedly heard
before:

> The future is already here — it's just not very evenly distributed.
>       —William Gibson

..."technologically rural" due to geographic, social, or economic disparaties...

....

**.
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
.**

...

Bioinformatics is a term so broad as to be almost meaningless, so I like to
instead think of it as "computers in biology".  At least then its scope is
obviously broad.

> In our service core, surprisingly, only 5% of the time was spent on pure
> bioinformatics — that is, developing new algorithms that merit their own
> publications. Although we put together tools and analysis pipelines in creative
> ways, nearly all of our time was spent on applied bioinformatics.
>       —[Core services: Reward bioinformaticians](https://www.nature.com/news/core-services-reward-bioinformaticians-1.17251)

...

Designing and building software like this is different than building a product
to your vision.  Research software must fit into the workflows that already
exist, by and large, outside of the computer and not dictate them.

You're modeling real-world steps that happen in experiments, things that
experiments produce, and actions that people perform.  You don't typically get
to decide what someone does at the bench, and so the challenges are different
from designing many software products or applications.

The software is in service to the science and scientific goals.  The job is to
save labor, not create it out of thin air by imposing new demands.  My
colleague Evan talks about this process of "building right up to the edges of
what researchers are already doing."  [photo of edges, something very close
together, a bridge or building]

The work I do can be broadly classified into a few categories: data
management, data surfacing [ick, better word for viz/querying/presenting
back], and data analysis.

    Maybe instead:
        Data usability (management, transformation, surfacing, analysis-ready)
            - relational databases to establish authoritative source
            - standard formats
                - GFF3 and BED for genome annotations
            - transform data in the way people want
                - tabular data, i.e. spreadsheets, sometimes "untidy" ones
                - Redash, a BI tool!
                    - labs are the original data-driven company
            - offer prepared analysis-ready datasets
                - some level of baseline analysis already done on the data
                  making basic metrics easily answerable via Excel or similar
                  non-programmatic tools
                - a jumping off point for further analysis
            - offer searchability and surfacing of related information ("Oh,
              that exists?  I had no idea, great!  Now I won't repeat work!")
                - faceted searching
                - patient chart
            - enable people to get at least basic data on their own rather
              than always going through a gatekeeper who can discuss and
              address their needs


Get data in front of people!  Its useless if moldering in your database.


        Process/workflow support and improvements
            - stickers
            - layout guides
            - instrument setup files
            - pipelines (semi- or fully-automated)

        Hypothesis generation, testing, and exploration

Methylation Station
    - transforms raw data into analysis-ready datasets
    - offers baseline level of viz
    - addresses pain points of previous workflows, but builds "up to edges" so
      that workflow steps outside of it are unaffected by its usage

Let me show you some examples:

* Data management out of notebooks
* examples in notes

These are all features that seem trivial, and though their is hidden complexity
I'm not mentioning, there were relatively straightforward software solutions.
Yet the impact on the tedious labor no longer required of the staff researchers
was outsized and appreciated immensely.  These sorts of efficiency gains are
everywhere in science because there isn't a broadly available workforce of
people who are proficient enough programmers to make their automation ideas
reality, or sometimes even realize it's possible in the first place.

**.
As we started making these gains, more lab members started asking if there was
a way to make some process they were doing faster or easier or less
error-prone.  This is what happens when developing _applied_ software rather
than software for _invented_ problems like, "How can my mug identify if I'm
drinking water or beer?"  [Vessyl pic]
.**

There are plenty of much thornier computational problems too, of course, ones
without straightforward solutions or well-bounded scopes or easy metrics of
success.



**.
Software for bench scientists is so close to the physical world that no
simplified, abstracted model of that world survives for very long before
needing to be revised.

Oh, you built a nice database for holding information about cell cultures in
96-well plates with one culture per well?  Congratulations!  Now revise it,
because Katie needs to upload data about cultures which were split into
multiple wells after 4 days and then continued growth under different treatment
conditions.

[more examples of that?  these seem ripe and useful]

Schemas that you can revise without much effort, or even scrap and rework
entirely while they're holding existing data, are the name of the game.
Nothing is certain in your schema except that it will have to change and adapt
to what the scientists want to throw at it this week.
.**


...

**.
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
.**


¹ Ok, that's a cheap shot!
