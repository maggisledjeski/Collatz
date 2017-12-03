package Number;

use warnings;
use strict;

sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

sub set_num {
    my $self = shift;
    my $num = shift;
    $self->{num} = $num;
}

sub set_steps {
    my $self = shift;
    my $steps = shift;
    $self->{steps} = $steps;
}

sub get_num {
    my $self = shift;
    return $self->{num};
}

sub get_steps {
    my $self = shift;
    return $self->{steps};
}
1;
