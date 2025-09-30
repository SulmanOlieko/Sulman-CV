%%% Author: Sulman Olieko Owili
%%% Affil: University of Nairobi
%%% Note: This class file is copyrighted. All rights reserved.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sulmancv}[2025/09/30 v1.2 Sulman CV class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% =========== REQUIRED PACKAGES  ==================
\RequirePackage[T1]{fontenc}
% \RequirePackage{epigrafica} % uncomment ONLY if installed
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{bookmark}
\RequirePackage{lastpage}
\RequirePackage{ragged2e}
\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage[many]{tcolorbox}
\RequirePackage[explicit]{titlesec}
\RequirePackage{fontawesome5}
\RequirePackage{eso-pic}       
\RequirePackage{forest}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage{textcomp}

% ================== PAGE GEOMETRY ==================
\geometry{
  ignoreheadfoot,
  top=1.5cm,
  bottom=1.5cm,
  left=1.5cm,
  right=1.5cm,
  footskip=0.8cm
% ,showframe % <- uncomment ONLY for debugging
}

% ================== COLOURS ==================
\definecolor{cream}{RGB}{255,253,208} 
\colorlet{lightcream}{cream!25!white} 
\pagecolor{lightcream}

\definecolor{primaryColor}{RGB}{0,128,128}
\definecolor{cvGutterLine}{HTML}{E5E7EB}
\definecolor{cvSeparator}{HTML}{EEF1F4}
\definecolor{cvMuted}{HTML}{9CA3AF}
\definecolor{primaryColor2}{HTML}{C0C0C0}

% ================== GLOBAL SPACING TWEAKS ==================
\AtBeginDocument{\pdfgentounicode=1}
\raggedbottom
\setcounter{secnumdepth}{0}
\setlength{\parindent}{0pt}
\setlength{\topskip}{0pt}
\setlength{\parskip}{0.1cm plus4mm minus3mm}
\pagestyle{empty} 

% ================== SECTION STYLE ==================
\titleformat{\section}{\Large\color{primaryColor}}{}{0pt}{%
  \textbf{#1}\hspace{0.15cm}\titlerule[0.8pt]\hspace{-0.1cm}%
}
\titlespacing{\section}{0pt}{0.3cm}{0.2cm}

% ================== TABULARX HELPERS ==================
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{K}[1]{>{\let\newline\\\arraybackslash\hspace{0pt}}X}
\setlength\tabcolsep{-1.5pt}
\let\sulmancv@origTX\tabularx
\let\sulmancv@origEndTX\endtabularx
\renewenvironment{tabularx}{\bgroup\centering\sulmancv@origTX}{\sulmancv@origEndTX\par\egroup}

% ================== LISTS & "CODE-VIEWER" BOX ==================
% Knobs
\newcommand{\CodeGutterWidth}{1.6cm}
\newcommand{\CodeGutterPad}{0.2em}
\newcommand{\CodeSepThickness}{0.28pt}
\newcommand{\CodeBoxTopBottom}{0.6em}
\newcommand{\CodeBeforeAfterSkip}{0.3\baselineskip}
\newcommand{\CodeItemsepI}{0.10\baselineskip}
\newcommand{\CodeItemsepII}{0.10\baselineskip}
\newcommand{\CodeItemsepIII}{0.10\baselineskip}
\newcommand{\CodeTopsepI}{.35\baselineskip}
\newcommand{\CodeTopsepII}{.25\baselineskip}
\newcommand{\CodeTopsepIII}{.20\baselineskip}
\newcommand{\CodeSeparator}{%
  \par\nointerlineskip
  \hbox to \linewidth{\color{cvSeparator}\rule{\linewidth}{\CodeSepThickness}}
  \par\nointerlineskip
}
\newlist{myenumerate}{enumerate}{3}
\setlist[myenumerate,1]{%
  itemsep=\CodeItemsepI,parsep=0pt,topsep=\CodeTopsepI,partopsep=0pt,leftmargin=*,
  label=\llap{\makebox[\CodeGutterWidth][r]{\textcolor{cvMuted}{\footnotesize\arabic*.}}\hspace{\CodeGutterPad}},
  itemjoin=\CodeSeparator
}
\setlist[myenumerate,2]{%
  itemsep=\CodeItemsepII,parsep=0pt,topsep=\CodeTopsepII,partopsep=0pt,leftmargin=*,
  label=\llap{\makebox[\CodeGutterWidth][r]{\textcolor{cvMuted}{\footnotesize\alph*.}}\hspace{\CodeGutterPad}},
  itemjoin=\CodeSeparator
}
\setlist[myenumerate,3]{%
  itemsep=\CodeItemsepIII,parsep=0pt,topsep=\CodeTopsepIII,partopsep=0pt,leftmargin=*,
  label=\llap{\makebox[\CodeGutterWidth][r]{\textcolor{cvMuted}{\footnotesize\roman*.}}\hspace{\CodeGutterPad}},
  itemjoin=\CodeSeparator
}
\tcolorboxenvironment{myenumerate}{%
  enhanced,
  before skip=\CodeBeforeAfterSkip,
  after skip=\CodeBeforeAfterSkip,
  colback=lightcream,colframe=white,boxrule=0pt,arc=1pt,
  left=\dimexpr \CodeGutterWidth+\CodeGutterPad\relax,
  right=0em,top=\CodeBoxTopBottom,bottom=\CodeBoxTopBottom,
  borderline west={0.9pt}{0pt}{cvGutterLine},
  overlay={\draw[cvGutterLine] ([xshift=\CodeGutterWidth]frame.south west)--([xshift=\CodeGutterWidth]frame.north west);}
}

% ================== ENVIRONMENTS ==================
\newenvironment{highlights}{%
  \begin{itemize}[topsep=0pt,parsep=0.10cm,partopsep=0pt,itemsep=0pt,after=\vspace{-1\baselineskip},leftmargin=0.4cm+3pt]
}{\end{itemize}}

\newenvironment{header}{%
  \setlength{\topsep}{0pt}\par\kern\topsep\centering\color{primaryColor}\linespread{1.5}%
}{\par\kern\topsep}

% changemargin (environment-style macro) ----
\makeatletter
\@ifundefined{changemargin}{%
  % Usage: \begin{changemargin}{<left>}{<right>} ... \end{changemargin}
  \newcommand{\changemargin}[2]{%
    \list{}{\rightmargin #2 \leftmargin #1
      \topsep=0pt \itemsep=0pt \parsep=0pt \parskip=0pt
      \labelwidth=0pt \itemindent=0pt \labelsep=0pt}%
    \item[]%
  }%
  \let\endchangemargin\endlist
}{}
\makeatother

% ================== FOOTER WITH PAGE X OF Y ==================
\makeatletter
\newcommand{\ps@customFooterStyle}{%
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \def\@oddfoot{%
    \color{gray}\small\textit{\textcopyright\; \the\year\;$\cdot$ Sulman Olieko Owili}%
    \hfill%
    \color{gray}\small\textit{Page \textbf{\thepage{}} of \pageref*{LastPage}}%
  }%
  \let\@evenfoot\@oddfoot
}
\makeatother

\pagestyle{customFooterStyle}

% ================== "LAST UPDATED" STAMP  ==================
\makeatletter
\newcommand{\placelastupdatedtext}{%
  \AddToShipoutPictureFG*{%
    % Anchor at the top-right corner of the TEXT AREA (not paper edge):
    \put(%
      \LenToUnit{\dimexpr\paperwidth-\Gm@rmargin-0.1cm\relax},% x: inside right margin with 0.2cm padding
      \LenToUnit{\dimexpr\paperheight-\Gm@tmargin--0.5cm\relax}% y: 0.2cm below top text boundary
    ){%
      \makebox[0pt][r]{\small\color{gray}\itshape \textcolor{black}{\faInfoCircle}\;Last updated on \today}%
    }%
  }%
}
\makeatother

% ================== HYPERREF SETUP ==================
\hypersetup{
  pdftitle={Sulman Olieko Owili CV},
  pdfauthor={Sulman Olieko Owili},
  colorlinks=true,
  urlcolor=primaryColor,
  hidelinks
}

% Optional: keep the external-link icon patch
\let\hrefWithoutArrow\href
\renewcommand{\href}[2]{%
  \hrefWithoutArrow{#1}{\mbox{\ifthenelse{\equal{#2}{}}{ }{#2 }%
  \raisebox{.15ex}{\scriptsize \textcolor{primaryColor}{\faExternalLink*}}}}}

%%%%%%%%% Autocalculate the duration of employment

\makeatletter

% Scratch registers (allocated once; safe to reuse)
\newcount\Dur@YI   \newcount\Dur@MI   \newcount\Dur@DI
\newcount\Dur@YF   \newcount\Dur@MF   \newcount\Dur@DF
\newcount\Dur@dY   \newcount\Dur@dM   \newcount\Dur@dD
\newcount\Dur@YY   \newcount\Dur@MM

\def\Dur@compute#1#2#3#4#5#6{%
  % load inputs
  \Dur@YI=#1\relax \Dur@MI=#2\relax \Dur@DI=#3\relax
  \Dur@YF=#4\relax \Dur@MF=#5\relax \Dur@DF=#6\relax
  % raw diffs
  \Dur@dY=\numexpr \Dur@YF - \Dur@YI\relax
  \Dur@dM=\numexpr \Dur@MF - \Dur@MI\relax
  \Dur@dD=\numexpr \Dur@DF - \Dur@DI\relax
  % borrow a month if end-day < start-day (partial last month)
  \ifnum\Dur@dD<0 \advance\Dur@dM by -1\fi
  % normalise months into [0..11] by pushing negatives into years
  \loop\ifnum\Dur@dM<0
    \advance\Dur@dY by -1
    \advance\Dur@dM by 12
  \repeat
  % clamp negatives (start after end)
  \ifnum\Dur@dY<0
    \Dur@dY=0 \Dur@dM=0
  \fi
  % expose to public registers
  \Dur@YY=\Dur@dY
  \Dur@MM=\Dur@dM
}

% Printer
\newcommand{\DurYMD}[6]{%
  \begingroup
    \Dur@compute{#1}{#2}{#3}{#4}{#5}{#6}%
    \ifnum\Dur@YY>0
      \number\Dur@YY\space year\ifnum\Dur@YY=1\else s\fi
    \fi
    \ifnum\Dur@MM>0
      \ifnum\Dur@YY>0 \space\fi
      \number\Dur@MM\space month\ifnum\Dur@MM=1\else s\fi
    \fi
    \ifnum\Dur@YY=0 \ifnum\Dur@MM=0 0 months\fi\fi
  \endgroup
}

% Numeric accessors 
\newcommand{\DurYearsNum}[6]{%
  \begingroup \Dur@compute{#1}{#2}{#3}{#4}{#5}{#6}\number\Dur@YY\endgroup
}
\newcommand{\DurMonthsNum}[6]{%
  \begingroup \Dur@compute{#1}{#2}{#3}{#4}{#5}{#6}\number\Dur@MM\endgroup
}

% Start date to "today"
\newcommand{\DurToTodayYMD}[3]{%
  \DurYMD{#1}{#2}{#3}{\the\year}{\the\month}{\the\day}%
}

\makeatother
