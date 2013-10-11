
use ExtUtils::MakeMaker;

WriteMakefile( 
	'VERSION_FROM' => 'rinetd.pl',
	'NAME' => 'rinetd.pl',
	'ABSTRACT' => 'tcp redirections server',
	'AUTHOR'   => 'David Muir Sharnoff <cpan@dave.sharnoff.org>',
	'dist' => { COMPRESS=>"gzip", SUFFIX=>"gz" },
	'PREREQ_PM'	=> {
		'File::Flock'	=> 0,
		'Pod::Usage'	=> 0,
		'IO::Event'	=> 0.809,
		'Daemon::Generic' => 0,
		'Net::Netmask'	=> 0,
		'File::Slurp'	=> 0,
	},
	'PM'	=> {
		'rinetd.pl'	=> '$(INST_LIBDIR)/IO/Event/rinetd.pm',
	},
	'EXE_FILES'     => ['rinetd.pl'],
	'META_MERGE'     => {
		resources  => {
			repository => 'http://github.com/muir/rinetd.pl',
		},
	},
);

package MY;

sub postamble {
    <<"END_OF_POSTAMBLE";

pm_to_blib: README

README: rinetd.pl
\tCOLUMNS=80 pod2text rinetd.pl >README

END_OF_POSTAMBLE
}

