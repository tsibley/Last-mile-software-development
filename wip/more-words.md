Act I: The Last Mile
Act II: Improving the Situation
Act III: What did I learn?
Epilogue: Is this for you?


# Act II

    When I started in lab, it had been about a month since my predecessor had left.
    While we were able to talk once or twice, the hand off consisted mostly of
    sticky notes and passwords stuck to my new desk.

From day one, my goal was to improve the situation I found.  I didn't know much
about biology at the time, but I knew what rotten software smelled like.  The
name of the game was to throw out what was rotten and keep what was sound, then
build from there.  Since I didn't have a big picture of what the lab needed, I
hoped that by relentlessly improving the computing environment I would find
ways to help out everyone.

Progress was slow at first.  I spent about three weeks converting the mess of a
cvs repository to the best git repository I could manage.  More weeks were
spent improving the deployment infrastructure for the primary web application
so that I could deploy changes during working hours without accidentally eating
someone's data they were in the middle of inputting.  Gradually, tangible
improvements compounded and real progress was easier to make.  The results were
good enough to convince my boss, Jim, to let me hire a coworker to work
alongside me.  Since then, improvement's been much more rampant and together
we've been able to feasibly tackle larger projects.


Viroverse
    - reduce input burdens
    - put more data in front of people's eyes
        - sample pages
        - sequence naming
        - patient charts
        - cohort pages
        - searching

**.
TCozy
    - ground up, greenfield project
    - started small, adapted as we went
    - plate maps for instrument and setup guides for humans
    - had to respond to new needs on a weekly basis
    - stickers
.**

Methylation Station
    - "drop in software" to replace tedium


# Act III

## Enable people to use better practices

- Sequence names in Viroverse
- Searching made easier

## Data is useless if not in front of someone's eyes

Visibility is super important.

- Data tables
    - ICE Floe
    - Cohort pages
    - Sample pages
    - Redash
    - Summary tables

- Visualizations
    - Patient charts
    - Lab lines
    - Experiment comparisons
    - qPCR plots

## Removing tedium makes space for new ideas and improvements

What's deemed reasonable or even desireable to do changes once tedious tasks
vanish and people can think more creatively about the bigger picture.

## "Build just up to the edges"

Cell counts lesson
    - Widget is fancy and even included a keyboard interface designed for an external numpad
    - But what mattered was ease of use in the BL3
    - Two gloves on each hand, in gowns, goggles, and hair nets.  Goal is to
      get in and get out, not futz with software.  Nothing beats paper.

## YAGNI!

Bench scientists are really good at this.  Their job all day is to minimize
waste and maximize efficiencies in both their actual reactions and their
procedures for running experiments.

## If its not used, remove it!
### If it's barely used, make it unused! ;)

- Cross-lab experiment codes
- Really bad data loader

## Be comfortable with adapting your models

Schemas are the big one here, but it also applies to other models and
assumptions in your software.  all software makes simplifications about the
real world in order to make it tractable and understandable.  learn how to
start simple and grow more nuanced from there as the needs arise.

Don't rule out changes to your models.  Always consider if the problem is
easier if you first change your way of modeling it.  Don't let things calcify.

Ways of coping:
* JSON columns
* we use sqitch, it's pretty good most of the time.  better than anything else, like this:

	commit c3c755140031e1e8b80ece9a3c9b9bed992d503c
	Merge: f08d344 495fc2b
	Author: ████████ <███████@uw.edu>
	Date:   Wed Feb 9 23:36:37 2011 +0000

		Moving in Freezer System Whoo Hooo
		
		Requires the following DDL:
		
		begin transaction;
		CREATE SCHEMA freezer
		
		GRANT USAGE ON SCHEMA freezer TO viroverse_r;
		GRANT USAGE ON SCHEMA freezer TO viroverse_w;
		GRANT USAGE ON SCHEMA freezer TO pre;
		
		-- Table: freezer.freezer
		
		-- DROP TABLE freezer.freezer;
		
		CREATE TABLE freezer.freezer
		(
		  freezer_id serial NOT NULL,
		  "name" character varying(255) NOT NULL,
		  owning_scientist_id integer,
		  creating_scientist_id integer,


