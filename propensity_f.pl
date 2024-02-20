#to find the propensity of an amino acid in an alpha-helix
$directory = 'C:\Users\LENOVO\Desktop\M.Sc. Clg\Assignments\SB\Practical 4';
opendir (DIR, $directory) or die "File not found,$!";
while ($file = readdir DIR)
{
	if ($file=~/.pdb$/)
	{
		push @name,$file;		
	}
}
foreach $n(@name)
{
	open (F, $n);
	{
		%per_db=();
		while($line=<F>)
		{
		if($line=~/(^SEQRES).*([0-9]{3}) (.*)....\s/)
		{	
		chomp($j=$3);
		@j=split/ /,$j;
		push(@b,@j);
		} 
		}		
	}
	close(F);				
}
	
print "@b\n";
$l = @b;
print"Length = $l\n;";
$last=$#b;	

%per_helix=();
foreach $n(@name)
{
	open (F, $n);
	{
		
		while ($line=<F>)
		{
			if($line=~/^HELIX   ..  .. (...) .  ...  (...) .  ...  .                                  (..).*/)
			{

				
				for($i=0;$i<=$last;$i++)
				{
					
					if ($b[$i] eq $1)
					{
						
						if($b[$i+$3-1] eq $2)
						{
						 for($m=$i;$m<=$i+$3-1;$m++)
						 {
						 	push (@helix,$b[$m]);
						 	$h++;
						 	
						 }
						 last;
						}
					}
				}	
				}
			 }
			}
			
		
	close(F);
}
foreach $aa(@b)
{
	$per_db{$aa}++;
}
foreach $k(keys%per_db)
{
	print "$k = $per_db{$k}\n";
}
print"@helix\n";
$ht=@helix;
print"$l1\n";
foreach $hh(@helix)
{
	$per_helix{$hh}++;
}
foreach $q(keys%per_helix)
{
	print "$q = $per_helix{$q}\n";
}
chomp($input=<>);
if (exists($per_helix{$input}))
{
	print "$per_helix{$input}\n";
	$ha= $per_helix{$input};
}
if (exists($per_db{$input}))
{
	print"$per_db{$input}\n";
	$seqt=$per_db{$input};
}
$propensity=($ha/$ht)/($seqt/$l);
print "Propensity = $propensity\n";
