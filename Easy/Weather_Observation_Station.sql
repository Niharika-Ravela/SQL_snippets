SELECT DISTINCT CITY FROM STATION WHERE CITY NOT LIKE '[AEIOU]%' AND CITY NOT LIKE '%[AEIOU]';


"Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.
Input Format
The STATION table has 
  ID - Number
  City - Varchar
  State - Varchar
  Lat_N - Number
  Long_W - Number
where LAT_N is the northern latitude and LONG_W is the western longitude.
