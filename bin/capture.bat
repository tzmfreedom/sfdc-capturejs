set OUTPUT_DAT=profilelist.dat
set QUERY="SELECT id FROM Profile WHERE Name LIKE 'テスト%%'"
set USERNAME=%1
set PASSWORD=%2
set ENV=%3
coffee sample.coffee -u %USERNAME% -p %PASSWORD% -e %ENV% -q %QUERY%  | more +1 > %OUTPUT_DAT%
casperjs capture.coffee --un=%USERNAME% --pw=%PASSWORD% --env=%ENV% --infile=%OUTPUT_DAT%