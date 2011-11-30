\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{nice_book_pdf} [1997/3/12 v0.1 Hacked version of `book']

% Declare \ifs

\newif\if@isdraft
\newif\if@iswide
\newif\if@isvwide
\newif\if@isxwide
\newif\if@isnoblank
\newif\if@isflushrightchapter
\newif\if@isbigchapternum
\newif\if@isutopia
\newif\if@istimes
\newif\if@ishelvetica
\newif\if@iscourier
\newif\if@ispalatino
\newif\if@isbookman
\newif\if@ischapterrule
\newif\if@usedsetgutter

% Initialise values

\@isdraftfalse
\@isnoblankfalse
\@isflushrightchapterfalse
\@isbigchapternumfalse
\@isutopiafalse
\@istimesfalse
\@ishelveticafalse
\@iscourierfalse
\@ispalatinofalse
\@isbookmanfalse
\@ischapterrulefalse
\@usedsetgutterfalse

% Declare class options

\DeclareOption{chapterrule}{\@ischapterruletrue}
\DeclareOption{palatino}{\@ispalatinotrue}
\DeclareOption{bookman}{\@isbookmantrue}
\DeclareOption{utopia}{\@isutopiatrue}
\DeclareOption{helvetica}{\@ishelveticatrue}
\DeclareOption{times}{\@istimestrue}
\DeclareOption{courier}{\@iscouriertrue}
\DeclareOption{flushrightchapter}{\@isflushrightchaptertrue}
\DeclareOption{bigchapternum}{\@isbigchapternumtrue}
\DeclareOption{wide}{\@iswidetrue}
\DeclareOption{vwide}{\@isvwidetrue}
\DeclareOption{xwide}{\@isxwidetrue}
\DeclareOption{noblank}{\@isnoblanktrue}
\DeclareOption{draftcopy}{
                        \@isdrafttrue
                        \PassOptionsToClass{draft}{book}
                        \typeout{*** THIS IS A DRAFT VERSION ***}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}


% Load the required packages

\RequirePackage{makeidx}
%\RequirePackage{epsfig}
\RequirePackage{verbatim}
\RequirePackage{float}
\RequirePackage{alg}
\RequirePackage{longtable}


% Substitute fonts.
% Use Utopia or Times instead of Computer Modern Serif

\if@isutopia
  \if@istimes\typeout{Cannot have both Utopia and Times.}\fi
  \renewcommand{\rmdefault}{put}
\fi

\if@istimes
  \if@isutopia\error{Cannot have both Times and Utopia.}\fi
  \renewcommand{\rmdefault}{ptm}
\fi


% Use Helvetica instead of Computer Modern Sans Serif

\if@ishelvetica\renewcommand{\sfdefault}{phv}\fi


% Use the Courier instead of Computer Modern Typewriter

\if@iscourier\renewcommand{\ttdefault}{pcr}\fi


% Substitute all three fonts with the Palatino family

\if@ispalatino
  \if@isutopia\error{Cannot have both Palatino and Utopia.}\fi
  \if@ishelvetica\error{Cannot have both Palatino and Helvetica.}\fi
  \if@istimes\error{Cannot have both Palatino and Times.}\fi
  \if@iscourier\error{Cannot have both Palatino and Courier.}\fi
  \renewcommand{\rmdefault}{ppl}
%  \renewcommand{\sfdefault}{phv}
%  \renewcommand{\ttdefault}{pcr}
\fi


% Use Bookman

\if@isbookman\renewcommand{\rmdefault}{pbk}\fi



% Definitions

\def\headercolor{\color[rgb]{0.4,0,0}}
\def\headerfont{\headercolor\sffamily\bfseries\setcounter{footnote}{0}}
\def\chapternumfont{\huge\sffamily\bfseries}
\def\chapternamefont{\Huge\headerfont}
\def\chapterheadingrule{\vskip 40\p@}
\def\sectionfont{\normalfont\Large\headerfont}
\def\subsectionfont{\normalfont\large\headerfont}
\def\subsubsectionfont{\normalfont\normalsize\headerfont}
\def\paragraphfont{\normalfont\normalsize\headerfont}
\def\subparagraphfont{\normalfont\normalsize\headerfont}
\def\@parmargin{0\p@}
\def\floatrule{\rule{\oldtextwidth}{1mm}}
\def\algrule{\floatrule}



% The paragraph layout stuff

\newlength\oldtextwidth
\setlength\oldtextwidth\textwidth
\newlength\parmargin
\setlength\parmargin{0pt}
\setlength\marginparsep{0.0cm}


\newcommand{\setparmargin}[1]{%
  \if@usedsetgutter
  \PackageError{nicebook}{%
    You can only use \protect\setparmargin once.\MessageBreak Use
    \protect\resetparmargin instead}{%
    To set the inside paragraph margin, use \protect\setparmargin{} once. If,
    for some reason, you wish to redefine the paragraph margin, you'll have to
    use \protect\resetparmargin{} instead.  \protect\setparmargin{} may only be
    used once in the document and it must precede all calls to
    \protect\resetparmargin{}.}
  \fi
  \@usedsetguttertrue
  \setlength\oldtextwidth{\textwidth}
  \setlength\oddsidemargin{#1}
  \setlength\parmargin{#1}
  \setlength\evensidemargin{0pt}
  \addtolength\textwidth{-\oddsidemargin}
  \setlength\marginparsep{-\marginparsep}
  \addtolength\marginparsep{-\textwidth}
  \addtolength\marginparsep{-\marginparwidth}
}

\newcommand{\resetparmargin}[1]{
  \if@usedsetgutter
  \else
  \PackageError{nicebook}{%
    You should use \protect\setparmargin before using\MessageBreak
    \protect\resetparmargin.}{%
    To set the inside paragraph margin, use \protect\setparmargin once. If, for
    some reason, you wish to redefine the paragraph margin, you'll have to use
    \protect\resetparmargin instead.  \protect\setparmargin may only be used
    once in the document and it must precede all calls to
    \protect\resetparmargin.}
  \fi
  \setlength\textwidth{\oldtextwidth}
  \setlength\oddsidemargin{#1}
  \setlength\parmargin{#1}
  \setlength\evensidemargin{0pt}
  \addtolength\textwidth{-\oddsidemargin}
  \setlength\marginparsep{-\marginparsep}
  \addtolength\marginparsep{-\textwidth}
  \addtolength\marginparsep{-\marginparwidth}
}


% The section options stuff

\def\presection{\vspace{3ex}}
%\def\presection{\vspace{4ex}\noindent\rule{\totalparwidth}{0.5pt}}
%\def\presection{\everypar{}\vspace{4ex}\noindent\rule{\textwidth}{0.5pt}}


% Make the chapter number appear in cminch

\if@isbigchapternum
  \newfont{\BIG}{cminch scaled 1000}
  \renewcommand\partname{}
  \renewcommand\chaptername{}
  \renewcommand\appendixname{}
  \def\chapternumfont{\BIG}
  \def\partnumfont{\BIG}
\fi


% Add a rule to separate the chapter heading from the chapter proper

\if@ischapterrule
  \def\chapterheadingrule{\vskip
    10\p@\hspace{-\oddsidemargin}\floatrule\vskip 40\p@}
\fi


% The Chapter Abstract

\newcommand\chapabs[1]{\em \marginpar{\vspace{0.5em}Abstract}#1\relax\rm\vspace{4ex}}



%\newlength{\headwidth}
%\setlength{\textwidth}{\textwidth}

\if@isdraft
        \typeout{Package draftcopy is loaded.}
        \RequirePackage{draftcopy}
        \def\draftcopy@GrayValue{ 0.95 }
\fi

\if@isnoblank
        \renewcommand{\cleardoublepage}{\newpage}
\fi


\newlength\headertmp

\def\niceoddfooter{}
\def\niceevenfooter{}
\def\niceoddplainfooter{}
\def\niceevenplainfooter{}

\def\ps@nice{%
    \let\@oddfoot\niceoddfooter\let\@evenfoot\niceevenfooter
    \setlength\headertmp{\textwidth}
    \setlength\textwidth{\oldtextwidth}
    \def\@evenhead{\begin{minipage}{\oldtextwidth}\headerfont%
\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}l@{}}%
\thepage&\leftmark\\\hline%
\end{tabular*}%
\end{minipage}\setlength\textwidth{\headertmp}}
\def\@oddhead{\hspace{-\parmargin}%
\setlength\headertmp{\textwidth}%
\setlength\textwidth{\oldtextwidth}%
\begin{minipage}{\oldtextwidth}\headerfont%
\begin{tabular*}{\textwidth}{@{}r@{\extracolsep{\fill}}r@{}}%
\rightmark&\thepage\\\hline%
\end{tabular*}%
\end{minipage}\setlength\textwidth{\headertmp}} 
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}{}}%
    \def\sectionmark##1{%
      \markright {{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}
}


\def\ps@niceplain{%
    \def\@oddhead{}%
    \def\@evenhead{}%
    \def\@oddfoot{\niceplainoddfooter}%
    \def\@evenfoot{\niceplainevenfooter}%
%    \def\@evenfoot{\headerfont\thepage\hfil}%
%    \def\@oddfoot{\headerfont\hfil\thepage}%
    \let\@mkboth\markboth
}



% Renew the sectioning commands to render in Sans-Serif.


\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \if@isflushrightchapter\hfill\fi%
        {{\chapternumfont \@chapapp\space \thechapter}}
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \if@isflushrightchapter\hfill\fi%
    \hspace{-\parmargin}%
    \begin{minipage}{\oldtextwidth}\chapternamefont\hfill%
      #1\end{minipage}%
    \par\nobreak
    \chapterheadingrule
  }}

\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \if@isflushrightchapter\hfill\fi%
    \chapternamefont  #1\par\nobreak
    \chapterheadingrule
  }}



\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \if@isbigchapternum
         \partnumfont~\partname~\\
         \thepart
         \par
         \vskip 20\p@
       \else
         \Huge\bfseries \partname~\thepart
         \par
         \vskip 20\p@
       \fi
     \fi
     \sffamily\Huge\bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}


\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{niceplain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter
                    }

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sectionfont}}
%\renewcommand\section{\presection\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\Large\headerfont}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\subsectionfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\subsubsectionfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\paragraphfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\subparagraphfont}}
\if@iswide
\ifcase \@ptsize
    % mods for 10 pt
    \oddsidemargin  0.15 in     %   Left margin on odd-numbered pages.
    \evensidemargin 0.35 in     %   Left margin on even-numbered pages.
    \marginparwidth 1 in        %   Width of marginal notes.
    \oddsidemargin 0.25 in      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.25 in
    \marginparwidth 0.75 in
    \textwidth 5.875 in % Width of text line.
\or % mods for 11 pt
    \oddsidemargin 0.1 in      %   Left margin on odd-numbered pages.
    \evensidemargin 0.15 in    %   Left margin on even-numbered pages.
    \marginparwidth 1 in       %   Width of marginal notes.
    \oddsidemargin 0.125 in    %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.125 in
    \marginparwidth 0.75 in
    \textwidth 6.125 in % Width of text line.
\or % mods for 12 pt
    \oddsidemargin -10 pt      %   Left margin on odd-numbered pages.
    \evensidemargin 10 pt      %   Left margin on even-numbered pages.
    \marginparwidth 1 in       %   Width of marginal notes.
    \oddsidemargin 0 in      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0 in
    \marginparwidth 0.75 in
    \textwidth 6.375 true in % Width of text line.
\fi
\fi



\newcommand\eushield[1]{%
  \epsfig{file=eushield,#1}%
}





\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
        \vspace{10ex}\eushield{width=2in}\\
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}



\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\headerfont\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

\renewcommand\listoffigures{%
  \@openrighttrue
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\headerfont\listfigurename
    \@mkboth{\MakeUppercase\listfigurename}%
    {\MakeUppercase\listfigurename}}%
  \addcontentsline{toc}{chapter}{\listfigurename}
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
  \@openrighttrue
  }

\renewcommand\listoftables{%
  \@openrighttrue
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\headerfont\listtablename
    \@mkboth{%
      \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
  \addcontentsline{toc}{chapter}{\listtablename}
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
  \@openrighttrue
  }

\newcommand\listalgname{List of Algorithms} 
\renewcommand\listofalgorithms{%
  \@openrighttrue
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\headerfont\listalgname
    \@mkboth{%
      \MakeUppercase\listalgname}{\MakeUppercase\listalgname}}%
  \addcontentsline{toc}{chapter}{\listalgname}
  \@starttoc{loa}%
  \if@restonecol\twocolumn\fi
  \@openrighttrue
  }








%
% New floats. We define new floating bodies for figures, tables and algorithms.
%

% The nice float style renders floating bodies between horizontal
% thick rules.

\newlength\floattmp
\def\@nicefloatlabeltmp
\newcounter{floatlabeltmp}
\newcommand\floatc@nice[2]{%
  \vspace{2ex}
  \setlength\floattmp{\textwidth}%
  \setlength\textwidth{\oldtextwidth}%
  \hfill\parbox{\captionwidth}{%
    \setbox\@tempboxa\hbox{{\@fs@cfont #1:} #2}%
    \ifdim\wd\@tempboxa>\hsize {\@fs@cfont #1:} #2\par
    \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}\hfill
  \setlength\textwidth{\floattmp}
}
\newcommand\fs@nice{%
  \def\@fs@cfont{}% We may want to redefine the caption font at some point
  \let\@fs@capt\floatc@nice%
  \def\@fs@pre{%
    \setlength\floattmp{\textwidth}%
    \setlength\textwidth{\oldtextwidth}%
    \ifodd0\pageref{\@nicefloatlabeltmp}%
      \hspace{-\parmargin}%
    \fi%
    \begin{minipage}{\oldtextwidth}%
      \centering\floatrule\vspace{2ex}
      }% end of @fs@pre definition
  \def\@fs@mid{}
  \def\@fs@post{%
    \floatrule%
    \end{minipage}%
    \setlength\textwidth{\floattmp}
  }
  \let\@fs@iftopcapt\iffalse%
}


%\floatstyle{nice} % Set the floating body style to `nice'


% The new floating bodies
  
\newfloat{figure}{htbf}{lof}[chapter]
\floatname{figure}{Figure}

\newfloat{table}{htbf}{lot}[chapter]
\floatname{table}{Table}

\newfloat{algorithm}{htbf}{loa}[chapter]
\floatname{algorithm}{Algorithm}

\def\caption{\refstepcounter\@captype \label{\@nicefloatlabeltmp}\@dblarg{\@caption\@captype}}


% A command to quickly insert a figure

\def\fwf@pageref#1{%
  \expandafter\expandafter\expandafter
  \fwf@secondofmany\csname r@#1\endcsname\@empty\@nil
}
\def\fwf@secondofmany#1#2#3\@nil{#2}%

