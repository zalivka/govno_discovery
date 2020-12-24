csvgrep -c 6 -r [0,]{6} Google-Playstore.csv.csv | csvcut -c 2,4,6,1 | csvformat -D "|" > temp1.csv ;
cat temp1.csv | awk -F "|" 'BEGIN {link=""}
{
	if ($2 > 0 && $2 < 3.2) {
		link = $1
		print link"|"$2"|",$3"|",$4
	}
}' > temp2.csv;
csvlook -d "|" ./temp2.csv > output.md