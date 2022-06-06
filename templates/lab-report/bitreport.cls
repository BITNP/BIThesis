\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitreport}{
  2022-05-25
}{0.0.1}{BIThesis lab report class}

\PassOptionsToPackage{AutoFakeBold,AutoFakeSlant}{xeCJK}
% Pass every option not explicitly defined to `ctexbeamer`.
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexart}
}
% Executes the code for each option.
\ProcessOptions\relax
% Load
\LoadClass[zihao=-4]{ctexart}

\RequirePackage{fancyhdr}%

\RequirePackage{titlesec}%
\RequirePackage{fontspec}%
\RequirePackage{setspace}%

\RequirePackage[a4paper,left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm,includeheadfoot]{geometry}%

\keys_define:nn { bitreport }
  {
    cover .meta:nn = { bitreport / cover  } {#1},
    info .meta:nn = { bitreport / info } {#1}
  }

\keys_define:nn { bitreport / cover }
  {
    imagePath .tl_set:N = \l_bit_coverimagepath_tl,
    date .tl_set:N = \l_bit_coverdate_tl,
  }

\keys_define:nn { bitreport / info }
  {
    title .tl_set:N = \l_bit_title_tl,
    dept .tl_set:N = \l_bit_depart_tl,
    major .tl_set:N = \l_bit_major_tl,
    classNumber .tl_set:N = \l_bit_classnumber_tl,
    studentNumber .tl_set:N = \l_bit_studentnumber_tl,
    name .tl_set:N = \l_bit_name_tl,
    teacherName .tl_set:N = \l_bit_teachername_tl,
  }

\DeclareDocumentCommand \BITLabReportSetup { m }
  { \keys_set:nn { bitreport } { #1 }}
\DeclareDocumentCommand \MakeCover {}
  {
    \group_begin:
      % Main code for \MakeCover
      \begin{titlepage}
        \centering
        \vspace{23mm}
        \tl_if_empty:NF \l_bit_coverimagepath_tl {
          \includegraphics[width=.5\textwidth]{\l_bit_coverimagepath_tl}\\
        }
        \vspace{10mm}
        \heiti\fontsize{24pt}{24pt}\selectfont{\l_bit_title_tl}\\
        \vspace{77mm}
          \begin{spacing}{2.2}
            \tl_if_empty:NF \l_bit_depart_tl {
              \songti\fontsize{16pt}{16pt}\selectfont{\textbf{学\hspace{11mm}院：}\underline{\makebox[51mm][c]{\l_bit_depart_tl}}}\\
            }

            \tl_if_empty:NF \l_bit_major_tl {
              \songti\fontsize{16pt}{16pt}\selectfont{\textbf{专\hspace{11mm}业：}\underline{\makebox[51mm][c]{\l_bit_major_tl}}}\\
            }

            \tl_if_empty:NF \l_bit_classnumber_tl {
              \songti\fontsize{16pt}{16pt}\selectfont{\textbf{班\hspace{11mm}级：}\underline{\makebox[51mm][c]{\l_bit_classnumber_tl}}}\\
            }

            \tl_if_empty:NF \l_bit_name_tl {
              \songti\fontsize{16pt}{16pt}\selectfont{\textbf{姓\hspace{11mm}名：}\underline{\makebox[51mm][c]{\l_bit_name_tl}}}\\
            }

            \tl_if_empty:NF \l_bit_teachername_tl {
              \songti\fontsize{16pt}{16pt}\selectfont{\textbf{任课教师：}\underline{\makebox[51mm][c]{\l_bit_teachername_tl}}}\\
            }
          \end{spacing}
        \vspace*{\fill}
        \centering
        \songti\fontsize{12pt}{12pt}\selectfont{
          \tl_if_empty:NTF \l_bit_coverdate_tl {
            \today
          } {
            \l_bit_coverdate_tl
          }
        }
      \end{titlepage}
    \group_end:
  }


% 将西文字体设置为 Times New Roman
% \setromanfont{Times~New~Roman}%

% 设置文档标题深度
\setcounter{tocdepth}{3}%
\setcounter{secnumdepth}{3}%

%%
% 设置一级标题、二级标题格式
\ctexset{section={%
  format={\raggedright \bfseries \songti \zihao{-3}},%
  name = {,.},%
  number = \chinese{section}%
  }%
}%
\ctexset{subsection={%
  format = {\bfseries \songti \raggedright \zihao{-4}},%
  }%
}%

% 页眉和页脚（页码）的格式设定
\fancyhf{}%
\fancyhead[L]{\fontsize{10.5pt}{10.5pt}\selectfont\kaishu{\l_bit_title_tl}}%
\fancyfoot[C]{\fontsize{9pt}{9pt}\selectfont\kaishu{\thepage}}%
\renewcommand{\headrulewidth}{0.5pt}%
\renewcommand{\footrulewidth}{0pt}%

% 正文 pagestyle
\pagestyle{fancy}
\setcounter{page}{1}%
