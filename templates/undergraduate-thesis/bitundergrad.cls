\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitundergrad}{
  2022-06-10
}{0.0.1}{BIThesis Undergraduate Thesis class}

\PassOptionsToPackage{AutoFakeBold,AutoFakeSlant}{xeCJK}

\int_new:N \g_@@_thesis_type_int

% key-value interface definition.
\keys_define:nn { bitundergrad }
  {
    info .meta:nn = { bitundergrad / info } {#1},
    misc .meta:nn = { bitundergrad / misc } {#1},
    cover .meta:nn = { bitundergrad / cover } {#1},
    style .meta:nn = { bitundergrad / style } {#1},
    option .meta:nn = { bitundergrad / option } {#1},
  }

\keys_define:nn { bitundergrad / option }
{
  type .choice:,
  type .value_required:n = true,
  type .choices:nn =
    { bachelor, translation, english }
    { 
      \int_set_eq:NN \g_@@_thesis_type_int \l_keys_choice_int 
    },
  type .initial:n = bachelor,
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
    keywords .tl_set:N = \l_@@_info_keywords_tl,
    keywords .default:n = {北京理工大学；本科生；毕业设计（论文）},
    keywordsEn .tl_set:N = \l_@@_info_keywords_en_tl,
    keywordsEn .default:n = {BIT； Undergraduate； Graduation Project (Thesis)},
    translationTitle .tl_set:N = \l_@@_info_trans_title_tl,
    translationOriginTitle .tl_set:N = \l_@@_info_trans_origin_title_tl,
  }

\keys_define:nn { bitundergrad / misc }
  {
    date .tl_set:N = \l_bit_date_tl,
  }

\keys_define:nn { bitundergrad / style }
{
  head .tl_set:N = \l_@@_style_head_tl,
  head .initial:n = {
    \int_case:nn {\g_@@_thesis_type_int}
    {
      {1} {北京理工大学本科生毕业设计（论文）}
      {2} {北京理工大学本科生毕业设计（论文）外文翻译}
      {3} {Beijing~Institute~of~Technology~Bachelor's~Thesis}
    }
  }
}

% Pass every option not explicitly defined to `ctexbeamer`.
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexbook}
}
% Executes the code for each option.
\ProcessOptions\relax
% Load
\LoadClass[zihao=-4,oneside,openany]{ctexbook}

\RequirePackage{geometry}
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

\geometry{
  a4paper,
  left=3cm,
  bottom=2.6cm + 7bp,
  top=3.5cm + 7bp,
  right=2.6cm,
  headsep = 3.5cm + 7bp - 2.4cm - 20bp,
  headheight = 20 bp,
  footskip = 2.6cm + 7bp - 2cm,
}

% One blank line before the figure and after the caption.
\setlength{\intextsep}{1\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}

\setromanfont{Times~New~Roman}
% TODO: set optional or remove this
\setCJKfamilyfont{xihei}[AutoFakeBold,AutoFakeSlant]{[STXIHEI.TTF]} % 若希望使用本机字体，也可以用 {STXihei} 来调用
% \cs_set:Npn \xihei {} {\CJKfamily{xihei}}
\DeclareDocumentCommand \xihei {} {\CJKfamily{xihei}}

\cs_set:Npn \arabicHeiti #1 {#1}

% TODO: custom title
\fancypagestyle{BIThesis}{
  \fancyhf{}
  % 定义页眉、页码
  \fancyhead[C]{\zihao{4}\ziju{0.08}\songti{\tl_use:N \l_@@_style_head_tl}}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  % 页眉分割线稍微粗一些
  \RenewDocumentCommand \headrulewidth {} {0.6pt}
}

\ctexset{chapter={
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
  \normalfont\heiti{目\quad 录}
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
  % 正文 22 磅的行距
  \setlength{\parskip}{0em}
  \setstretch{1.53}
  % 修复脚注出现跨页的问题
  \interfootnotelinepenalty=10000
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% user interface.
\DeclareDocumentCommand \BITUndergraduateThesisSetup { m }
  { \keys_set:nn { bitundergrad } { #1 }}

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

    \int_case:nn {\g_@@_thesis_type_int}
    {
      {1}
      {
        \begin{titlepage}
          \vspace*{16mm}

          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=9.87cm]{\l_bit_coverheaderimage_tl}\\
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

            \begin{spacing}{1.8}
              \hspace{27mm}\songti\zihao{3}\selectfont{学\qquad 院：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_dept_tl}}}\par

              \hspace{27mm}\songti\zihao{3}\selectfont{专\qquad 业：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_major_tl}}}\par

              \hspace{27mm}\songti\zihao{3}\selectfont{学生姓名：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_name_tl}}}\par

              \hspace{27mm}\songti\zihao{3}\selectfont{学\qquad 号：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_studentid_tl}}}\par

              \hspace{27mm}\songti\zihao{3}\selectfont{指导教师：\dunderline[-10pt]{1pt}{\makebox[78mm][c]{\l_bit_mentor_tl}}}\par
              \tl_if_blank:VTF \l_bit_externalmentor_tl {} {
                % 生成校外毕设封面字段
                  \hspace{27mm-2em}\songti\zihao{3}\selectfont{校外指导教师：\dunderline[-10pt]{1pt}{\makebox[77.4mm][c]{\l_bit_externalmentor_tl}}}\par
                }
            \end{spacing}

          \vspace*{\fill}
          \centering
          \zihao{3}\ziju{0.5}\songti{\today}
        \end{titlepage}
      }
      {2}
      {
        \begin{titlepage}
          \tl_if_blank:VTF \l_bit_externalmentor_tl {
            % 校内毕设封面顶部间距
            \vspace*{0mm}
          }{
            % 校外毕设封面顶部间距
            \vspace*{8mm}
          }
          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=6.87cm]{\l_bit_coverheaderimage_tl}\\
          }

          \vspace{1mm}

          \zihao{2}\textbf{\songti{本科生毕业设计（论文）外文翻译}}

          \vspace{8mm}

          {

          \flushleft
          \begin{spacing}{1.8}
            \songti\zihao{-3}\selectfont{{\zihao{4}\textbf{\parbox[b]{7em}{\flushright 外文原文题目：\hspace{1em}}}}\dunderline[-10pt]{1pt}{\makebox[118mm][c]{\strut{}\shortstack{\l_@@_info_trans_origin_title_tl}}}}\par
            \songti\zihao{-3}\selectfont{{\zihao{4}\textbf{\parbox[b]{7em}{\flushright 中文翻译题目：\hspace{1em}}}}\dunderline[-10pt]{1pt}{\makebox[118mm][c]{\strut{}\shortstack{\l_@@_info_trans_title_tl}}}}\par
          \end{spacing}

          }

          \vspace{14mm}

          \zihao{2}\textbf{\xihei\l_bit_title_tl}\par

          \vspace{3mm}

          \begin{spacing}{1.2}
            \zihao{3}\selectfont{\textbf{\l_bit_titleen_tl}}\par
          \end{spacing}

          \vspace{9mm}

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
        \end{titlepage}
      }
    }
    \group_end:
  }

