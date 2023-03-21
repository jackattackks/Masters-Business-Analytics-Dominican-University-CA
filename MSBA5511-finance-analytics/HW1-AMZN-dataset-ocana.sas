PROC IMPORT 
OUT= AMZN 
DATAFILE= "/home/u63343340/my_shared_file_links/xz400/Financial_analytics/Risk_return/AMZN.csv" 
DBMS=CSV REPLACE;
GETNAMES=yes;
DATAROW=2; 
RUN;

/*rename adjusted close column*/
data AMZN;
set AMZN;
rename 'Adj Close'n=adj_close;
run;

/* sort by date */
proc sort data=AMZN;
by date;
run;

/*calculate AMZN stock return. return (t)=[price (t)/Price(t-1)]-1*/
data AMZN;
  set AMZN;
  amzn_return=adj_close/lag(adj_close)-1;
RUN;

/* return all stats */

proc univariate data=AMZN;
var adj_close;
run;

/* mean standadrd deviation of adjusted close*/
proc means data=AMZN;
var adj_close;
run;

/* Median */
proc means data=AMZN median;
var adj_close;
run;

/* mode */
proc means data=AMZN mode;
var adj_close;
run;

/* histogram */
proc gchart data=AMZN;
vbar adj_close;
run;

/*percentile by either proc means or proc univariate*/
proc means data=AMZN p10 p25 p90;
var adj_close;
run;

