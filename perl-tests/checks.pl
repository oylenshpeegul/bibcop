# (The MIT License)
#
# Copyright (c) 2022-2023 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

package bibcop;

use strict;
use warnings;

my $f = 'check_ascii';
check_passes($f, ('title' => "me \n and \r\t\n you"));
check_fails($f, ('title' => 'hello'));
check_fails($f, ('title' => 'привет'));

$f = 'check_typography';
check_fails($f, ('title' => 'A redundant space , before the comma'));
check_fails($f, ('title' => 'A redundant space . before the dot'));
check_fails($f, ('title' => 'A redundant space ; before the semi'));
check_fails($f, ('title' => 'A redundant space : before the colon'));
check_fails($f, ('title' => 'A redundant space ? before the question'));
check_fails($f, ('title' => 'A redundant space ! before the exclamation'));
check_fails($f, ('title' => 'A redundant space after the bracket ( hello)'));
check_fails($f, ('title' => 'A redundant space after the bracket [ hello]'));
check_fails($f, ('title' => 'A redundant space before the bracket (hello )'));
check_fails($f, ('title' => 'A redundant space before the bracket [hello ]'));
check_fails($f, ('title' => 'A missed space before the bracket[hello]'));
check_fails($f, ('title' => 'A missed space before the bracket(hello)'));
check_fails($f, ('title' => 'A missed space after the bracket [hello]you!'));
check_fails($f, ('title' => 'A missed space after the bracket (hello)you!'));
check_fails($f, ('title' => 'No spaces around the---triple dash'));
check_fails($f, ('title' => 'Not enough spaces around the--- triple dash'));
check_fails($f, ('title' => 'Not enough spaces around the ---triple dash'));
check_fails($f, ('title' => 'Spaces around the double -- dash are not allowed'));
check_passes($f, ('title' => 'Proper space before the {(bracket)}'));
check_passes($f, ('title' => '{No spaces after the last in the text closing (bracket)}'));
check_passes($f, ('title' => 'No spaces after the last in the text closing (bracket)'));
check_passes($f, ('title' => 'Proper placement of, with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of. with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of: with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of; with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of? with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of! with no space in front of it'));
check_passes($f, ('title' => 'Proper placement of --- with spaces around'));
check_passes($f, ('title' => 'Proper placement of--with no spaces around'));
check_passes($f, ('title' => 'Proper formatting of (brackets), with no space after it'));
check_passes($f, ('title' => 'Proper formatting of (brackets)! with no space after it'));
check_passes($f, ('title' => 'Proper formatting of (brackets). with no space after it'));
check_passes($f, ('title' => 'Proper formatting of (brackets)? with no space after it'));
check_passes($f, ('title' => 'Proper formatting of (brackets): with no space after it'));
check_passes($f, ('title' => 'Proper formatting of (brackets); with no space after it'));

$f = 'check_wrapping';
check_fails($f, ('title' => 'The title is not surrounded by curled brackets'));
check_passes($f, ('title' => '{This title is surrounded}'));

$f = 'check_shortenings';
check_fails($f, ('journal' => 'J. Log. Comp.'));
check_passes($f, ('booktitle' => 'Communications of the ACM'));

$f = 'check_author';
check_fails($f, ('author' => 'I'));
check_fails($f, ('author' => 'Donald E. Knuth'));
check_fails($f, ('author' => 'Knuth, Donald E'));
check_fails($f, ('author' => 'Knuth, Donald E. et al.'));
check_fails($f, ('author' => 'Monsalve Diaz, Jose M'));
check_passes($f, ('author' => 'Knuth'));
check_passes($f, ('author' => 'Knuth and others'));
check_passes($f, ('author' => 'Knuth and Duane'));
check_passes($f, ('author' => 'Knuth, Donald E.'));
check_passes($f, ('author' => 'Knuth, Donald E. and others'));
check_passes($f, ('author' => 'Knuth, Donald E. and Duane, Bibby'));
check_passes($f, ('author' => '{Some Weird Author} and {I}'));
check_passes($f, ('author' => '{\'A}lvarez, Carlos and Jim{\'e}nez-Gonz{\'a}lez, Daniel'));
check_passes($f, ('author' => 'Monsalve Diaz, Jose M.'));

$f = 'check_capitalization';
check_fails($f, ('title' => 'The TeX book'));
check_fails($f, ('title' => 'Data Flow Languages And Architecture'));
check_fails($f, ('title' => 'Object-oriented Programming'));
check_fails($f, ('title' => 'Cilk: an Efficient Multithreaded Runtime System'));
check_fails($f, ('title' => 'in the Database'));
check_passes($f, ('title' => 'The TeX Book'));
check_passes($f, ('title' => 'Data Flow Languages and Architecture'));
check_passes($f, ('title' => 'A Preliminary Architecture for a Basic Data-Flow Processor'));
check_passes($f, ('title' => 'Cilk: An Efficient Multithreaded Runtime System'));
check_passes($f, ('title' => 'Can Programming Be Liberated From the {von} Neumann Style? A Functional Style and Its Algebra of Programs'));

$f = 'check_year';
check_fails($f, ('year' => 'hello'));
check_fails($f, ('year' => '20019'));
check_fails($f, ('year' => '2009-2011'));
check_passes($f, ('year' => '{400 BC}'));
check_passes($f, ('year' => '2022'));
check_passes($f, ('year' => '1612'));

$f = 'check_pages';
check_fails($f, ('pages' => '1a'));
check_fails($f, ('pages' => '40A'));
check_fails($f, ('pages' => '10-24'));
check_fails($f, ('pages' => '32--32'));
check_fails($f, ('pages' => '32--12'));
check_passes($f, ('pages' => '123'));
check_passes($f, ('pages' => '42--43'));
check_passes($f, ('pages' => '89--100'));

$f = 'check_type_capitalization';
check_fails($f, (':type' => 'Article'));
check_passes($f, (':type' => 'article'));

$f = 'check_doi';
check_fails($f, ('doi' => 'hello, world!'));
check_passes($f, ('doi' => '10.1016/0743-7315(91)90016-3'));
check_passes($f, ('doi' => '10.1145/359576.359579'));

$f = 'check_arXiv';
check_fails($f, ('archiveprefix' => 'arXiv'));
check_fails($f, ('archiveprefix' => 'arXiv', 'eprint' => '2111.13384'));
check_fails($f, ('archiveprefix' => 'arXiv', 'eprint' => 'abc', 'primaryclass' => 'cs.PL'));
check_fails($f, ('archiveprefix' => 'arXiv', 'eprint' => '2111.13384', 'primaryclass' => 'hello'));
check_passes($f, ('archiveprefix' => 'arXiv', 'eprint' => '2112.13384', 'primaryclass' => 'cs.PL'));

$f = 'check_unescaped_symbols';
check_fails($f, ('title' => 'Story & Story'));
check_passes($f, ('title' => 'Story \& Story'));
check_passes($f, ('title' => 'Story {&} Story'));

sub check_fails {
  my ($f, %entry) = @_;
  no strict 'refs';
  my $error = $f->(%entry);
  if ($error eq '') {
    show_entry(%entry);
    print "$f reported no error here, why?\n";
    exit 1;
  }
}

sub check_passes {
  my ($f, %entry) = @_;
  no strict 'refs';
  my $error = $f->(%entry);
  if (defined $error and $error ne '') {
    show_entry(%entry);
    print "$error\n";
    print "$f reported an error here, why?\n";
    exit 1;
  }
}

1;