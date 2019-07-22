%% ut-thesis.cls -- document class for graduate theses at UofT
%%
%% Copyright (c) 1998-2013 Francois Pitt <fpitt@cs.utoronto.ca>
%% last updated at 16:18 (EDT) on Wed 25 Sep 2013
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.
%% The latest version of this license is in
%%     http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%%
%% The Current Maintainer of this work is
%% Francois Pitt <fpitt@cs.utoronto.ca>.
%%
%% This work consists of the files listed in the accompanying README.

%% USAGE:  \documentclass{ut-thesis}
%%         \documentclass[...options...]{ut-thesis}
%%
%% The default settings produce a final copy, ready for submission to
%% the School of Graduate Studies (SGS) at the University of Toronto:
%% single-sided, "normal" margins (see below), one-and-a-half spaced
%% with single-spaced notes.
%%
%% OPTIONS:
%%
%%  - Any standard option for the LaTeX2e `report' class, including
%%    `10pt', `11pt', `12pt', `oneside', `twoside', etc.
%%
%%  - `narrowmargins', `normalmargins', `widemargins', or
%%    `extrawidemargins':  Set the size of the margins, as follows:
%%     . `narrow': 1 1/4" on the left, 3/4" on all other sides,
%%       headers & footers 3/8" from body
%%       (these are the minimum values required by SGS);
%%     . `normal': 1 1/4" on the left, 1" on all other sides,
%%       headers & footers 1/2" from body;
%%     . `wide': 1 1/4" on all sides,
%%       headers & footers 5/8" from body;
%%     . `extrawide': 1 1/2" on all sides,
%%       headers & footers 3/4" from body.
%%    If you have more than just a few marginal notes, it is recommended
%%    that you use at least `wide' margins.  For other settings, use the
%%    \geometry command (see the template for details).
%%
%%  - `singlespaced', `oneandahalfspaced', or `doublespaced':  Set the
%%    entire document's default line spacing (except for notes, which
%%    are single-spaced by default).  For other settings, use the
%%    \setstretch command (see the template for details).
%%
%%  - `singlespacednotes' or `standardspacednotes':  Set line spacing
%%    for footnotes and marginal notes: either single-spaced or the same
%%    as the rest of the document.
%%
%%  - `cleardoublepagestyleempty', `cleardoublepagestyleplain', or
%%    `cleardoublepagestylestandard':  Set the page style for all
%%    "cleared" pages (empty pages inserted in two-sided documents to
%%    put the next page on the right-hand side) to either `empty',
%%    `plain', or whatever style is in effect when the page is cleared
%%    (the default).
%%
%%  - `draft':  Produce a draft copy (double-sided, double-spaced,
%%    normal margins, with the word "DRAFT" printed at all four corners
%%    of every page).
%%
%% Note that these options can be used to override the default or draft
%% document settings, so that it is possible, for example, to create a
%% double-sided final copy, or a 1 1/2-spaced draft copy with wide
%% margins, etc.  You may use standard LaTeX packages to tailor the
%% layout and formatting in other ways.
%% Also note that when producing double-sided documents while _not_ in
%% draft mode, new chapters and preliminary sections will always start
%% on a right-hand page under the default settings (inserting a blank
%% page if needed).  This can be overridden by using the `openany' or
%% `openright' options.  To achieve this effect for individual sections
%% or chapters, use \cleardoublepage -- or one of the more specific
%% \clearemptydoublepage, \clearplaindoublepage, \clearthesisdoublepage,
%% or \clearstandarddoublepage (see below for details).
%%
%% NEW ENVIRONMENTS and COMMANDS:
%%
%%  * \degree{...}:  (preamble only; REQUIRED)
%%    Specify the name of the degree (e.g., "Doctor of Philosophy").
%%
%%  * \department{...}:  (preamble only; REQUIRED)
%%    Specify the name of the graduate department.
%%
%%  * \gradyear{...}:  (preamble only; REQUIRED)
%%    Specify the year of graduation (defaults to current year).
%%
%%  * \author{...}:  (preamble only; REQUIRED)
%%    Specify the name of the author.
%%
%%  * \title{...}:  (preamble only; REQUIRED)
%%    Specify the title of the thesis.
%%
%%  - \begin{preliminary}...\end{preliminary}:
%%    Delimit head matter (title page, abstract, table of contents,
%%    lists of tables and figures, etc.): set the page style and
%%    numbering for the preliminary sections and reset them for the main
%%    document.
%%
%%     - \maketitle:
%%       Generate the title page from the information supplied in the
%%       preamble.
%%
%%     - \begin{abstract}...\end{abstract}:
%%       Generate the abstract page, double-sided.  (According to SGS
%%       guidelines, this must immediately follow the title page.)
%%
%%     - \begin{dedication}...\end{dedication}:
%%       Generate a dedication section, if needed (just a paragraph
%%       formatted flush right).
%%
%%     - \begin{acknowledgements}...\end{acknowledgements}:
%%       Generate an acknowledgements section, if needed.
%%
%%    Note that neither the `dedication' nor the `acknowledgements' are
%%    put on a separate page by default (use \newpage to do this
%%    explicitly).  Also note that the table of contents, list of
%%    tables, and list of figures can be generated using the usual LaTeX
%%    commands.
%%
%%  - \begin{longquote}...\end{longquote}:
%%    Single-spaced version of the `quote' environment.
%%
%%  - \begin{longquotation}...\end{longquotation}:
%%    Single-spaced version of the `quotation' environment.
%%
%%  - \clearemptydoublepage, \clearplaindoublepage,
%%    \clearthesisdoublepage:
%%    Same as \cleardoublepage except that cleared pages have style
%%    `empty', `plain', or `thesis' respectively.
%%
%%  - \clearstandarddoublepage:
%%    Same as the original \cleardoublepage (cleared pages use the style
%%    currently in effect) -- used to override the effects of options
%%    `cleardoublepagestyleempty' or `cleardoublepagestyleplain'.
%%
%% The companion file `ut-thesis.tex' contains a skeleton illustrating
%% the use of this class.


%%%%%%%%%%%%        IDENTIFICATION        %%%%%%%%%%%%

\newcommand*{\utthesisversion}{v2.0} % current version number
\newcommand*{\utthesisupdated}{2012/06/01} % date of last change(s)

\NeedsTeXFormat{LaTeX2e}[1995/12/01] % robust macros with * form
\ProvidesClass{ut-thesis-aastex}[\utthesisupdated\space\utthesisversion\space
   graduate theses at the University of Toronto]


%%%%%%%%%%%%         INITIAL CODE         %%%%%%%%%%%%

%% Switch for testing draft mode (toggled by `draft' option).
\newif\if@draft
\@draftfalse

