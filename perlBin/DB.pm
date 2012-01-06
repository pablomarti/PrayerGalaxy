package DB;

use strict;
use warnings;
use DBI;

sub new{
	my ($class) = shift;
   	my $self = {};
	bless $self, $class;
	$self->{_connected} = 0;
	connectDataBase($self);
	
	return $self;
}


sub connectDataBase{
	my $self = shift;
	disconnectDataBase($self);
	$self->{_connected} = 1;
	$self->{_db} = DBI->connect("DBI:mysql:prayergalaxy", "root", "welcome") or $self->{_connected} = 0;
	if($self->{_connected}){
		$self->{_db}->do("USE prayergalaxy;") or die "Error in DataBase Manager: " . $self->{_db}->errstr . "\n";
	}
}


sub query{
	my ($self, $qry) = @_;
	my $query = $self->{_db}->prepare($qry) or die "Error in DataBase Manager: " . $self->{_db}->errstr . "\n";
	$query->execute() or die "Cause: " . $query->errstr . "\n";
	return $query;
}


sub prepare{
	my ($self, $qry) = @_;
	my $query = $self->{_db}->prepare($qry) or die "Error in DataBase Manager: " . $self->{_db}->errstr . "\n";
	return $query;
}


sub do{
	my ($self, $qry) = @_;
	my $sTry = 0;
	$self->{_db}->do($qry) or $sTry++;
	if($sTry){
		$self->{_db}->do($qry) or $sTry++;
		if($sTry){
			$self->{_db}->do($qry) or die "Error in DataBase Manager: " . $self->{_db}->errstr . ": $qry\n";
		}
	}
}


sub disconnectDataBase{
	my $self = shift;
	if($self->{_connected}){
		$self->{_db}->disconnect();
		$self->{_connected} = 0;
	}
}


sub DESTROY{
	my $self = shift;
	disconnectDataBase($self);	
	$self = undef;
}


 1;