# Script that extracts only records from 2007-02-01 to 2007-02-02
# Run with the following command
# > gawk -f extract.gawk household_power_consumption.txt
BEGIN {FS = ";"}
{
	if (NR == 1) print
	if ($1 ~ /^1\/2\/2007/ || $1 ~ /^2\/2\/2007/) print
}