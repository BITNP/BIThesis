\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitundergrad}{
  2022-06-10
}{0.0.1}{BIThesis Undergraduate Thesis class}

\PassOptionsToPackage{AutoFakeBold,AutoFakeSlant}{xeCJK}

% Pass every option not explicitly defined to `ctexbeamer`.
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexbook}
}
% Executes the code for each option.
\ProcessOptions\relax
% Load
\LoadClass[zihao=-4,oneside,openany]{ctexbook}

\RequirePackage[a4paper,left=3cm,right=2.6cm,top=3.5cm,bottom=2.9cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{titletoc}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{pdfpages}
\RequirePackage{listings}

% key-value interface definition.
% \keys_define:nn { bitundergrad }
%   {
%     cover .meta:nn = { bitundergrad / cover  } {#1},
%     info .meta:nn = { bitundergrad / info } {#1},
%     misc .meta:nn = { bitundergrad / misc } {#1}
%   }
%
% \keys_define:nn { bitundergrad / cover }
%   {
%     date .tl_set:N = \l_bit_coverdate_tl,
%   }
%
% \keys_define:nn { bitundergrad / info }
%   {
%     dept .tl_set:N = \l_bit_dept_tl,
%     major .tl_set:N = \l_bit_major_tl,
%     class .tl_set:N = \l_bit_class_tl,
%     name .tl_set:N = \l_bit_name_tl,
%     mentor .tl_set:N = \l_bit_mentor_tl,
%     offCampusMentor .tl_set:N = \l_bit_offcampusmentor_tl,
%   }
%
% \keys_define:nn { bitundergrad / misc }
%   {
%     reviewTable .tl_set:N = \l_bit_reviewtable_tl,
%   }

\setromanfont{Times~New~Roman}
% TODO: set optional or remove this
\setCJKfamilyfont{xihei}[AutoFakeBold,AutoFakeSlant]{[STXIHEI.TTF]} % 若希望使用本机字体，也可以用 {STXihei} 来调用
\newcommand{\xihei}{\CJKfamily{xihei}}

\newcommand{\arabicHeiti}[1]{#1}

% TODO: custom title
\fancypagestyle{BIThesis}{
  % 页眉高度
  \setlength{\headheight}{20pt}
  % 页码高度（不完美，比规定稍微靠下 2mm）
  \setlength{\footskip}{24pt}

  \fancyhf{}
  % 定义页眉、页码
  \fancyhead[C]{\zihao{4}\ziju{0.08}\songti{北京理工大学本科生毕业设计（论文）}}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  % 页眉分割线稍微粗一些
  \renewcommand{\headrulewidth}{0.6pt}
}

\ctexset{chapter={
    name = {第,章},
    number = {\arabicHeiti{ \arabic{chapter} }},
    format = {\heiti \bfseries \centering \zihao{3}},
    aftername = \hspace{9bp},
    pagestyle = BIThesis,
    beforeskip = 8bp,
    afterskip = 32bp,
    fixskip = true,
  }
}

\ctexset{section={
    number = {\arabicHeiti{\thechapter.\hspace{1bp}\arabic{section}}},
    format = {\heiti \raggedright \bfseries \zihao{4}},
    aftername = \hspace{8bp},
    beforeskip = 20bp plus 1ex minus .2ex,
    afterskip = 18bp plus .2ex,
    fixskip = true,
  }
}

\ctexset{subsection={
    number = {\arabicHeiti{\thechapter.\hspace{1bp}\arabic{section}.\hspace{1bp}\arabic{subsection}}},
    format = {\heiti \bfseries \raggedright \zihao{-4}},
    aftername = \hspace{7bp},
    beforeskip = 17bp plus 1ex minus .2ex,
    afterskip = 14bp plus .2ex,
    fixskip = true,
  }
}

\addtocontents{toc}{\protect\hypersetup{hidelinks}}

\renewcommand{\contentsname}{
  \fontsize{16pt}{\baselineskip}
  \normalfont\heiti{目\hspace{1em}录}
  \vspace{-8pt}
}
\titlecontents{chapter}[0pt]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\renewcommand{\frontmatter}{
  \pagenumbering{Roman}
  \pagestyle{BIThesis}
}

\renewcommand{\mainmatter}{
  \pagenumbering{arabic}
  \pagestyle{BIThesis}
}

\setlength{\abovecaptionskip}{11pt}
\setlength{\belowcaptionskip}{9pt}

\AtBeginDocument{
  \renewcommand{\lstlistingname}{代码}
  \renewcommand{\thelstlisting}{\arabic{chapter}-\arabic{lstlisting}}
}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{examplestyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
\lstset{style=examplestyle}

% figure

\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\captionsetup[figure]{font=small,labelsep=space}


% table
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\captionsetup[table]{font=small,labelsep=space,skip=2pt}

% equation
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000


\newcommand{\unnumchapter}[1]{
  \chapter*{\vskip 10bp\textmd{#1} \vskip -6bp}
  \addcontentsline{toc}{chapter}{#1}
  \stepcounter{chapter}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% user interface.
\DeclareDocumentCommand \BITProposalSetup { m }
  { \keys_set:nn { bitundergrad } { #1 }}
\DeclareDocumentCommand \MakeCover {}
  {
    \group_begin:
    \group_end:
  }

\DeclareDocumentCommand \MakeReviewTable {} 
  {
    \group_begin:
    \group_end:
  }
