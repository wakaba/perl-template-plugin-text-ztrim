package Template::Plugin::Text::ZTrim;
use strict;
use warnings;
use Template::Plugin;
push our @ISA, qw(Template::Plugin);
use HTML::Trim;

sub new {
    my ($self, $context, @args) = @_;
    my $name = $args[0] || 'ztrim';
    $context->define_filter($name, sub {
        my ($string, $width) = @_;
        $width = $width * 2 || 60;
        return HTML::Trim::vtrim($string, $width, "...");
    }, 0);
    return $self;
}

1;

=head1 NAME

Template::Plugin::Text::ZTrim - "ztrim" TT plugin

=head1 SYNOPSIS

  [% USE Text.ZTrim %]
  [% long_long_long_text | ztrim(60) | html %]

=head1 AUTHOR

Wakaba <wakabatan@hatena.ne.jp>.

=head1 ACKNOWLEDGEMENTS

Thanks to the original authors of the code.

=head1 LICENSE

Copyright 2013 Hatena <http://www.hatena.ne.jp/company/>.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
