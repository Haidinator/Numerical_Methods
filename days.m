function [nd] = days(mo,da,leap)
%Determines the elapsed days in a year
%mo= the month [1:12]
%da= the day [1:31]
%leap=0 for non-leap year and 1 for leap year
months_year = [31 28 31 30 31 30 31 31 30 31 30 31]; 

if leap == 1
    nd = sum(months_year(1:mo-1))+da+1;
else
    nd = sum(months_year(1:mo-1))+da;
end