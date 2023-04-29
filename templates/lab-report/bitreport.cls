%%
%% This is file `bitreport.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bithesis.dtx  (with options: `cls,report')
%% 
%%     Copyright (C) 2023
%%     Association of Bit Network Pioneer and any individual authors listed in the documentation.
%% ------------------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        http://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        http://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2020/11/27 or later.
%% 
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainer of this work is Feng Kaiyu.
%% ------------------------------------------------------------------------------
%% 
\RequirePackage{expl3,l3keys2e}
\ProvidesExplClass{bitreport}
{2023-05-01}{3.5.4}{BIT Thesis Templates}
\int_new:N \g__bithesis_report_type_int
\clist_const:Nn \c__bithesis_report_type_clist
    { common, undergraduate_proposal}
\seq_new:N \l__bithesis_right_seq
\seq_new:N \l__bithesis_left_seq
\PassOptionsToPackage{AutoFakeBold,AutoFakeSlant}{xeCJK}
\keys_define:nn { bitreport }
  {
    option .meta:nn = {bitreport / option } {#1},
    cover .meta:nn = { bitreport / cover  } {#1},
    info .meta:nn = { bitreport / info } {#1},
    misc .meta:nn = { bitreport / misc } {#1}
  }
\keys_define:nn { bitreport / option }
  {
    type .choice:,
    type .value_required:n = true,
    type .choices:Vn =
      \c__bithesis_report_type_clist
      {
        \int_set_eq:NN \g__bithesis_report_type_int \l_keys_choice_int
      },
    type .initial:n = common,
    ctex .tl_set:N = \l__bithesis_options_to_ctex_tl,
  }
\keys_define:nn { bitreport / cover }
  {
    imagePath .tl_set:N = \l_bit_coverimagepath_tl,
    date .tl_set:N = \l__bithesis_cover_date_tl,
    %% cover entry
    dilimiter .tl_set:N = \l__bithesis_cover_dilimiter_tl,
    labelAlign .tl_set:N = \l__bithesis_cover_label_align_tl,
    labelAlign .initial:n = {r},
    valueAlign .tl_set:N = \l__bithesis_cover_value_align_tl,
    valueAlign .initial:n = {c},
    labelMaxWidth .dim_set:N = \l__bithesis_cover_label_max_width_dim,
    valueMaxWidth .dim_set:N = \l__bithesis_cover_value_max_width_dim,
    autoWidthPadding .dim_set:N = \l__bithesis_cover_auto_width_padding_dim,
    autoWidthPadding .initial:n = {0.25em},
    autoWidth .bool_set:N = \l__bithesis_cover_auto_width_bool,
    autoWidth .initial:n = {true},
    underlineThickness .dim_set:N = \l__bithesis_cover_underline_thickness_dim,
    underlineThickness .initial:n = {1pt},
    underlineOffset .dim_set:N = \l__bithesis_cover_underline_offset_dim,
    underlineOffset .initial:n = { -10pt },
  }
\keys_define:nn { bitreport / info }
  {
    title .tl_set:N = \l__bithesis_value_title_tl,
    school .tl_set:N = \l__bithesis_value_school_tl,
    major .tl_set:N = \l__bithesis_value_major_tl,
    class .tl_set:N = \l__bithesis_value_class_tl,
    author .tl_set:N = \l__bithesis_value_author_tl,
    supervisor .tl_set:N = \l__bithesis_value_supervisor_tl,
    externalSupervisor .tl_set:N = \l__bithesis_value_external_supervisor_tl,
    studentId .tl_set:N = \l__bithesis_value_student_id_tl,
  }
\keys_define:nn { bitreport / misc }
  {
    reviewTable .tl_set:N = \l_bit_reviewtable_tl,
  }
\DeclareOption*{
  \PassOptionsToClass{\l__bithesis_options_to_ctex_tl}{ctexart}
}
\ProcessOptions\relax
\LoadClass[zihao=-4]{ctexart}
\RequirePackage[a4paper,left=3cm,right=2.4cm,top=2.6cm,bottom=2.38cm,includeheadfoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{pdfpages}
\ProcessKeysOptions { bitreport / option }
\cs_generate_variant:Nn \tl_if_empty:nTF {x}
\cs_generate_variant:Nn \seq_set_split:Nnn {Nnx}
\cs_new:Npn \__bithesis_dunderline:nnn #1#2#3 {
  {\setbox0=\hbox{#3}\ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}
}
\cs_new:Npn \__bithesis_render_cover_entry:nn #1#2 {
  \makebox[\l__bithesis_cover_label_max_width_dim][\l__bithesis_cover_label_align_tl]{
    \tl_if_blank:VTF #1 {} {#1\l__bithesis_cover_dilimiter_tl}
  }
  \hspace{1ex}
  \__bithesis_dunderline:nnn{\l__bithesis_cover_underline_offset_dim}{\l__bithesis_cover_underline_thickness_dim}{
    \makebox[\l__bithesis_cover_value_max_width_dim][\l__bithesis_cover_value_align_tl]{#2}
  }\par
}
\cs_new:Npn \__bithesis_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l_tmpa_box }
  }
\cs_generate_variant:Nn \__bithesis_get_text_width:Nn { NV }
\cs_new:Npn \__bithesis_get_max_text_width:NN #1#2
  {
    \group_begin:
      \seq_set_eq:NN \l__bithesis_tmpa_seq #2
      \dim_zero_new:N \l__bithesis_tmpa_dim
      \bool_until_do:nn { \seq_if_empty_p:N \l__bithesis_tmpa_seq }
        {
          \seq_pop_left:NN \l__bithesis_tmpa_seq \l__bithesis_tmpa_tl
          \__bithesis_get_text_width:NV \l__bithesis_tmpa_dim \l__bithesis_tmpa_tl
          % 在两边加上空白，避免文本太靠边。
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__bithesis_tmpa_dim + \l__bithesis_cover_auto_width_padding_dim * 2} }
        }
    \group_end:
  }
\cs_new:Npn \__bithesis_parse_entry #1 #2 {
  \seq_set_split:Nnx \l__bithesis_tmp_right_seq {\\} {#2}
  \seq_clear:N \l__bithesis_tmp_left_seq
  \seq_map_inline:Nn \l__bithesis_tmp_right_seq {
    \seq_put_right:Nn \l__bithesis_tmp_left_seq {}
  }
  \seq_put_left:Nn \l__bithesis_tmp_left_seq {#1}
  \seq_pop_right:NN \l__bithesis_tmp_left_seq \g__bithesis_trashcan_tl
}
\cs_new:Npn \__bithesis_render_cover_entry:n #1 {
  % 左边是标签，右边是值。
  % 形如：
  % { {label_1} {value_1}, {label_2} {value 2} }
  % 首先转换成 seq 类型。
  \seq_set_from_clist:NN \l__bithesis_input_seq #1
  \seq_map_inline:Nn \l__bithesis_input_seq {
    % 然后对于每一对 label 和 value，首先查找
    % value 中是否含有 \\ 字符，如果有，则将其分割成多个
    % label - value 对。
    % 比如 {label_1} {value \\ 1} 会被转换成
    % { {label_1} {value}, {} {1} }
    \__bithesis_parse_entry ##1
    % 然后将这些 label - value 对添加到 \l__bithesis_right_seq
    % 或者 \l__bithesis_left_sql 中。
    % left 就是 label，right 就是 value。
    \seq_concat:NNN \l__bithesis_right_seq \l__bithesis_right_seq \l__bithesis_tmp_right_seq
    \seq_concat:NNN \l__bithesis_left_seq \l__bithesis_left_seq \l__bithesis_tmp_left_seq
  }

  % 如果用户选择自动计算最大宽度，则计算最大宽度。
  \bool_if:NT \l__bithesis_cover_auto_width_bool {
    \__bithesis_get_max_text_width:NN \l__bithesis_cover_label_max_width_dim \l__bithesis_left_seq
    \__bithesis_get_max_text_width:NN \l__bithesis_cover_value_max_width_dim \l__bithesis_right_seq
  }

  % 最后，根据宽度渲染 label 和 value 对。
  \group_begin:
    \bool_until_do:nn { \seq_if_empty_p:N \l__bithesis_left_seq }
      {
        \seq_pop_left:NN \l__bithesis_left_seq \l__bithesis_tmpa_tl
        \seq_pop_left:NN \l__bithesis_right_seq \l__bithesis_tmpb_tl
        \tl_if_empty:xTF \l__bithesis_tmpb_tl {} {
          \__bithesis_render_cover_entry:nn {\l__bithesis_tmpa_tl} {\l__bithesis_tmpb_tl}
        }
      }
  \group_end:
}
\DeclareDocumentCommand \BITSetup { m }
  { \keys_set:nn { bitreport } { #1 }}
\DeclareDocumentCommand \MakeCover {}
  {
    \group_begin:
    \int_case:nn {\g__bithesis_report_type_int} {
      {1} {
        \begin{titlepage}
          \centering

          \vspace{23mm}

          \tl_if_empty:NF \l_bit_coverimagepath_tl {
            \includegraphics[width=.5\textwidth]{\l_bit_coverimagepath_tl}\\
          }

          \vspace{10mm}

          \heiti\fontsize{24pt}{24pt}\selectfont{\l__bithesis_value_title_tl}\\

          \vspace{67mm}

          \begin{spacing}{2.2}
            \songti\zihao{3}

            \clist_set:Nn \l__bithesis_input_clist {
                {\textbf{学\qquad 院：}} {\l__bithesis_value_school_tl},
                {\textbf{专\qquad 业：}} {\l__bithesis_value_major_tl},
                {\textbf{班\qquad 级：}} {\l__bithesis_value_class_tl},
                {\textbf{学\qquad 号：}} {\l__bithesis_value_student_id_tl},
                {\textbf{姓\qquad 名：}} {\l__bithesis_value_author_tl},
                {\textbf{任课教师：}} {\l__bithesis_value_supervisor_tl},
            }

            \__bithesis_render_cover_entry:n \l__bithesis_input_clist

          \end{spacing}

          \vspace*{\fill}

          \centering

          \songti\fontsize{12pt}{12pt}\selectfont{
            \tl_if_empty:NTF \l__bithesis_cover_date_tl {
              \today
            } {
              \l__bithesis_cover_date_tl
            }
          }
        \end{titlepage}
      }
      {2} {
        % Main code for \MakeCover
        \begin{titlepage}
          \topskip=0pt
          \vspace*{-16mm}
          \centering
          \hspace{-6mm}
          \songti\fontsize{22pt}{22pt}
          \selectfont{北京理工大学}\par

          \vspace{13mm}

          \hspace{-6mm}
          \heiti\fontsize{24pt}{24pt}
          \selectfont{本科生毕业设计（论文）开题报告}\par

          \vspace{53mm}

          \begin{spacing}{2.2}
            \songti\zihao{3}
            \clist_set:Nn \l__bithesis_input_clist {
                {\textbf{学\qquad 院：}} {\l__bithesis_value_school_tl},
                {\textbf{专\qquad 业：}} {\l__bithesis_value_major_tl},
                {\textbf{班\qquad 级：}} {\l__bithesis_value_class_tl},
                {\textbf{姓\qquad 名：}} {\l__bithesis_value_author_tl},
                {\textbf{指导教师：}} {\l__bithesis_value_supervisor_tl},
                {\textbf{校外指导教师：}} {\l__bithesis_value_external_supervisor_tl},
            }

          \__bithesis_render_cover_entry:n \l__bithesis_input_clist

          \end{spacing}

          \vspace*{\fill}

          \centering
          \hspace{-6mm}\songti\fontsize{12pt}{12pt}\selectfont{\today}

        \end{titlepage}
      }
    }
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
\DeclareCaptionFont{kaiticaption}{\kaishu \normalsize}
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\captionsetup[figure]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}
\renewcommand{\thetable}{\thesection-\arabic{table}}
\captionsetup[table]{font=small,labelsep=space,skip=10bp,labelfont=bf,font=kaiticaption}
\ctexset{today=big}
\setromanfont{Times~New~Roman}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\ctexset{section={
  format={
    \raggedright \bfseries \songti \zihao{-3}
  },
  beforeskip = 24bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  name = {,.\quad}
  }
}
\ctexset{subsection={
  format = {
    \bfseries \songti \raggedright \zihao{4}
  },
  beforeskip = 24bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  }
}
\fancyhf{}
\int_case:nn {\g__bithesis_report_type_int} {
  {1} {
    \fancyhead[R]{
      \fontsize{10.5pt}{10.5pt}
      \selectfont{\l__bithesis_value_title_tl}
    }
  }
  {2} {
    \fancyhead[R]{
      \fontsize{10.5pt}{10.5pt}
      \selectfont{北京理工大学本科生毕业设计（论文）开题报告}
    }
  }
}
\fancyfoot[R]{\fontsize{9pt}{9pt}\selectfont{\thepage}}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
\setcounter{page}{1}
\cs_set:Npn \baselinestretch {1.53}
\endinput
%%
%% End of file `bitreport.cls'.