%% Switch for testing current page style.
\newif\if@thesispagestyle
\@thesispagestyletrue

%% Save original definitions of footnote and marginal note macros and
%% lengths, to be able to reset them below as needed (when changing
%% between single-spaced and standard-spaced notes).
\let\@thesis@footnotetext\@footnotetext
\let\@thesis@mpfootnotetext\@mpfootnotetext
\let\@thesis@marginparreset\@marginparreset
\newlength{\@thesisfootnotesep}
\newlength{\@thesismarginparpush}
\AtBeginDocument
  {\setlength\@thesisfootnotesep{\footnotesep}
   \setlength\@thesismarginparpush{\marginparpush}}

%% Save original definition of \cleardoublepage.
\let\clearstandarddoublepage\cleardoublepage

%% The \singlespacing macro from `setspace' includes some vertical space
%% (to make it easier to change line spacing within the document).
%% Unfortunately, this has undesirable side-effects within macros, so we
%% define our own replacement here for use within the class.
\newcommand*{\singlespacingnoskip}{\setstretch{\setspace@singlespace}}


%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%

%% `draft' option: change default document settings.
\DeclareOption{draft}{\@drafttrue
   \newcommand*{\tlDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\trDRAFT}%
     {\raisebox{ 3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \newcommand*{\blDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand*{\brDRAFT}%
     {\raisebox{-3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \ExecuteOptions{doublespaced}
   \PassOptionsToClass{draft,twoside,openany}{report}}

%% Margin options.
\DeclareOption{narrowmargins}{\AtEndOfClass % 1 1/4" left, 3/4" others
  {\geometry{margin=.75in,left=1.25in,headsep=.375in-\headheight,
             footskip=.375in,marginparwidth=.5in,marginparsep=.125in}}}
\DeclareOption{normalmargins}{\AtEndOfClass % 1 1/4" left, 1" others
  {\geometry{margin=1in,left=1.25in,headsep=.5in-\headheight,
             footskip=.5in,marginparwidth=.75in,marginparsep=.125in}}}
\DeclareOption{widemargins}{\AtEndOfClass % 1 1/4" all around
  {\geometry{margin=1.25in,headsep=.625in-\headheight,
             footskip=.625in,marginparwidth=.75in,marginparsep=.25in}}}
\DeclareOption{extrawidemargins}{\AtEndOfClass % 1 1/2" all around
  {\geometry{margin=1.5in,headsep=.75in-\headheight,
             footskip=.75in,marginparwidth=1in,marginparsep=.25in}}}

%% Line Spacing options.
\DeclareOption{singlespaced}{\AtEndOfClass{\singlespacingnoskip}}
\DeclareOption{onehalfspaced}{\AtEndOfClass{\onehalfspacing}}
\DeclareOption{doublespaced}{\AtEndOfClass{\doublespacing}}

%% Line spacing for notes.
\DeclareOption{singlespacednotes}{\AtBeginDocument
  {\setlength\footnotesep{\@thesisfootnotesep}
   \setlength\marginparpush{\@thesismarginparpush}
   \renewcommand{\@footnotetext}[1]%
     {\@thesis@footnotetext{#1\singlespacingnoskip}}
   \renewcommand{\@mpfootnotetext}[1]%
     {\@thesis@mpfootnotetext{#1\singlespacingnoskip}}
   \renewcommand*{\@marginparreset}%
     {\@thesis@marginparreset\singlespacingnoskip}}}
\DeclareOption{standardspacednotes}{\AtBeginDocument
  {\setlength\footnotesep{\baselineskip-\@thesisfootnotesep}
   \setlength\marginparpush{\baselineskip-\@thesismarginparpush}
   \let\@footnotetext\@thesis@footnotetext
   \let\@mpfootnotetext\@thesis@mpfootnotetext
   \let\@marginparreset\@thesis@marginparreset}}

%% Page styles for cleared pages.
\DeclareOption{cleardoublepagestyleempty}
  {\AtEndOfClass{\let\cleardoublepage\clearemptydoublepage}}
\DeclareOption{cleardoublepagestyleplain}
  {\AtEndOfClass{\let\cleardoublepage\clearplaindoublepage}}
\DeclareOption{cleardoublepagestylestandard}
  {\AtEndOfClass{\let\cleardoublepage\clearstandarddoublepage}}

%% All other options are passed to the base class directly.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


%%%%%%%%%%%%       OPTION EXECUTION       %%%%%%%%%%%%

%% Default settings: standard options followed by ut-thesis options.
\ExecuteOptions{letterpaper,oneside,openright}
\ExecuteOptions{normalmargins,onehalfspaced,singlespacednotes}

%% Process options.
\ProcessOptions


%%%%%%%%%%%%       PACKAGE  LOADING       %%%%%%%%%%%%

%% Load base class using current setting for basic options.
\LoadClass{report}

%% To set/change page layout.
\RequirePackage{calc}
\RequirePackage{geometry}

%% To set/change line spacing.
\RequirePackage{setspace}

\usepackage{hyperref}
\usepackage{natbib}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb}


%%%%%%%%%%%%          MAIN  CODE          %%%%%%%%%%%%

%%%%%%    Parameters

%% The following five commands set the respective field values so we can
%% generate the title page and abstract page automatically.
\newcommand*{\degree}[1]%
  {\ifx\empty#1\empty\else\gdef\@degree{#1}\fi}
\newcommand*{\department}[1]%
  {\ifx\empty#1\empty\else\gdef\@department{#1}\fi}
\newcommand*{\gradyear}[1]%
  {\ifx\empty#1\empty\else\gdef\@gradyear{#1}\fi}
\renewcommand*{\author}[1]%
  {\ifx\empty#1\empty\else\gdef\@author{#1}\fi}
\renewcommand*{\title}[1]%
  {\ifx\empty#1\empty\else\gdef\@title{#1}\fi}

%% Default values for the required fields.
\degree{\emph{(degree)}}
\department{\emph{(department)}}
\gradyear{\emph{(year of graduation)}}
\author{\emph{(author)}}
\title{\emph{(title)}}

%%%%%%    New formatting environments and commands.

%% \begin{preliminary} sets the pagestyle and page numbering for the
%% preliminary sections; \end{preliminary} resets the page numbering.
%% The default page style is used outside of the preliminary block.
\newenvironment*{preliminary}%
  {\pagestyle{plain}\pagenumbering{roman}}%
  {\cleardoublepage\pagenumbering{arabic}}

%% Change \maketitle to follow SGS guidelines.
\renewcommand*{\maketitle}%
  {\begin{titlepage}
   \large\singlespacingnoskip
   \begin{center}
      \mbox{}
      \vfill
      \textsc{\@title}\\
      \vfill
      by \\
      \vfill
      {\@author}\\
      \vfill
      \vfill
      A thesis submitted in conformity with the requirements\\
      for the degree of {\@degree}\\
      Graduate Department of {\@department}\\
      University of Toronto\\
      \vfill
      {\copyright} Copyright {\@gradyear} by {\@author}\\
      \vspace{.01\textheight}
      \mbox{}
   \end{center}
   \setcounter{page}{1}
   \end{titlepage}
   \setcounter{page}{2}}

%% Change \begin{abstract}...\end{abstract} to follow SGS guidelines.
\renewenvironment*{abstract}%
  {\begin{center}
      \section*{Abstract}
   \end{center}
   \begin{center}
      {\@title}\\[2ex]
      {\@author}\\
      {\@degree}\\
      Graduate Department of {\@department}\\
      University of Toronto\\
      {\@gradyear}\\
   \end{center}
   \begingroup
   %% Adjust line spacing: if it was less than 2, increase it to 2;
   %% otherwise, leave it as is.
   \ifdim \baselinestretch pt < 1.6pt \doublespacing\fi}%
  {\par\endgroup\newpage}

%% \begin{dedication}...\end{dedication} formats a dedication section
%% (*not* on a separate page -- just a paragraph formatted flush right).
\newenvironment*{dedication}%
  {\begin{flushright}}%
  {\end{flushright}}

%% \begin{acknowledgements}...\end{acknowledgements} formats an
%% acknowledgements section (*not* on a separate page).
\newenvironment*{acknowledgements}%
  {\begin{center}
      \section*{Acknowledgements}
   \end{center}
   \begingroup\noindent}%
  {\par\endgroup}

%% Redefine `thebibliography' environment so that it generates headers
%% in the same style as the rest of the document.
\let\@thesisthebibliography\thebibliography
\renewcommand*{\thebibliography}[1]{\@thesisthebibliography{#1}
   \if@thesispagestyle\@mkboth{\textsc{\bibname}}{\textsc{\bibname}}\fi}

%% Variations of \cleardoublepage that explicitly set the pagestyle of
%% any inserted blank page.
\newcommand*{\clearemptydoublepage}%
  {{\pagestyle{empty}\clearstandarddoublepage}}
\newcommand*{\clearplaindoublepage}%
  {{\pagestyle{plain}\clearstandarddoublepage}}
\newcommand*{\clearthesisdoublepage}%
  {{\pagestyle{thesis}\clearstandarddoublepage}}

%% Single-spaced quotes and quotations.
\newenvironment*{longquote}%
  {\begin{quote}\singlespacingnoskip}{\end{quote}}
\newenvironment*{longquotation}%
  {\begin{quotation}\singlespacingnoskip}{\end{quotation}}

%%%%%%    Page Styles

%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in `report', so that they
%% conform to the SGS guidelines (and include draft information if
%% applicable).  Then, define a new pagestyle `thesis'.

%% TODO: Get rid of copy-pasted definitions for pagestyles?

%% Pagestyle `empty'.
\renewcommand*{\ps@empty}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle `plain'.
\renewcommand*{\ps@plain}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead}

%% Pagestyle `headings'.
\if@twoside % two-sided printing
\renewcommand*{\ps@headings}%
  {\@thesispagestylefalse
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth
      {\MakeUppercase{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\MakeUppercase{\ifnum \c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}}
\else % one-sided printing
\renewcommand*{\ps@headings}%
  {\@thesispagestylefalse
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\MakeUppercase{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi%@twoside

%% Pagestyle `myheadings'.
\renewcommand*{\ps@myheadings}%
  {\@thesispagestylefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \let\chaptermark\@gobble\let\sectionmark\@gobble}

%% Pagestyle `thesis' (based on `headings').
\if@twoside % two-sided printing
\newcommand*{\ps@thesis}%
  {\@thesispagestyletrue
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth
      {\textsc{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\textsc{\ifnum \c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}}
\else % one-sided printing
\newcommand*{\ps@thesis}%
  {\@thesispagestyletrue
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\textsc{\ifnum \c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi%@twoside

%% Default page style.
\pagestyle{thesis}

%% Commands from aastex.cls:

% This has been redefined below
%\newcommand\dataset{\@testopt\@dataset{[}}%
%\def\@dataset[#1]#2{#2}%

\newcommand\facility{\@testopt\@facility{[}}%
\def\@facility[#1]#2{{\vskip6pt{\large\it Facility:} #2}}%

\newcommand\facilities{\@testopt\@facilities{[}}%
\def\@facilities[#1]#2{{\vskip6pt{\large\it Facilities:} #2}}%


\long\def\software{\bgroup\@testopt \@software {[}}
\def\@software[#1]#2{\vskip 6pt{
\frenchspacing
\iftwelvepoint
\font\foo=cmr12
\else
\font\foo=cmr10\fi
%%
\fontdimen2\foo=3pt %% Changed from 1.5pt to 3pt, March12, 2019
%%
{\large \it Software: }
#2
%% returning to original fontdimen
\iftwelvepoint
\fontdimen2\foo=3.91663pt
\else
\fontdimen2\foo=3.33333pt
\fi
}\egroup}





\newcommand\object{\@testopt\@object{[}}%
\def\@object[#1]#2{#2}%
\newcommand\objectname{\@testopt\@objectname{[]}}% 
\def\@objectname[#1]#2{#2}% 
\newlength{\plot@width}
\def\eps@scaling{1.0}% 
\newcommand\epsscale[1]{\def\eps@scaling{#1}}% 
\newcommand\plotone[1]{% 
 \centering 
 \leavevmode 
 \setlength{\plot@width}{0.85\linewidth}
 \includegraphics[width={\eps@scaling\plot@width}]{#1}% 
}% 
\newcommand\plottwo[2]{% 
 \centering 
 \leavevmode 
 \setlength{\plot@width}{0.425\linewidth}
 \includegraphics[width={\eps@scaling\plot@width}]{#1}% 
 \hfil 
 \includegraphics[width={\eps@scaling\plot@width}]{#2}% 
}% 
\newcommand\plotfiddle[7]{% 
 \centering 
 \leavevmode 
 \vbox\@to#2{\rule{\z@}{#2}}% 
 \includegraphics[% 
  scale=#4, 
  angle=#3, 
  origin=c 
 ]{#1}% 
}% 
\newcommand\figurenum[1]{% 
 \def\thefigure{#1}% 
 \let\@currentlabel\thefigure 
 \addtocounter{figure}{\m@ne}% 
}% 

\newcommand\phn{\phantom{0}}% 
\newcommand\phd{\phantom{.}}% 
\newcommand\phs{\phantom{$-$}}% 
\newcommand\phm[1]{\phantom{#1}}% 
\let\la=\lesssim            % For Springer A&A compliance... 
\let\ga=\gtrsim 
\newcommand\sq{\mbox{\rlap{$\sqcap$}$\sqcup$}}% 
\newcommand\arcdeg{\mbox{$^\circ$}}% 
\newcommand\arcmin{\mbox{$^\prime$}}% 
\newcommand\arcsec{\mbox{$^{\prime\prime}$}}% 
\newcommand\fd{\mbox{$.\!\!^{\mathrm d}$}}% 
\newcommand\fh{\mbox{$.\!\!^{\mathrm h}$}}% 
\newcommand\fm{\mbox{$.\!\!^{\mathrm m}$}}% 
\newcommand\fs{\mbox{$.\!\!^{\mathrm s}$}}% 
\newcommand\fdg{\mbox{$.\!\!^\circ$}}% 
\newcommand\farcm@mss{\mbox{$.\mkern-4mu^\prime$}}% 
\let\farcm\farcm@mss 
\newcommand\farcs@mss{\mbox{$.\!\!^{\prime\prime}$}}% 
\let\farcs\farcs@mss 
\newcommand\fp{\mbox{$.\!\!^{\scriptscriptstyle\mathrm p}$}}% 
\newcommand\micron{\mbox{$\mu$m}}% 
\def\farcm@apj{% 
 \mbox{.\kern -0.7ex\raisebox{.9ex}{\scriptsize$\prime$}}% 
}% 
\def\farcs@apj{% 
 \mbox{% 
  \kern  0.13ex.% 
  \kern -0.95ex\raisebox{.9ex}{\scriptsize$\prime\prime$}% 
  \kern -0.1ex% 
 }% 
}% 
 

\newcommand\ion[2]{#1$\;${%
\ifx\@currsize\normalsize\small \else
\ifx\@currsize\small\footnotesize \else
\ifx\@currsize\footnotesize\scriptsize \else
\ifx\@currsize\scriptsize\tiny \else
\ifx\@currsize\large\normalsize \else
\ifx\@currsize\Large\large
\fi\fi\fi\fi\fi\fi
\rmfamily\@Roman{#2}}\relax}% 

\newcommand\case[2]{\mbox{$\frac{#1}{#2}$}}% 
\newcommand\slantfrac{\case}% 
\newcommand\onehalf{\slantfrac{1}{2}}% 
\newcommand\onethird{\slantfrac{1}{3}}% 
\newcommand\twothirds{\slantfrac{2}{3}}% 
\newcommand\onequarter{\slantfrac{1}{4}}% 
\newcommand\threequarters{\slantfrac{3}{4}}% 
\newcommand\ubvr{\mbox{$U\!BV\!R$}}%% UBVR system 
\newcommand\ub{\mbox{$U\!-\!B$}}%   % U-B 
\newcommand\bv{\mbox{$B\!-\!V$}}%   % B-V 
\newcommand\vr{\mbox{$V\!-\!R$}}%   % V-R 
\newcommand\ur{\mbox{$U\!-\!R$}}%   % U-R 

%% need this change so that it works correctly in tables:
{\catcode`\$=\active
\gdef\nodata{ ~$\cdots$~ }}% 

\newcommand\diameter{\ooalign{\hfil/\hfil\crcr\mathhexbox20D}}% 
\newcommand\degr{\arcdeg}% 
\newcommand\Sun{\sun}% 
\newcommand\Sol{\sun}% 
\newcommand\sun{\odot}% 
\newcommand\Mercury{\astro{\char1}}% Mercury symbol, "1" 
\newcommand\Venus{\astro{\char2}}% Venus symbol, "2" 
\newcommand\Earth{\earth}% 
\newcommand\Terra{\earth}% 
\newcommand\earth{\oplus}% 
\newcommand\Mars{\astro{\char4}}% Mars symbol, "4" 
\newcommand\Jupiter{\astro{\char5}}% Jupiter symbol, "5" 
\newcommand\Saturn{\astro{\char6}}% Saturn symbol, "6" 
\newcommand\Uranus{\astro{\char7}}% Uranus symbol, "7" 
\newcommand\Neptune{\astro{\char8}}% Neptune symbol, "8" 
\newcommand\Pluto{\astro{\char9}}% Pluo symbol, "9" 
\newcommand\Moon{\astro{\char10}}% Moon symbol, "M" 
\newcommand\Luna{\Moon}% 
\newcommand\Aries{\astro{\char11}}% 
\newcommand\VEq{\Aries}% vernal equinox (Aries) 
\newcommand\Taurus{\astro{\char12}}% 
\newcommand\Gemini{\astro{\char13}}% 
\newcommand\Cancer{\astro{\char14}}% 
\newcommand\Leo{\astro{\char15}}% 
\newcommand\Virgo{\astro{\char16}}% 
\newcommand\Libra{\astro{\char17}}% 
\newcommand\AEq{\Libra}% autumnal equinox (Libra) 
\newcommand\Scorpius{\astro{\char18}}% 
\newcommand\Sagittarius{\astro{\char19}}% 
\newcommand\Capricornus{\astro{\char20}}% 
\newcommand\Aquarius{\astro{\char21}}% 
\newcommand\Pisces{\astro{\char22}}% 
 

\newcommand\sbond{\chem@bnd{\@sbnd}}%
\newcommand\dbond{\chem@bnd{\@dbnd}}%
\newcommand\tbond{\chem@bnd{\@tbnd}}%
\def\chem@bnd#1{%
 {%
  \kern.1em\relax
  \setbox\z@\hbox{M}%
  \dimen@ii.8em\relax
  \p@=.1em\relax
  \dimen@.5\ht\z@\dimen@i-\dimen@
  \advance\dimen@1.5\p@\advance\dimen@i-1.0\p@
  #1%
  \kern.1em\relax
  }%
 }%
\def\@sbnd{%
 \advance\dimen@-1.5\p@\advance\dimen@i1.5\p@
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 }%
\def\@dbnd{%
 \advance\dimen@-0.5\p@\advance\dimen@i0.5\p@
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 \advance\dimen@-1.5\p@\advance\dimen@i1.5\p@
 \hskip-\dimen@ii
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 }%
\def\@tbnd{%
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 \advance\dimen@-1.5\p@\advance\dimen@i1.5\p@
 \hskip-\dimen@ii
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 \advance\dimen@-1.5\p@\advance\dimen@i1.5\p@
 \hskip-\dimen@ii
 \vrule\@height\dimen@\@depth\dimen@i\@width\dimen@ii\nobreak
 }%

%\newcommand\anchor[2]{#2}% 
%\renewcommand\url{\@dblarg\@url}% 
%\def\@url[#1]{\anchor{#1}}% 


\let\jnl@style=\rmfamily 
\def\ref@jnl#1{{\jnl@style#1}}% 
\newcommand\aj{\ref@jnl{AJ}}%        % Astronomical Journal 
\newcommand\araa{\ref@jnl{ARA\&A}}%  % Annual Review of Astron and Astrophys 
\newcommand\apj{\ref@jnl{ApJ}}%    % Astrophysical Journal 
\newcommand\apjl{\ref@jnl{ApJL}}     % Astrophysical Journal, Letters 
\newcommand\apjs{\ref@jnl{ApJS}}%    % Astrophysical Journal, Supplement 
\newcommand\ao{\ref@jnl{ApOpt}}%   % Applied Optics 
\newcommand\apss{\ref@jnl{Ap\&SS}}%  % Astrophysics and Space Science 
\newcommand\aap{\ref@jnl{A\&A}}%     % Astronomy and Astrophysics 
\newcommand\aapr{\ref@jnl{A\&A~Rv}}%  % Astronomy and Astrophysics Reviews 
\newcommand\aaps{\ref@jnl{A\&AS}}%    % Astronomy and Astrophysics, Supplement 
\newcommand\azh{\ref@jnl{AZh}}%       % Astronomicheskii Zhurnal 
\newcommand\baas{\ref@jnl{BAAS}}%     % Bulletin of the AAS 
\newcommand\icarus{\ref@jnl{Icarus}}% % Icarus
\newcommand\jaavso{\ref@jnl{JAAVSO}}  % The Journal of the American Association of Variable Star Observers
\newcommand\jrasc{\ref@jnl{JRASC}}%   % Journal of the RAS of Canada 
\newcommand\memras{\ref@jnl{MmRAS}}%  % Memoirs of the RAS 
\newcommand\mnras{\ref@jnl{MNRAS}}%   % Monthly Notices of the RAS 
\newcommand\pra{\ref@jnl{PhRvA}}% % Physical Review A: General Physics 
\newcommand\prb{\ref@jnl{PhRvB}}% % Physical Review B: Solid State 
\newcommand\prc{\ref@jnl{PhRvC}}% % Physical Review C 
\newcommand\prd{\ref@jnl{PhRvD}}% % Physical Review D 
\newcommand\pre{\ref@jnl{PhRvE}}% % Physical Review E 
\newcommand\prl{\ref@jnl{PhRvL}}% % Physical Review Letters 
\newcommand\pasp{\ref@jnl{PASP}}%     % Publications of the ASP 
\newcommand\pasj{\ref@jnl{PASJ}}%     % Publications of the ASJ 
\newcommand\qjras{\ref@jnl{QJRAS}}%   % Quarterly Journal of the RAS 
\newcommand\skytel{\ref@jnl{S\&T}}%   % Sky and Telescope 
\newcommand\solphys{\ref@jnl{SoPh}}% % Solar Physics 
\newcommand\sovast{\ref@jnl{Soviet~Ast.}}% % Soviet Astronomy 
\newcommand\ssr{\ref@jnl{SSRv}}% % Space Science Reviews 
\newcommand\zap{\ref@jnl{ZA}}%       % Zeitschrift fuer Astrophysik 
\newcommand\nat{\ref@jnl{Nature}}%  % Nature 
\newcommand\iaucirc{\ref@jnl{IAUC}}% % IAU Cirulars 
\newcommand\aplett{\ref@jnl{Astrophys.~Lett.}}%  % Astrophysics Letters 
\newcommand\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res.}}% % Astrophysics Space Physics Research 
\newcommand\bain{\ref@jnl{BAN}}% % Bulletin Astronomical Institute of the Netherlands 
\newcommand\fcp{\ref@jnl{FCPh}}%   % Fundamental Cosmic Physics 
\newcommand\gca{\ref@jnl{GeoCoA}}% % Geochimica Cosmochimica Acta 
\newcommand\grl{\ref@jnl{Geophys.~Res.~Lett.}}%  % Geophysics Research Letters 
\newcommand\jcp{\ref@jnl{JChPh}}%     % Journal of Chemical Physics 
\newcommand\jgr{\ref@jnl{J.~Geophys.~Res.}}%     % Journal of Geophysics Research 
\newcommand\jqsrt{\ref@jnl{JQSRT}}%   % Journal of Quantitiative Spectroscopy and Radiative Trasfer 
\newcommand\memsai{\ref@jnl{MmSAI}}% % Mem. Societa Astronomica Italiana 
\newcommand\nphysa{\ref@jnl{NuPhA}}%     % Nuclear Physics A 
\newcommand\physrep{\ref@jnl{PhR}}%       % Physics Reports 
\newcommand\physscr{\ref@jnl{PhyS}}%        % Physica Scripta 
\newcommand\planss{\ref@jnl{Planet.~Space~Sci.}}%  % Planetary Space Science 
\newcommand\procspie{\ref@jnl{Proc.~SPIE}}%      % Proceedings of the SPIE 

\newcommand\actaa{\ref@jnl{AcA}}%  % Acta Astronomica
\newcommand\caa{\ref@jnl{ChA\&A}}%  % Chinese Astronomy and Astrophysics
\newcommand\cjaa{\ref@jnl{ChJA\&A}}%  % Chinese Journal of Astronomy and Astrophysics
\newcommand\jcap{\ref@jnl{JCAP}}%  % Journal of Cosmology and Astroparticle Physics
\newcommand\na{\ref@jnl{NewA}}%  % New Astronomy
\newcommand\nar{\ref@jnl{NewAR}}%  % New Astronomy Review
\newcommand\pasa{\ref@jnl{PASA}}%  % Publications of the Astron. Soc. of Australia
\newcommand\rmxaa{\ref@jnl{RMxAA}}%  % Revista Mexicana de Astronomia y Astrofisica

%% added feb 9, 2016
\newcommand\maps{\ref@jnl{M\&PS}}% Meteoritics and Planetary Science
\newcommand\aas{\ref@jnl{AAS Meeting Abstracts}}% American Astronomical Society Meeting Abstracts
\newcommand\dps{\ref@jnl{AAS/DPS Meeting Abstracts}}% American Astronomical Society/Division for Planetary Sciences Meeting Abstracts



\let\astap=\aap 
\let\apjlett=\apjl 
\let\apjsupp=\apjs 
\let\applopt=\ao 
