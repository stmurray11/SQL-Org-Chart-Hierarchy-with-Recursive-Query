# SQL-Org-Chart-Hierarchy-with-Recursive-Query

Systems commonly use a link table to match supervisor and subordinate.
If you are tasked to display an org chart in the front end, you can offload the hierachy calculation 
to SQL Server via a recursive query.

The recusive query returns the column below in the result set, and you can see that

3 people report to Scott Murray,

one of them has their own report,

and 1 person reports to Wilder Keaton.

These results can easily be tranlated into an HMTL table, with no calculation.

 
[Hierarchy Column Result]

Anna Chapman

Joe Less

Scott Murray

Scott Murray...Henry Jones

Scott Murray...Henry Jones...Bill Friday

Scott Murray...Joe Henry

Scott Murray...Lanny Turnip

Wilder Keaton

Wilder Keaton...Turner Buck
 
