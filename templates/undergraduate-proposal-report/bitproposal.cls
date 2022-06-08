\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitproposal}{
  2022-06-08
}{0.0.1}{BIThesis undergraduate proposal report class}

\PassOptionsToPackage{AutoFakeBold,AutoFakeSlant}{xeCJK}

% Pass every option not explicitly defined to `ctexbeamer`.
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexart}
}
% Executes the code for each option.
\ProcessOptions\relax
% Load
\LoadClass[zihao=-4]{ctexart}

\RequirePackage[a4paper,left=3cm,right=2.4cm,top=2.6cm,bottom=2.38cm,includeheadfoot]{geometry}
\RequirePackage{fancyhdr}%
\RequirePackage{setspace}%
\RequirePackage{caption}%
\RequirePackage{booktabs}%

% \RequirePackage{fontspec}%
% \RequirePackage{setspace}%
% \RequirePackage{graphicx}%
% \RequirePackage{fancyhdr}%
% \RequirePackage{pdfpages}%
% \RequirePackage{setspace}%
% \RequirePackage{caption}%

% TODO: to be deleted
% \RequirePackage{fontspec}%

\keys_define:nn { bitproposal }
  {
    cover .meta:nn = { bitproposal / cover  } {#1},
    info .meta:nn = { bitproposal / info } {#1},
    misc .meta:nn = { bitproposal / misc } {#1}
  }

\keys_define:nn { bitproposal / cover }
  {
    date .tl_set:N = \l_bit_coverdate_tl,
  }

\keys_define:nn { bitproposal / info }
  {
    dept .tl_set:N = \l_bit_dept_tl,
    major .tl_set:N = \l_bit_major_tl,
    class .tl_set:N = \l_bit_class_tl,
    name .tl_set:N = \l_bit_name_tl,
    mentor .tl_set:N = \l_bit_mentor_tl,
    offCampusMentor .tl_set:N = \l_bit_offcampusmentor_tl,
  }

\keys_define:nn { bitproposal / misc }
  {
    reviewTable .tl_set:N = \l_bit_reviewtable_tl,
  }

\DeclareDocumentCommand \BITProposalSetup { m }
  { \keys_set:nn { bitproposal } { #1 }}
\DeclareDocumentCommand \MakeCover {}
  {
    \group_begin:
      % Main code for \MakeCover
      \begin{titlepage}
        \topskip=0pt
        \vspace*{-16mm}
        \centering
        \hspace{-6mm}\songti\fontsize{22pt}{22pt}\selectfont{北京理工大学}\par

        \vspace{13mm}

        \hspace{-6mm}\heiti\fontsize{24pt}{24pt}\selectfont{本科生毕业设计（论文）开题报告}\par

        \vspace{53mm}

        \flushleft
        \begin{spacing}{2.2}
          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{学\hspace{11mm}院：}\underline{\makebox[51mm][c]{\l_bit_dept_tl}}}\par

          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{专\hspace{11mm}业：}\underline{\makebox[51mm][c]{\l_bit_major_tl}}}\par

          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{班\hspace{11mm}级：}\underline{\makebox[51mm][c]{\l_bit_class_tl}}}\par

          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{姓\hspace{11mm}名：}\underline{\makebox[51mm][c]{\l_bit_name_tl}}}\par

          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{指导教师：}\underline{\makebox[51mm][c]{\l_bit_mentor_tl}}}\par

          \hspace{46mm}\songti\fontsize{16pt}{16pt}\selectfont{\textbf{校外指导教师：}\underline{\makebox[40mm][c]{\l_bit_offcampusmentor_tl}}}\par
        \end{spacing}

        \vspace*{\fill}

        \centering
        \hspace{-6mm}\songti\fontsize{12pt}{12pt}\selectfont{\today}
      \end{titlepage}
    \group_end:
  }

\DeclareDocumentCommand \MakeReviewTable {} 
  {
    \group_begin:
      \begin{titlepage}
        \includepdf[pages=-]{\l_bit_reviewtable_tl}
      \end{titlepage}
    \group_end:
  }

% 定义 caption 字体为楷体
\DeclareCaptionFont{kaiticaption}{\kaishu \normalsize}

% 设置图片的 caption 格式
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\captionsetup[figure]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}

% 设置表格的 caption 格式
\renewcommand{\thetable}{\thesection-\arabic{table}}
\captionsetup[table]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}

% 输出大写数字日期
\ctexset{today=big}

% 将西文字体设置为 Times New Roman
\setromanfont{Times~New~Roman}

%% 将中文楷体设置为 SIMKAI.TTF（如果需要）
% \setCJKfamilyfont{zhkai}{[SIMKAI.TTF]}
% \newcommand*{\kaiti}{\CJKfamily{zhkai}}

% 设置文档标题深度
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

%%
% 设置一级标题、二级标题格式
% 一级标题：小三，宋体，加粗，段前段后各半行
\ctexset{section={
  format={\raggedright \bfseries \songti \zihao{-3}},
  beforeskip = 24bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  name = {,.\quad}
  }
}
% 二级标题：小四，宋体，加粗，段前段后各半行
\ctexset{subsection={
  format = {\bfseries \songti \raggedright \zihao{4}},
  beforeskip = 24bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  }
}
% 页眉和页脚（页码）的格式设定
\fancyhf{}
\fancyhead[R]{\fontsize{10.5pt}{10.5pt}\selectfont{北京理工大学本科生毕业设计（论文）开题报告}}
\fancyfoot[R]{\fontsize{9pt}{9pt}\selectfont{\thepage}}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}

% 正文开始
\pagestyle{fancy}
\setcounter{page}{1}

% 正文 22 磅的行距，段前段后间距为 0
% \setlength{\parskip}{0em}
% \renewcommand{\baselinestretch}{1.53}
% 正文首行悬挂 1.02cm
% \setlength{\parindent}{1.02cm}