\DeclareDocumentCommand \MakeTOC {}
  {
    {
      \renewcommand{\baselinestretch}{1.35}
      % 目录
      \tableofcontents
      \newpage
    }
  }

  % TODO:
  \NewDocumentEnvironment {abstract} {}
  {
    \zihao{-4}
    \vspace*{-11mm}

    \begin{center}
      \heiti\zihao{-2}\textbf{
        \int_case:nn {\g_@@_thesis_type_int}
        {
          {1} {\l_bit_title_tl}
          {2} {\l_@@_info_trans_title_tl}
        }
      }
    \end{center}

    \vspace*{2mm}

    {\let\clearpage\relax \chapter*{\textmd{摘\quad 要}}}
    \addcontentsline{toc}{chapter}{摘\quad 要}
    \setcounter{page}{1}

    \vspace*{1mm}

    \setstretch{1.53}
    \setlength{\parskip}{0em}\par
  }
  {
    \vspace{4ex}\noindent\textbf{\heiti 关键词：\l_@@_info_keywords_tl}\par
    \newpage
  }

  \NewDocumentEnvironment {abstract*} {}
  {
    \zihao{-4}
    \vspace*{-2mm}

    \begin{spacing}{0.95}
      \centering
      \heiti\zihao{3}\textbf{\l_bit_titleen_tl}
    \end{spacing}

    \setstretch{1.53}
    \vspace*{17mm}

    {\let\clearpage\relax \chapter*{
      \zihao{-3}\textmd{Abstract}}}
    \addcontentsline{toc}{chapter}{Abstract}
    \setcounter{page}{2}

    \setlength{\parskip}{0em}\par
  }
  {
    \par\vspace{3ex}\noindent\textbf{Key Words:~\l_@@_info_keywords_en_tl}
    \newpage
  }

  \NewDocumentEnvironment {conclusion} {}
  {
    \ctexset{
      chapter = {
        numbering = false,
        beforeskip = 18bp,
        format = {\heiti \mdseries \centering \zihao{3}},
        afterskip = 26bp,
      },
      section/number = \arabic{section}
    }

    \stepcounter{chapter}
    \chapter{结\quad 论}
    \renewcommand{\thechapter}{结论}
  }
  {}

  \NewDocumentEnvironment {bibprint} {}
  {
    \ctexset{
      chapter = {
        numbering = false,
        beforeskip = 18bp,
        format = {\heiti \mdseries \centering \zihao{3}},
        afterskip = 26bp,
      },
    }
    % 设置参考文献字号为 5 号
    \renewcommand*{\bibfont}{\zihao{5}}
    % 设置参考文献各个项目之间的垂直距离为 0
    \setlength{\bibitemsep}{0ex}
    \setlength{\bibnamesep}{0ex}
    \setlength{\bibinitsep}{0ex}
    % 设置单倍行距
    \renewcommand{\baselinestretch}{1.2}
    % 设置参考文献顺序标签 `[1]` 与文献内容 `作者. 文献标题...` 的间距
    \setlength{\biblabelsep}{1.7mm}
    % 设置参考文献后文缩进为 0（与 Word 模板保持一致）
    \RenewDocumentCommand \itemcmd {} {
      \addvspace{\bibitemsep} % 恢复 \bibitemsep 的作用
      \mkgbnumlabel{\printfield{labelnumber}}
      \hspace{\biblabelsep}
    }
  }
  {}

  \NewDocumentEnvironment {appendices} {}
  {
    \ctexset{
      chapter = {
        numbering = false,
        beforeskip = 18bp,
        format = {\heiti \mdseries \centering \zihao{3}},
        afterskip = 26bp,
      },
      section/number = 附录\Alph{section},
      subsection/number = \Alph{section}. \arabic{subsection},
    }
    \chapter{附\quad 录}
    \renewcommand{\thechapter}{附录}
  }
  {}

  \NewDocumentEnvironment {acknowledgements} {}
  {
    \ctexset{
      chapter = {
        numbering = false,
        beforeskip = 18bp,
        format = {\heiti \mdseries \centering \zihao{3}},
        afterskip = 26bp,
      },
      section/number = \arabic{section},
      subsection/number = \arabic{section}. \arabic{subsection},
    }
    \chapter{致\quad 谢}
    \renewcommand{\thechapter}{致谢}
  }
  {}