\newcommand\fig[3][htbf]{%
  \begin{figure}[#1]%
    \edef\fwf@side{\if@twoside \ifodd 0\fwf@pageref{#3}\hskip-2\parmargin\fi\fi}
    \makebox[\oldtextwidth]{%
      \fwf@side
      \vbox to\topskip{}%
      \parbox[t]{\oldtextwidth}{%
        \floatrule\vspace{2ex}\par
        \centering #2\par\label{#3}\par
        \floatrule%
      }%
    }%
  \end{figure}
}


% Likewise, a command to add a floating table (or a floating long table)

\newcommand\tab[5][htbf]{
  \begin{table}[#1]%
    \edef\fwf@side{\if@twoside \ifodd 0\fwf@pageref{#5}\hskip-2\parmargin\fi\fi}
    \makebox[\oldtextwidth]{%
      \fwf@side
      \vbox to\topskip{}%
      \parbox[t]{\oldtextwidth}{%
        \floatrule\vspace{2ex}\par
        \centering%
        \begin{tabular}{#2}#3%
        \end{tabular}%
        {#4}\par%\label{#5}%
        \par\floatrule%
      }%
    }%
  \end{table}
}

\newcommand\longtab[5][htbf]{
  \def\@nicefloatlabeltmp{#5}
  \begin{table}[#1]%
    \parbox{\oldtextwidth}{%
      \centering%
      \begin{longtabular}{#2}#3%
%      \label{#5}
      \end{longtabular}%
      {#4}%
      }
  \end{table}
  }


% A command to add a floating algorithm

\newcommand{\alg}[3][htbf]{%
  \begin{algorithm}[#1]%
    \edef\fwf@side{\if@twoside \ifodd 0\fwf@pageref{#3}\hskip-2\parmargin\fi\fi}
    \makebox[\oldtextwidth]{%
      \fwf@side
      \vbox to\topskip{}%
      \parbox[t]{\oldtextwidth}{%
        \floatrule\vspace{2ex}\par
        #2\par\label{#3}\par
        \floatrule%
      }%
    }%
  \end{algorithm}
}

%\renewenvironment{algtab}[1][\alglinenowidth] {
%   \setboolean{alg@linenums}{true}\vspace{1em}\begin{alg@tab}{#1}\dsoff
%}
%{\end{alg@tab}}

%\newenvironment{algtab*}[1][0pt] {
%   \setboolean{alg@linenums}{false}\vspace{1em}\begin{alg@tab}{#1}\dsoff
%}
%{\end{alg@tab}}


\newdimen\infomapmargin
\newdimen\infomapwidth
\infomapmargin 135pt
\infomapwidth 123pt
\def\infomaplabel#1{\raisebox{0pt}[1em][0pt]{\makebox[\labelwidth][l]
    {\parbox[t]{\infomapwidth}{\raggedright\bfseries #1}}}}
\def\infomap{\list{}{\leftmargin\infomapmargin
    \labelwidth\leftmargin\advance\labelwidth-\labelsep
    \let\makelabel\infomaplabel}}
\let\endinfomap\endlist
\def\ttitem[#1]{\item[{\tt #1}]}
%

\newcommand\glit[2][GLOSSARY DEFINITION]{%
\subsubsection*{#2\relax}\label{glo-#1}}

\def\theglossary{\typeout{Glossary.} \begin{infomap}}
\def\endtheglossary{\end{infomap}}



\renewenvironment{thebibliography}[1]
     {\chapter*{\headerfont\bibname
        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}
        \addcontentsline{toc}{chapter}{\bibname}
        \label{bib}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\newcommand{\abstractname}{Abstract}
\newenvironment{abstract}{%
    \if@twocolumn
      \LARGE\headerfont\abstractname
    \else
      \null\vfil\small
      \begin{center}%
        {\LARGE\headerfont\abstractname\vspace{-.5em}\vspace{\z@}}%
      \end{center}%
      \quotation
    \fi}
    {\if@twocolumn\else\endquotation\fi\null\vfil\small
}



\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \if@openright\cleardoublepage\else\clearpage\fi
                \thispagestyle{niceplain}
                \twocolumn[\@makeschapterhead{\headerfont\indexname}]%
                \addcontentsline{toc}{chapter}{\indexname}
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}

\newcommand{\glo}[2]{%
        {\bfseries #1}\glossary{#2}%
        }
\newcommand{\gloi}[2]{%
        {\bfseries #1}\glossary{#2}\index{#1}%
        }
\def\captionwidth{0.9\textwidth}
\newcommand{\capt}[2]{%
        \parbox{\captionwidth}{\caption[#1]{#2}}\vspace{1em}%
        }


% New, better reference commands.

%\def\label#1{\@bsphack
%  \protected@write\@auxout{}%
%         {\string\newlabel{#1}{{\@currentlabel}{\thepage}}}%
%  \@esphack%\def{\checkpoint@#1}{#1}}
%}

%\def\unknownref{\bf ????}

%\newcommand\nicepageref[1]{%
%\@ifundefined{\checkpoint@#1}\unknownref\else%
%\ifnum 0#1\relax = 0\pageref{#1}\pageref{#1}\else \fi%
%\fi%
%}

% Use hyperlinking when renderind PDFs
\ifx\pdfoutput\undefined
\newcommand{\cf}[2][section]{#1~\ref{#2} (p.~\pageref{#2})}
\else
%\newcommand{\cf}[2][section]{#1~\ref{#2} (on page~\pageref{#2})}
\newcommand{\cf}[2][section]{\hyperref[#2]{#1 \ref*{#2} (p.~\pageref*{#2})}}
\fi
\newcommand{\appcf}[1]{\cf[appendix]{#1}}
\newcommand{\ccf}[1]{\cf[chapter]{#1}}
\newcommand{\fcf}[1]{\cf[figure]{#1}}
\newcommand{\tcf}[1]{\cf[table]{#1}}
\newcommand{\ecf}[1]{\cf[equation]{#1}}
\newcommand{\algcf}[1]{\cf[algorithm]{#1}}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{4}

\newcommand{\dson}{\renewcommand{\baselinestretch}{1.3}\large\normalsize}
\newcommand{\dsoff}{\renewcommand{\baselinestretch}{1}\large\normalsize} 
\newcommand{\change}{\marginpar{\rule{1em}{1em}}}

\renewcommand{\thealgorithmfloat}{\arabic{chapter}.\arabic{algorithmfloat}}

\renewcommand\listof[2]{%
  \@ifundefined{ext@#1}{\float@error{#1}}{%
    \@ifundefined{chapter}{\def\@tempa{\section*}}%
      {\def\@tempa{\chapter*}}%
    \@tempa{\headerfont#2\@mkboth{\uppercase{#2}}{\uppercase{#2}}}%
    \@namedef{l@#1}{\@dottedtocline{1}{1.5em}{2.3em}}%
    \addcontentsline{toc}{chapter}{#2}
    \@starttoc{\@nameuse{ext@#1}}}}


\if@isxwide
    \setlength\topmargin{-0.5in}
    \setlength\oddsidemargin{0in}
    \setlength\evensidemargin{0in}
    \setlength\marginparwidth{0in}
    \setlength\marginparsep{0in}
    \setlength\textwidth{6.11in}
    \setlength\hoffset{0.24in}
    \setlength\voffset{0.25in}
    \setlength\textheight{9.5in}
    \setlength\footskip{2em}
\fi
\if@isvwide
    \setlength\topmargin{-0.5in}
    \setlength\oddsidemargin{-0.3in}
    \setlength\evensidemargin{-0.3in}
    \setlength\marginparwidth{0in}
    \setlength\marginparsep{0in}
    \setlength\textwidth{6.875in}
    \setlength\hoffset{0in}
    \setlength\voffset{0in}
    \setlength\textheight{9.8in}
\fi


% End of file.
