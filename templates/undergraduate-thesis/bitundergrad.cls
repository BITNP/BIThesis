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
\keys_define:nn { bitundergrad }
  {
    info .meta:nn = { bitundergrad / info } {#1},
    misc .meta:nn = { bitundergrad / misc } {#1},
    cover .meta:nn = { bitundergrad / cover } {#1},
    style .meta:nn = { bitundergrad / style } {#1}
  }

\keys_define:nn { bitundergrad / cover }
  {
    date .tl_set:N = \l_bit_coverdate_tl,
    headerImage .tl_set:N = \l_bit_coverheaderimage_tl,
  }

\keys_define:nn { bitundergrad / info }
  {
    title .tl_set:N = \l_bit_title_tl,
    TITLE .tl_set:N = \l_bit_titleen_tl,
    dept .tl_set:N = \l_bit_dept_tl,
    major .tl_set:N = \l_bit_major_tl,
    name .tl_set:N = \l_bit_name_tl,
    studentId .tl_set:N = \l_bit_studentid_tl,
    mentor .tl_set:N = \l_bit_mentor_tl,
    externalMentor .tl_set:N = \l_bit_externalmentor_tl,
  }

\keys_define:nn { bitundergrad / misc }
  {
    date .tl_set:N = \l_bit_date_tl,
  }

\keys_define:nn { bitundergrad / style }
  {
  }

\setromanfont{Times~New~Roman}
% TODO: set optional or remove this
\setCJKfamilyfont{xihei}[AutoFakeBold,AutoFakeSlant]{[STXIHEI.TTF]} % 若希望使用本机字体，也可以用 {STXihei} 来调用
% \cs_set:Npn \xihei {} {\CJKfamily{xihei}}
\DeclareDocumentCommand \xihei {} {\CJKfamily{xihei}}

\cs_set:Npn \arabicHeiti #1 {#1}

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
  \RenewDocumentCommand \headrulewidth {} {0.6pt}
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

% TOC
\addtocontents{toc}{\protect\hypersetup{hidelinks}}

\RenewDocumentCommand \contentsname {} {
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

\RenewDocumentCommand \frontmatter {} {
  \pagenumbering{Roman}
  \pagestyle{BIThesis}
}

\RenewDocumentCommand \mainmatter {} {
  \pagenumbering{arabic}
  \pagestyle{BIThesis}
}

\setlength{\abovecaptionskip}{11pt}
\setlength{\belowcaptionskip}{9pt}

% figure
\RenewDocumentCommand \thefigure {} {\thechapter-\arabic{figure}}
% \renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\captionsetup[figure]{font=small,labelsep=space}


% table
\RenewDocumentCommand \thetable {} {\thechapter-\arabic{table}}
% \renewcommand{\thetable}{\thechapter-\arabic{table}}
\captionsetup[table]{font=small,labelsep=space,skip=2pt}

% equation
\RenewDocumentCommand \theequation {} {\arabic{chapter}-\arabic{equation}}
% \renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% code snippet
\AtBeginDocument{
  % \renewcommand{\lstlistingname}{代码}
  \RenewDocumentCommand \lstlistingname {} {代码}
  \RenewDocumentCommand \thelstlisting {} {\arabic{chapter}-\arabic{lstlisting}}
  % \renewcommand{\thelstlisting}{\arabic{chapter}-\arabic{lstlisting}}
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
% TODO: optional
\lstset{style=examplestyle}

% \newcommand{\unnumchapter}[1]{
%   \chapter*{\vskip 10bp\textmd{#1} \vskip -6bp}
%   \addcontentsline{toc}{chapter}{#1}
%   \stepcounter{chapter}
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% user interface.
\DeclareDocumentCommand \BITUndergraduateThesisSetup { m }
  { \keys_set:nn { bitundergrad } { #1 }}

\DeclareDocumentCommand \unnumchapter {m} {
  \chapter*{\vskip 10bp\textmd{#1} \vskip -6bp}
  \addcontentsline{toc}{chapter}{#1}
  \stepcounter{chapter}
}

% Usage: \dunderline{<line_thickness>}{<text>}
% \cs_set:Npn \dunderline #1#2 {
%   {
%     \setbox0=\hbox{-10pt}
%     \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
%   }
% }
\newcommand\dunderline[3][-1pt]{{%
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}}

\DeclareDocumentCommand \MakeCover {}
  {
    \group_begin:

      \begin{titlepage}
        % \tl_new:N \l_bit_externalmentor_tl
        \tl_if_blank:VTF \l_bit_externalmentor_tl {
          \vspace*{19mm}
        }{
          \vspace*{13mm}
        }

        \centering

        \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
          \includegraphics[width=9.87cm]{images/header.png}\\
        }

        \vspace*{-3mm}

        \zihao{-0}\textbf{\ziju{0.12}\songti{本科生毕业设计（论文）}}\par

        \vspace{16mm}

        \zihao{2}\textbf{\xihei\l_bit_title_tl}\par

        \vspace{3mm}

        \begin{spacing}{1.2}
          \zihao{3}\selectfont{\textbf{\l_bit_titleen_tl}}\par
        \end{spacing}

        \vspace{15mm}

        \flushleft

        \tl_if_blank:VTF \l_bit_externalmentor_tl {
          % 生成校内毕设封面字段
          \begin{spacing}{1.8}
            \hspace{27mm}\songti\zihao{3}\selectfont{学\hspace{11mm}院：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_dept_tl}}}\par

            \hspace{27mm}\songti\zihao{3}\selectfont{专\hspace{11mm}业：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_major_tl}}}\par

            \hspace{27mm}\songti\zihao{3}\selectfont{学生姓名：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_name_tl}}}\par

            \hspace{27mm}\songti\zihao{3}\selectfont{学\hspace{11mm}号：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_studentid_tl}}}\par

            \hspace{27mm}\songti\zihao{3}\selectfont{指导教师：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_mentor_tl}}}\par
          \end{spacing}
        }{
          % 生成校外毕设封面字段
          \begin{spacing}{1.8}
            \hspace{19.4mm}\songti\zihao{3}\selectfont{学\hspace{19.6mm}院\hspace{3mm}：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_dept_tl}}}\par

            \hspace{19.4mm}\songti\zihao{3}\selectfont{专\hspace{19.6mm}业\hspace{3mm}：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_major_tl}}}\par

            \hspace{19.4mm}\songti\zihao{3}\selectfont{学\hspace{2.8mm}生\hspace{2.8mm}姓\hspace{2.8mm}名\hspace{3mm}：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_name_tl}}}\par

            \hspace{19.4mm}\songti\zihao{3}\selectfont{学\hspace{19.6mm}号\hspace{3mm}：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_studentid_tl}}}\par

            \hspace{19.4mm}\songti\zihao{3}\selectfont{指\hspace{2.8mm}导\hspace{2.8mm}教\hspace{2.8mm}师\hspace{3mm}：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_mentor_tl}}}\par

            \hspace{19.4mm}\songti\zihao{3}\selectfont{校外指导教师：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_externalmentor_tl}}}\par
          \end{spacing}
        }

        \vspace*{\fill}
        \centering
        \zihao{3}\ziju{0.5}\songti{\today}
      \end{titlepage}
    \group_end:
  }

\DeclareDocumentCommand \MakeReviewTable {} 
  {
    \group_begin:
    \group_end:
  }
