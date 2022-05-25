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

\RequirePackage[a4paper,left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm,includeheadfoot]{geometry}%

% 将西文字体设置为 Times New Roman
\setromanfont{Times~New~Roman}%

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
\fancyhead[L]{\fontsize{10.5pt}{10.5pt}\selectfont\kaishu{\reportName}}%
\fancyfoot[C]{\fontsize{9pt}{9pt}\selectfont\kaishu{\thepage}}%
\renewcommand{\headrulewidth}{0.5pt}%
\renewcommand{\footrulewidth}{0pt}%

% 正文 pagestyle
\pagestyle{fancy}
\setcounter{page}{1}%
