%let pgm=utl-importing-tables-from-excel-access-postgreSQL-mySQL-sqlServer-and-Oracle-without-sas-access;

%stop_submission;

Importing tables from excel access postgreSQL mySQL sqlServer and Oracle without sas access

SOAPBOX ON

Note this is possible calling poweshell from sas.
Note you cannot use macros utl_psbegin and  utl_psend.
You need to use macro utl_submitps64, because macros utl_psbegin and utl_psend
do not suppoer infile data, iw cards statement.

* Somthing like;
%macro accessx(
   database = pastgreSQL
  ,dbpath   = d:/sqlite/sqlite.db
  .table    = want
  ,password = password
  ,user     = roger
  .server   = server
  ,csv      = d:/csv/want.csv
  ) / des="export a sheet or table to a csv";
 ...
%mend accessx;

I think it is possible to get type information along with the csv?

DeepSeek AI
https://chat.deepseek.com/a/chat/s/ff418cff-05c9-47f8-a481-5f75a7dc48d1

which realtional database provide a one line CLI to convert a database table to a csv.
Like sqlite this CLI command in sqlite:
sqlite3 -header -csv "d:/sqlite/have.db"  "select * from students;" > "d:/csv/data.csv"

SOAPBOX OFF


POSTGRESSQL
===========

psql -d dbname -U username -c "\copy (SELECT * FROM table) TO 'path/to/output.csv' WITH CSV HEADER DELIMITER ',';"

MYSSQL
======
mysql -u username -p -e "SELECT * FROM db.table INTO OUTFILE '/path/to/output.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';"

SQL SERVER
==========
bcp "SELECT * FROM db.schema.table" queryout "output.csv" -c -t, -S server -U username -P password

ORACLE
======
sqlplus -s username/password@db @script.sql

EXCEL
====
perplexity query for excel
https://www.perplexity.ai/search/can-powershell-export-an-excel-bAZKEdENTMWojF13d8feiw
can powershell export an excel sheet to a csv

Covert this sheet to a csv file programaticall in SAS

/**************************************************************************************************************************/
/*  -------------------+                                                                                                  */
/*  | A1  |fx    | A   |                                                                                                  */
/*  -------------------------+                                                                                            */
/*  [_]|A |B |   |D|E| F | G |                                                                                            */
/*  -------------------------|                                                                                            */
/*   1 |F1|F2|rnk|X|Y|cum|cum|                                                                                            */
/*     |  |  |   | | |X  |Y  |                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   2 | A|B | 1 |1|2|1  | 2 |                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   3 | A|B | 2 |2|4|3  | 6 |                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   4 | A|B | 3 |3|6|6  | 12|                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   5 | A|C | 1 |1|7|1  | 7 |                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   6 | A|C | 2 |3|8|4  | 15|                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*   7 | A|C | 3 |5|9|9  | 24|                                                                                            */
/*   --|--+--+---+-+-+---+---|                                                                                            */
/*  [WANT]                                                                                                                */
/**************************************************************************************************************************/

%utl_psbegin;
parmcards4;
import-Excel -Path "d:\xls\wantxl.xlsx" -WorksheetName "want" | Export-Csv -Path "d:\csv\wantxl.csv" -NoTypeInformation;
;;;;
%utl_psend;

"F1","F2","RNK","X","Y","cum_x","cum_y"
"A","B","1","1","2","1","2"
"A","B","2","2","4","3","6"
"A","B","3","3","6","6","12"
"A","C","1","1","7","1","7"
"A","C","2","3","8","4","15"
"A","C","3","5","9","9","24"

MS ACCESS
=========
https://www.perplexity.ai/search/how-do-i-install-windos-oledb-qBsv6eoPTQOtxi.IeAg.GQ
requires OLEDB driver

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
