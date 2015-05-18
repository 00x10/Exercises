use strict;
use warnings;
use 5.010;

#USAGE perl grep.pl pattern

my $path = shift || '.';			#search for the pattern under current directory and directories below
my $pattern = $ARGV[0]; 			#pattern to be searched inside the files
my @lines;

sub SearchDir {
    my ($directory) = @_;
 
    if (-d $directory){
			opendir my $dh, $directory or die "Unable to enter the dir $dh:$!\n";
			while (my $file = readdir $dh) {
				next if $file eq '.' or $file eq '..';
					print "$directory/$file";					#prints file name
					if (-d $directory/$file){                  	#check if it is a directory
						&SearchDir("$directory/$file");
						next;
					}
					else{
						#open the file and search for the pattern
						open my $fh, '<', "$directory/$file" or die "Unable to open file $directory/$file :$!\n";
					
						while(my $line=<$fh>) 
							push @lines, $line if ($line =~ $pattern);
					}
					close($fh);
				
					#prints the line that matches the pattern
					print @lines;
					}
			}
			close $dh;
			return;
	}
	else {return;}
}

&SearchDir($path);