open(FH,"Celtic_linkageMap-SI-GM3_checked_onlyLGs.fa.2.7.7.80.10.30.500.dat");

my $lg="0";
my $i=0;

while(<FH>){
 chomp $_;
 if($_=~/^Sequence: .*/){
        $lg=$_; $lg=~s/Sequence: //g;
        $lg=~s/gadMor2.1_//g;
        #print "$lg\n";
        $i=0;
        }
if($_=~/^[0-9]/){
 my @array=split /\s/,$_;
 if($array[2] >10 ){  ## REPAEAT IS MORE THAN 6bp and the seq len >100
 #if($array[2] >100 && $array[3] >1) { #atleast repeated twice
        my $count_A = length( $array[14] =~ s/[^\QA\E]//rg );
        my $count_T = length( $array[14] =~ s/[^\QT\E]//rg );
        my $count_G = length( $array[14] =~ s/[^\QG\E]//rg );
        my $count_C = length( $array[14] =~ s/[^\QC\E]//rg );
        my $A_per=sprintf('%.02f',($count_A/length ($array[14]))*100);
        my $T_per=sprintf('%.02f',($count_T/length ($array[14]))*100);
        my $G_per=sprintf('%.02f',($count_G/length ($array[14]))*100);
        my $C_per=sprintf('%.02f',($count_C/length ($array[14]))*100);
        $i++;
        #print "$lg\t$array[0]\t$array[12]\t$i\n";
        #print "$lg\t$array[1]\t$array[12]\t$i\n";
        #print "$lg\t$array[13]\n";
        if($A_per >30 && $T_per >30){ # CENTROMERE is mostly AT rich so choose mainly those reads
                #$lg=~s/gadMor2.1_//g;
                #print "$lg\t$array[0]\t$i\n";
                #print "$lg\t$array[1]\t$i\n";
                #print ">$lg\_$array[0]_$array[1]_$A_per-$T_per-$G_per-$C_per\n$array[14]\n";
                print "$lg\t$array[13]\n";
              }
        }
 }
}
