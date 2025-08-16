# Rails-based Election Hosting System

This is a proof of concept for an election hosting web app that allows users to create elections, configure ballots, and tally votes in real time. 

There are two types of user:

1. The **election hosts** (authenticated) have access to create elections, assign participants to elections, and make ballots. Each ballot can have multiple votes, a configurable number of selections, and particular counting rules (currently divided into the rough categories of single and multiple round voting). When ballots are ready, they can send them to the participants.

2. The **participants** (unauthenticated) follow a uuid-based url to view their ballot and make their vote. When they are done, the election hosts can automatically tally the results. 
