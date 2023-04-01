PROC IMPORT 
OUT= SPY 
DATAFILE= "/home/u63343340/my_shared_file_links/xz400/Financial_analytics/Risk_return/SPY_12312020_3292022.csv" 
DBMS=CSV REPLACE;
GETNAMES=yes;
DATAROW=2; 
RUN;

PROC IMPORT 
OUT= TSLA
DATAFILE= "/home/u63343340/my_shared_file_links/xz400/Financial_analytics/Risk_return/TSLA.csv"
DBMS=CSV REPLACE;
GETNAMES=yes;
DATAROW=2; 
RUN;

/* sort by date */
proc sort data=SPY;
by date;
run;

proc sort data=TSLA;
by date;
run;

/*rename adjusted close column*/
data SPY;
set SPY;
rename 'Adj Close'n=adj_close;
run;

data TSLA;
set TSLA;
rename 'Adj Close'n=adj_close;
run;

/* get mean */
proc means data=SPY p10 p25 p90;
var adj_close;
run;

proc means data=TSLA p10 p25 p90;
var adj_close;
run;

/* mean std dev */
proc means data=SPY;
var adj_close;
run;

proc means data=TSLA;
var adj_close;
run;


/*requirement: return=p/lag(p). 
note this is saved as a whole percentage*/
data TSLA;
  set TSLA;
  TSLA_return_percentage=(adj_close/lag(adj_close)-1)*100;
RUN;

data SPY;
  set SPY;
  SPY_return_percentage=(adj_close/lag(adj_close)-1)*100;
RUN;

/*create variable=abs(x-xmean)
not sure how to store the mean in order to mke this calculation work

data TSLA;
set TSLA;
absmeandev=abs(TSLA_return_percentage-TSLA_return_mean);*/




