\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitundergrad}{
  2022-06-10
}{0.0.1}{BIThesis Undergraduate Thesis class}

% Define Global Variables
\int_new:N \g_@@_thesis_type_int
\tl_new:N \g_@@_toc_title_tl
\int_new:N \g_@@_head_zihao_int
\bool_new:N \g_@@_twoside_bool
\bool_new:N \g_@@_thesis_type_english_bool

% Define Consts.
\clist_const:Nn \c_@@_thesis_type_clist
    { bachelor, bachelor_translation, bachelor_english, master, docter}

\cs_new_protected:Npn \@@_define_name:nn #1#2
  { \tl_const:cn { c_@@_name_ #1 _tl } {#2} }

\cs_new_protected:Npn \@@_define_name_by_thesis_type:nnn #1#2#3 
  {
    \tl_const:cn { c_@@_ #1 _name_ #2 _tl } {#3}
  }

\cs_new_protected:Npn \@@_define_name:nnn #1#2#3
  {
    \tl_const:cn { c_@@_name_ #1    _tl } {#2}
    \tl_const:cn { c_@@_name_ #1 _en_tl } {#3}
  }

\cs_new_protected:Npn \@@_define_name_by_thesis_type:nnnn #1#2#3#4
  {
    \tl_const:cn { c_@@_ #1 _name_ #2 _tl } {#3}
    \tl_const:cn { c_@@_ #1 _name_ #2 _en_tl } {#4}
  }

\clist_map_inline:nn
  {
    {code} {代码},
    {udc} {UDC分类号：},
    {classification} {中国分类号：},
  }
  {\@@_define_name:nn #1}

% bachelor
\clist_map_inline:nn
  {
    {title} {本科生毕业设计（论文）},
    {originality} {原创性声明},
    {originality_clause} {本人郑重声明：所呈交的毕业设计（论文），是本人在指导老师的指导下独立进行研究所取得的成果。除文中已经注明引用的内容外，本文不包含任何其他个人或集体已经发表或撰写过的研究成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。\par~特此申明。},
    {authorization} {关于使用授权的声明},
    {authorization_clause} {本人完全了解北京理工大学有关保管、使用毕业设计（论文）的规定，其中包括：\circled{1}~学校有权保管、并向有关部门送交本毕业设计（论文）的原件与复印件；\circled{2}~学校可以采用影印、缩印或其它复制手段复制并保存本毕业设计（论文）；\circled{3}~学校可允许本毕业设计（论文）被查阅或借阅；\circled{4}~学校可以学术交流为目的,复制赠送和交换本毕业设计（论文）；\circled{5}~学校可以公布本毕业设计（论文）的全部或部分内容。},
    {originality_author_signature} {本人签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{13mm}年\hspace{8mm}月\hspace{8mm}日},
    {originality_supervisor_signature} {指导老师签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{13mm}年\hspace{8mm}月\hspace{8mm}日},
  } {\@@_define_name_by_thesis_type:nnn {bachelor} #1}

% % bachelor english
\clist_map_inline:nn
  {
    {title} {},
    {originality} {原创性声明~Statement~of~Originality},
    {originality_clause} {
        本人郑重声明：所呈交的毕业设计（论文），是本人在指导老师的指导下独立进行研究所取得的成果。除文中已经注明引用的内容外，本文不包含任何其他个人或集体已经发表或撰写过的研究成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。特此申明。\par 
        \arialfamily I,\dunderline[-1pt]{1pt}{\makebox[18mm]{}},~solemnly~
        declare:~the~submitted~graduation~design~(thesis),~is~the~research~achievement~completed~independently~by~myself~
        under~the~guidance~of~the~supervisor.~This~article~does~not~contain~
        any~research~published~or~written~by~any~other~individual~or~group,~
        except~as~already~referenced~in~this~paper.~Individuals~and~groups~
        that~have~made~important~contributions~to~the~study~of~this~paper~
        are~clearly~indicated~and~cited~in~the~paper.\par
    },
    {authorization} {关于使用授权的声明~State~of~Use~Authorization},
    {authorization_clause} {
      本人完全了解北京理工大学有关保管、使用毕业设计（论文）的规定，其中包括：\circled{1}学校有权保管、并向有关部门送交本毕业设计（论文）的原件与复印件；\circled{2}学校可以采用影印、缩印或其它复制手段复制并保存本毕业设计（论文）；\circled{3}学校可允许本毕业设计（论文）被查阅或借阅；\circled{4}学校可以学术交流为目的,复制赠送和交换本毕业设计（论文）；\circled{5}学校可以公布本毕业设计（论文）的全部或部分内容。\par
  I~fully~understand~the~regulations~on~the~storage,~use~of~graduation~design~(thesis)~in~Beijing~Institute~of~Technology.~Beijing~Institute~of~Technology~has~the~right~to~(1)~keep,~and~to~the~relevant~departments~to~send~the~original~or~copy~of~this~graduation~design~(thesis);~(2)~copy~and~preserve~this~graduation~design~(thesis)~by~photocopying,~miniature~or~other~means~of~reproduction;~(3)~allow~this~graduation~design~(thesis)~to~be~read~or~borrowed;~(4)~for~the~purpose~of~academic~exchange,~copy,~give~and~exchange~this~graduation~design~(thesis);~(5)~publish~all~or~part~of~the~contents~of~this~graduation~design~(thesis).~
    },
  } {\@@_define_name_by_thesis_type:nnn {bachelor_english} #1}

\cs_new:Npn \smallgap {
  \hspace{0.45ex}
}

% graduate
\clist_map_inline:nn
  {
    {originality} {研究成果声明},
    {originality_clause} {本人郑重声明：所提交的学位论文是我本人在指导教师的指导下进行的研究工作获得的研究成果。尽我所知，文中除特别标注和致谢的地方外，学位论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京理工大学或其它教育机构的学位或证书所使用过的材料。与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。\par~特此申明。},
    {authorization} {关于学位论文使用权的说明},
    {authorization_clause} {本人完全了解北京理工大学有关保管、使用学位论文的规定，其中包括：\circled{1}~学校有权保管、并向有关部门送交学位论文的原件与复印件；\circled{2}~学校可以采用影印、缩印或其它复制手段复制并保存学位论文；\circled{3}~学校可允许学位论文被查阅或借阅；\circled{4}~学校可以学术交流为目的,复制赠送和交换学位论文；\circled{5}~学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。},
    {originality_author_signature} {签\qquad 名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{30mm}\quad},
    {originality_supervisor_signature} {指导老师签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{30mm}\quad},
  } {\@@_define_name_by_thesis_type:nnn {graduate} #1}

\clist_map_inline:nn
  {
    {author} {作\quad 者\quad 姓\quad 名} {Candiate~Name},
    {school} {学\quad 院\quad 名\quad 称} {School~or~Department},
    {supervisor} {指\quad 导\quad 教\quad 师} {Faculty~Mentor},
    {chairman} {答辩委员会主席} {Chair,~Thesis~Committee},
    {degree} {申\smallgap 请\smallgap 学\smallgap 位\smallgap 级\smallgap 别} {Degree~Applied},
    {major} {学\quad 科\quad 专\quad 业} {Major},
    {institute} {学\smallgap 位\smallgap 授\smallgap 予\smallgap 单\smallgap 位} {Degree~by},
    {defense_date} {论\smallgap 文\smallgap 答\smallgap 辩\smallgap 日\smallgap 期} {The~Date~of~Defence},
  } {\@@_define_name_by_thesis_type:nnnn {graduate} #1}

\clist_map_inline:nn 
  {
    {school} {学\qquad 院} {School},
    {major} {专\qquad 业} {Degree},
    {author} {学生姓名} {Author},
    {student_id} {学\qquad 号} {Student~ID},
    {supervisor} {指导教师} {Supervisor},
    {co_supervisor} {校外指导教师} {Co-Supervisor},
    {toc} {目\quad 录} {Table~of~Contents},
    {abstract} {摘\quad 要} {Abstract},
    {keywords} {关键词：} {Key~Words:~},
    {conclusion} {结\quad 论} {Conclusions},
    {appendix} {附\quad 录} {Appendices},
    {appendix_prefix} {附录} {Appendix},
    {ack} {致\quad 谢} {Acknowledgement},
    {reference} {参考文献} {References},
    {figure} {插\quad 图} {Illustrations},
    {table} {表\quad 格} {Tables},
    {university} {北京理工大学} {BEIJING~INSTITUTE~OF~TECHNOLOGY},
    {publications} {攻读学位期间发表论文与研究成果清单} {Publications~During~Studies},
    % TODO: Not so sure about the translation.
    {resume} {作者简介} {},
    {symbols} {主要符号对照表} {},
  }
  {\@@_define_name:nnn #1}

% TODO: \clist_item:Nn
\clist_const:Nn \c_@@_bachelor_thesis_header_clist
  {北京理工大学本科生毕业设计（论文）, 北京理工大学本科生毕业设计（论文）外文翻译, Beijing~Institute~of~Technology~Bachelor's~Thesis }
\clist_const:Nn \c_@@_bachelor_thesis_cover_title_clist
  {
    本科生毕业设计（论文）,
    本科生毕业设计（论文）外文翻译,
    Beijing\nobreak{~}Institute\nobreak{~}of\nobreak{~}Technology~Bachelor's~Thesis,
  }

% helper functions

% 是否为研究生学位论文
\cs_new:Npn \@@_if_graduate:TF #1#2 {
    \int_compare:nNnTF {3} < {\g_@@_thesis_type_int}
      {#1}
      {#2}
  }

% 是否某一特定模板
\cs_new:Npn \@@_if_thesis_int_type:nTF #1#2#3 {\int_compare:nNnTF {\g_@@_thesis_type_int} = {#1} {#2} {#3}}
\cs_new:Npn \@@_if_thesis_int_type:nT #1#2 {\@@_if_thesis_int_type:nTF {#1} {#2} {}}

% 是否为英文模板，这里包括全英文专业和研究生模板的英文模式。
\cs_new:Npn \@@_if_thesis_english:TF #1#2 {\bool_if:nTF {\g_@@_thesis_type_english_bool} {#1} {#2}}
\cs_new:Npn \@@_if_thesis_english:T #1 {\@@_if_thesis_english:TF {#1}{}}




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
  type .choices:Vn =
    \c_@@_thesis_type_clist
    { 
      \int_set_eq:NN \g_@@_thesis_type_int \l_keys_choice_int 
      \int_case:nn {\l_keys_choice_int} {
        % 本科全英文也是英文模板。
        {3} {\bool_set_true:N \g_@@_thesis_type_english_bool}
      }
    },
  type .initial:n = bachelor,
}

\keys_define:nn { bitundergrad / cover }
  {
    date .tl_set:N = \l_bit_coverdate_tl,
    headerImage .tl_set:N = \l_bit_coverheaderimage_tl,
    xiheiFont .tl_set:N = \l_@@_cover_xihei_font_path_tl,
    xiheiFont .default:n = {STXihei},
  }

\keys_define:nn { bitundergrad / info }
  {
    title .tl_set:N = \l_bit_title_tl,
    % TODO: rename
    TITLE .tl_set:N = \l_bit_titleen_tl,
    % TODO: rename to school.
    dept .tl_set:N = \l_bit_dept_tl,
    major .tl_set:N = \l_bit_major_tl,
    % TODO: rename to author.
    name .tl_set:N = \l_bit_name_tl,
    studentId .tl_set:N = \l_bit_studentid_tl,
    % TODO: rename to supervisor
    mentor .tl_set:N = \l_bit_mentor_tl,
    externalMentor .tl_set:N = \l_bit_externalmentor_tl,
    keywords .tl_set:N = \l_@@_info_keywords_tl,
    keywordsEn .tl_set:N = \l_@@_info_keywords_en_tl,
    translationTitle .tl_set:N = \l_@@_info_trans_title_tl,
    translationOriginTitle .tl_set:N = \l_@@_info_trans_origin_title_tl,
    % 中国分类号，研究生学位论文使用
    classification .tl_set:N = \l_@@_info_classification_tl,
    % UDC 分类号，研究生学位论文使用
    UDC .tl_set:N = \l_@@_info_udc_tl,
    chairman .tl_set:N = \l_@@_info_chairman_tl,
    degree .tl_set:N = \l_@@_info_degree_tl,
    degreeEn .tl_set:N = \l_@@_info_degree_en_tl,
    institute .tl_set:N = \l_@@_info_institute_tl,
    institute .initial:n = {\c_@@_name_university_tl},
    defense_date .tl_set:N = \l_@@_info_defense_date_tl,
    authorEn .tl_set:N = \l_@@_info_author_en_tl,
    schoolEn .tl_set:N = \l_@@_info_school_en_tl,
    supervisorEn .tl_set:N = \l_@@_info_supervisor_en_tl,
    chairmanEn .tl_set:N = \l_@@_info_chairman_en_tl,
    majorEn .tl_set:N = \l_@@_info_major_en_tl,
    instituteEn .tl_set:N = \l_@@_info_institute_en_tl,
    instituteEn .initial:n = {\c_@@_name_university_en_tl},
    defenseDateEn .tl_set:N = \l_@@_info_defense_date_en_tl,
  }

\keys_define:nn { bitundergrad / misc }
  {
    date .tl_set:N = \l_bit_date_tl,
    arialFont .tl_set:N = \l_@@_misc_arial_font_path_tl,
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
      {4} {北京理工大学硕士学位论文}
      {5} {北京理工大学博士学位论文}
    }
  }
}

\ProcessKeysOptions { bitundergrad / option }

\@@_if_thesis_english:T {
  \PassOptionsToClass{scheme=plain}{ctexbook}
}

% Any extra option passed by user will be passed to ctexbook.
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

\@@_if_graduate:TF {
  \int_set:Nn \g_@@_head_zihao_int {5}
  \geometry{
    a4paper,
    left=2.7cm,
    bottom=2.5cm + 7bp,
    top=3.5cm + 7bp,
    right=2.7cm,
    headsep = 3.5cm + 7bp - 2.5cm - 15bp,
    headheight = 15 bp,
    footskip = 2.5cm + 7bp - 1.8cm,
  }
} {
  \int_set:Nn \g_@@_head_zihao_int {4}
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
}

% One blank line before the figure and after the caption.
\setlength{\intextsep}{2\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}

\setromanfont{Times~New~Roman}

\ctex_at_end_preamble:n {
  \@@_if_thesis_english:TF {
    \tl_set:Nn \g_@@_toc_title_tl {\c_@@_name_toc_en_tl}
    \@@_if_thesis_int_type:nT {3} {
      % font Arial needed
      \newfontfamily\arialfamily{Arial}
    }

  } {
    \tl_set:Nn \g_@@_toc_title_tl {\c_@@_name_toc_tl}

    \tl_if_blank:VTF \l_@@_cover_xihei_font_path_tl {} 
    {
      \setCJKfamilyfont{xihei}[AutoFakeBold,AutoFakeSlant]{\l_@@_cover_xihei_font_path_tl}
    }
  }

  \@@_if_thesis_int_type:nT {3} {
    \RequirePackage[en-US]{datetime2}
    \RequirePackage{indentfirst}
    \DTMlangsetup[en-US]{dayyearsep={\space}}
  }

  % Define biblatex category if it was imported.
  \cs_if_exist:NT \DeclareBibliographyCategory {
    % \int_show:N \g_@@_thesis_type_int
    \DeclareBibliographyCategory{mypub}
  }
}

\cs_new:Npn \xihei:n #1 {
  \xeCJK_family_if_exist:nTF {xihei} {
    \CJKfamily{xihei} #1
  }{
    \heiti #1
  }
}

\cs_new:Npn \l_@@_title_font_cs:n #1 {
  \int_compare:nNnTF {\g_@@_thesis_type_int} = {3}
  {
    \arialfamily #1
  } {
    \heiti #1
  }
}

\cs_new:Npn \l_@@_unnumchapter_style_cs:n #1 {
  % 本科全英文、研究生学位论文需要加粗
  \int_compare:nNnTF {\g_@@_thesis_type_int} > {2}
  {
    \bfseries #1
  } {
    \mdseries #1
  }
}

\cs_set:Npn \arabicHeiti #1 {#1}

% TODO: custom title
\fancypagestyle{BIThesis}{
  \fancyhf{}
  % 定义页眉、页码
  \fancyhead[C]{\zihao{\int_use:N \g_@@_head_zihao_int}\ziju{0.08}\songti{\tl_use:N \l_@@_style_head_tl}}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  % 页眉分割线稍微粗一些
  \RenewDocumentCommand \headrulewidth {} {0.6pt}
}

\ctexset{chapter={
    number = {\arabicHeiti{ \arabic{chapter} }},
    format = { \l_@@_title_font_cs:n \bfseries \centering \zihao{3}},
    nameformat = {},
    titleformat = {},
    aftername = \hspace{9bp},
    pagestyle = BIThesis,
    beforeskip = 8bp,
    afterskip = 32bp,
    fixskip = true,
  }
}

\ctexset{section={
    number = {\arabicHeiti{\thechapter.\hspace{1bp}\arabic{section}}},
    format = {\l_@@_title_font_cs:n \raggedright \bfseries \zihao{4}},
    nameformat = {},
    titleformat = {},
    aftername = \hspace{8bp},
    beforeskip = 20bp plus 1ex minus .2ex,
    afterskip = 18bp plus .2ex,
    fixskip = true,
  }
}

\ctexset{subsection={
    number = {\arabicHeiti{\thechapter.\hspace{1bp}\arabic{section}.\hspace{1bp}\arabic{subsection}}},
    format = {\l_@@_title_font_cs:n \bfseries \raggedright \zihao{-4}},
    nameformat = {},
    titleformat = {},
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
  \l_@@_unnumchapter_style_cs:n\l_@@_title_font_cs:n{\g_@@_toc_title_tl}
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

  \int_compare:nNnTF {\g_@@_thesis_type_int} = {3}
  {
    \pagenumbering{roman}
  } {
    \pagenumbering{Roman}
  }
  \ctexset{
    chapter = {
      numbering = false,
    }
  }
  \pagestyle{BIThesis}
}

\RenewDocumentCommand \mainmatter {} {
  \ctexset{
    chapter = {
      numbering = true,
    }
  }
  \pagenumbering{arabic}
  \pagestyle{BIThesis}
  % 正文 22 磅的行距
  \setlength{\parskip}{0em}
  \setstretch{1.53}
  % 修复脚注出现跨页的问题
  \interfootnotelinepenalty=10000
}

\RenewDocumentCommand \backmatter {} {
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \ctexset{
    chapter = {
      numbering = false,
      beforeskip = 18bp,
      format = {\l_@@_title_font_cs:n \l_@@_unnumchapter_style_cs:n \centering \zihao{3}},
      afterskip = 26bp,
    }
  }
}

\setlength{\abovecaptionskip}{11pt}
\setlength{\belowcaptionskip}{9pt}

% figure
\cs_set:Npn \thefigure {\thechapter-\arabic{figure}}
\captionsetup[figure]{font=small,labelsep=space}


% table
\cs_set:Npn \thetable {\thechapter-\arabic{table}}
\captionsetup[table]{font=small,labelsep=space,skip=2pt}

% equation
\cs_set:Npn \theequation {\thechapter-\arabic{equation}}

% code snippet
\cs_set:Npn \lstlistingname {\c_@@_name_code_tl}
\cs_set:Npn \thelstlisting {\thechapter-\arabic{lstlisting}}

% 调整底层 TeX 排版引擎参数以保证所有段落能够很好地以两端对齐的方式呈现
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

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

% 调整插图目录与表格目录的标题
\cs_set:Npn \listfigurename {\c_@@_name_figure_tl}
\cs_set:Npn \listtablename {\c_@@_name_table_tl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% user interface.
\DeclareDocumentCommand \BITUndergraduateThesisSetup { m }
  { \keys_set:nn { bitundergrad } { #1 }}

% 35mm
% key
% 78mm
% value
% colon
% zihao
% underline position
% TODO: refactor name.
\cs_new:Npn \g_@@_make_cover_entry_cs:nnnn #1#2#3#4#5#6#7 {
  \zihao{#6}\selectfont{\makebox[#1][r]{#2#5}}\hspace{1ex} \dunderline[#7]{1pt}{\makebox[#3][c]{#4}}\par
}

% TODO: refactor name.
\cs_new:Npn \l_@@_make_cover_entry_a_cs:nn #1#2 {
  \g_@@_make_cover_entry_cs:nnnn {35mm} {#1} {78mm} {#2} {：} {3} {-10pt}
}

% TODO: refactor name.
\cs_new:Npn \l_@@_make_cover_entry_eng_cs:nn #1#2 {
  \g_@@_make_cover_entry_cs:nnnn {20mm} {#1} {105mm} {#2} {:} {4} {-10pt}
}

\cs_new:Npn \@@_master_make_cover_entry:nn #1#2 {
  \g_@@_make_cover_entry_cs:nnnn {40mm} {#1} {60mm} {#2} {\quad} {-3} {-5pt}
}

\cs_new:Npn \@@_master_make_cover_entry_en:nn #1#2 {
  \g_@@_make_cover_entry_cs:nnnn {50mm} {#1} {95mm} {#2} {} {-3} {-5pt}
}

% Usage: \dunderline{<line_thickness>}{<text>}
% \cs_set:Npn \dunderline #1#2 {
%   {
%     \setbox0=\hbox{-10pt}
%     \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
%   }
% }

% #1: position
% #2: line_thickness
% #3: token list
\cs_new:Npn \@@_dunderline:nnn #1#2#3 {
  {\setbox0=\hbox{#3}\ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}
}

\cs_new:Npn \@@_dunderline:nn #1#2 {
  \@@_dunderline:nnn {#1} {1pt} {#2}
}

\cs_new:Npn \@@_dunderline:n #1 {
  \@@_dunderline:nnn {-10pt} {1pt} {#1}
}

\newcommand\dunderline[3][-1pt]{{%
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}}

% 重定义 \tn{cleardoublepage}，使得偶数页面在没有内容时也不显示页眉页脚，见
% \url{https://tex.stackexchange.com/a/1683}。
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g_@@_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }

\cs_new:Npn \make_graduate_cover: {
  \cleardoublepage
  \begin{titlepage}
    \centering
    \vspace*{65mm}
    {\heiti\zihao{-2} \l_bit_title_tl}
    \vskip 60mm
    {\heiti \zihao{-3} \l_bit_name_tl} % 黑体 小三
    \vskip 10mm
    {\heiti \zihao{-3} \l_bit_coverdate_tl} % 黑体 小三
  \end{titlepage}
}

\cs_new:Npn \make_paper_back: {
  \cleardoublepage
  \begin{titlepage}
   \vskip 5cm
   \begin{center}
    \setstretch{1.1}
    \begin{minipage}[t][19.7cm]{2em}
      \begin{center}
        {\heiti\zihao{3}\l_bit_title_tl}
          \vfill
        {\heiti\zihao{3}\l_bit_name_tl}
          \vfill
        {\heiti\zihao{3}\c_@@_name_university_tl}
      \end{center}
    \end{minipage}
   \end{center}
   % \vskip 5cm
  \end{titlepage}
}

\cs_new:Npn \@@_make_chinese_title_page: {
  \cleardoublepage
  \begin{titlepage}
      { %
        {\heiti \zihao{5} \noindent \c_@@_name_classification_tl} \l_@@_info_classification_tl\\
        {\heiti \zihao{5} \c_@@_name_udc_tl}  \l_@@_info_udc_tl
      }
     \begin{center}

      \vskip \stretch{1}
         {\heiti\zihao{-2} \l_bit_title_tl}
      \vskip \stretch{1}

      % TODO: delete this?
      {\fangsong\zihao{4}}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.5}

      {\heiti\zihao{-3}
      \clist_map_inline:nn 
        {
          {\c_@@_graduate_name_author_tl} {\l_bit_name_tl},
          {\c_@@_graduate_name_school_tl} {\l_bit_dept_tl},
          {\c_@@_graduate_name_supervisor_tl} {\l_bit_mentor_tl},
          {\c_@@_graduate_name_chairman_tl} {\l_@@_info_chairman_tl},
          {\c_@@_graduate_name_degree_tl} {\l_@@_info_degree_tl},
          {\c_@@_graduate_name_major_tl} {\l_bit_major_tl},
          {\c_@@_graduate_name_institute_tl} {\l_@@_info_institute_tl},
          {\c_@@_graduate_name_defense_date_tl} {\l_@@_info_defense_date_tl},
         }
        {\@@_master_make_cover_entry:nn ##1}
      }
    \end{center}
    \vskip \stretch{0.5}
  \end{titlepage}
}

\cs_new:Npn \@@_make_english_title_page: {
  \begin{titlepage}
    \begin{center}

    \vspace*{10em}
    {\zihao{-2}\textbf{\l_bit_titleen_tl}}
    % \bfseries
    \vskip \stretch{1}

    {
      \zihao{-3}
      \clist_map_inline:nn 
        {
          {\c_@@_graduate_name_author_en_tl} {\l_@@_info_author_en_tl},
          {\c_@@_graduate_name_school_en_tl} {\l_@@_info_school_en_tl},
          {\c_@@_graduate_name_supervisor_en_tl} {\l_@@_info_supervisor_en_tl},
          {\c_@@_graduate_name_chairman_en_tl} {\l_@@_info_chairman_en_tl},
          {\c_@@_graduate_name_degree_en_tl} {\l_@@_info_degree_en_tl},
          {\c_@@_graduate_name_major_en_tl} {\l_@@_info_major_en_tl},
          {\c_@@_graduate_name_institute_en_tl} {\l_@@_info_institute_en_tl},
          {\c_@@_graduate_name_defense_date_en_tl} {\l_@@_info_defense_date_en_tl},
         }
        {\@@_master_make_cover_entry_en:nn ##1}
      }

    \end{center}

    \vskip \stretch{0.5}
  \end{titlepage}
}

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

          \zihao{-0}\textbf{\ziju{0.12}\songti{\c_@@_bachelor_name_title_tl}}\par

          \vspace{16mm}

          \zihao{2}\textbf{\xihei:n \l_bit_title_tl}\par

          \vspace{3mm}

          \begin{spacing}{1.2}
            \zihao{3}\selectfont{\textbf{\l_bit_titleen_tl}}\par
          \end{spacing}

          \vspace{15mm}


          \begin{spacing}{1.8}
            \begin{center}
              \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_school_tl} {\l_bit_dept_tl}
              \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_major_tl} {\l_bit_major_tl}
              \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_author_tl} {\l_bit_name_tl}
              \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_student_id_tl} {\l_bit_studentid_tl}
              \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_supervisor_tl} {\l_bit_mentor_tl}

              \tl_if_blank:VTF \l_bit_externalmentor_tl {} {
                % 生成校外毕设封面字段
                  \l_@@_make_cover_entry_a_cs:nn {\c_@@_name_co_supervisor_tl} {\l_bit_externalmentor_tl}
              }
            \end{center}
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

          \zihao{2}\textbf{\xihei:n \l_bit_title_tl}\par

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
      {3} {
        \begin{titlepage}
          \vspace*{16mm}

          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=9.87cm]{\l_bit_coverheaderimage_tl}\\
          }

          \vspace*{-3mm}

          \zihao{1}\textbf{\ziju{0.12}Beijing\nobreak{~}Institute\nobreak{~}of\nobreak{~}Technology~Bachelor's~Thesis}\par

          \vspace{18mm}

          \zihao{2}\textbf{\xihei:n \l_bit_titleen_tl}\par

          \vspace{10mm}


          \begin{spacing}{1.8}
            \begin{center}
              \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_school_en_tl} {\l_bit_dept_tl}
              \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_major_en_tl} {\l_bit_major_tl}
              \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_author_en_tl} {\l_bit_name_tl}
              \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_student_id_en_tl} {\l_bit_studentid_tl}
              \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_supervisor_en_tl} {\l_bit_mentor_tl}

              \tl_if_blank:VTF \l_bit_externalmentor_tl {} {
                % 生成校外毕设封面字段
                  \l_@@_make_cover_entry_eng_cs:nn {\c_@@_name_co_supervisor_en_tl} {\l_bit_externalmentor_tl}
              }
            \end{center}
          \end{spacing}

          \vspace*{\fill}
          \centering
          \zihao{3}\ziju{0.5}\songti{\today}
        \end{titlepage}
      }
      {4} {
        \make_graduate_cover:
      }
      {5} {
        \make_graduate_cover:
      }
    }
    \group_end:
  }

% 圆形数字编号定义
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
  {\node[shape = circle, draw, inner~sep = 1pt]
  (char) {\phantom{\ifblank{#1}{#2}{#1}}};
  \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

\cs_new:Npn \@@_graduate_originality: {
  \ctexset {
    chapter / pagestyle = plain,
  }

  \begin{titlepage}
    \pagenumbering{gobble}

    % 原创性声明部分
    \begin{center}
      \let\clearpage\relax
      % TODO: 这里
      \chapter*{\heiti\zihao{3}\c_@@_graduate_name_originality_tl}
    \end{center}~\par

    % 本部分字号为小三
    \zihao{4}
    \c_@@_graduate_name_originality_clause_tl

    \vspace{17mm}

    \begin{flushright}
      \c_@@_graduate_name_originality_author_signature_tl\par
    \end{flushright}

    \vspace{16mm}

    % 使用授权声明部分
    \begin{center}
      \let\clearpage\relax
      \chapter*{\heiti\zihao{3}\c_@@_graduate_name_authorization_tl}
    \end{center}~\par

    \c_@@_graduate_name_authorization_clause_tl

    \vspace*{15mm}

    \begin{flushright}
      \begin{spacing}{1.65}
        \zihao{4}
        % \hspace{5mm}\raisebox{-2ex}{\includegraphics[width=30mm]{example-image}}\hspace{5mm}
        \c_@@_graduate_name_originality_author_signature_tl\par
        \c_@@_graduate_name_originality_supervisor_signature_tl\par
      \end{spacing}
    \end{flushright}
  \end{titlepage}
}

\NewDocumentCommand \MakeOriginality {} 
{
  \group_begin:
    \int_case:nn {\g_@@_thesis_type_int}
    {
      {1} 
      {
        \pagestyle{BIThesis}
        \pagenumbering{gobble}

        % 原创性声明部分
        \begin{center}
          \vspace*{-2bp}
          \let\clearpage\relax
          \chapter*{\heiti\zihao{2}\c_@@_bachelor_name_originality_tl}
        \end{center}~\par

        % 本部分字号为小三
        \zihao{-3}
        \c_@@_bachelor_name_originality_clause_tl

        \vspace{17mm}

        \begin{flushright}
          \c_@@_bachelor_name_originality_author_signature_tl\par
        \end{flushright}

        \vspace{16mm}

        % 使用授权声明部分
        \begin{center}
          \let\clearpage\relax
          \chapter*{\heiti\zihao{2}\c_@@_bachelor_name_authorization_tl}
        \end{center}~\par

        \c_@@_bachelor_name_authorization_clause_tl

        \vspace*{3mm}

        \begin{flushright}
          \begin{spacing}{1.65}
            \zihao{-3}
            % \hspace{5mm}\raisebox{-2ex}{\includegraphics[width=30mm]{example-image}}\hspace{5mm}
            \c_@@_bachelor_name_originality_author_signature_tl\par
            \c_@@_bachelor_name_originality_supervisor_signature_tl\par
          \end{spacing}
        \end{flushright}

        \newpage
      }
      {3} {
        \setstretch{1.26}
        % 原创性声明部分
        \begin{center}
          \vspace*{-2bp}
          \let\clearpage\relax
          \chapter*{\heiti\zihao{-2}\c_@@_bachelor_english_name_originality_tl}
        \end{center}~\par

        % 本部分字号为小三
        \zihao{-4}
        \c_@@_bachelor_english_name_originality_clause_tl

        \bigbreak

        Student~(Signature):~\dunderline[-1pt]{1pt}{\makebox[18mm]{}}~Date:\par

        \vspace{6mm}

        % 使用授权声明部分
        \begin{center}
          \let\clearpage\relax
          \chapter*{\heiti\zihao{-2}\c_@@_bachelor_english_name_authorization_tl}
        \end{center}~\par

        \c_@@_bachelor_english_name_authorization_clause_tl

        \bigbreak
        Student~(Signature):~\dunderline[-1pt]{1pt}{\makebox[18mm + 16bp]{}}~\hspace{2mm}Date:\par
        Supervisor~(Signature):~\dunderline[-1pt]{1pt}{\makebox[18mm]{}}~\hspace{2mm}Date:\par


        \newpage
      }
      {4} {\@@_graduate_originality:}
      {5} {\@@_graduate_originality:}
    }
  \group_end:
}

\NewDocumentCommand \MakePaperBack {}
  {
    \make_paper_back:
  }

\NewDocumentCommand \MakeTitle {}
  {
    \@@_make_chinese_title_page:
    \@@_make_english_title_page:
  }

\DeclareDocumentCommand \MakeTOC {}
  {
    {
      \renewcommand{\baselinestretch}{1.35}
      % 目录
      \tableofcontents

      % 在本科生全英文模板中，添加「目录」本身到目录中。
      \@@_if_thesis_int_type:nT {3} {
        \addcontentsline{toc}{chapter}{\c_@@_name_toc_en_tl}
      }

      \newpage
    }
  }

  % TODO:
  \NewDocumentEnvironment {abstract} {}
  {
    \setstretch{1.53}

    \begin{center}
      \vspace*{-17bp}
      \heiti\zihao{-2}\textbf{
        \int_case:nn {\g_@@_thesis_type_int}
        {
          {1} {\l_bit_title_tl}
          {2} {\l_@@_info_trans_title_tl}
          {3} {\l_bit_title_tl}
        }
      }
    \end{center}

    \vspace*{2mm}

    {\let\clearpage\relax \chapter*{\textmd{\c_@@_name_abstract_tl}}}
    \addcontentsline{toc}{chapter}{\c_@@_name_abstract_tl}

    \vspace*{1mm}

    \par
  }
  {
    \vspace{4ex}\noindent\textbf{\heiti \c_@@_name_keywords_tl \l_@@_info_keywords_tl}\par
    \newpage
  }

  \NewDocumentEnvironment {abstract*} {}
  {
    \setstretch{1.53}
    \begin{spacing}{0.95}
      \centering
      \vspace*{-2bp}

      \int_compare:nNnTF {\g_@@_thesis_type_int} = {3}
      {
        \arialfamily\zihao{-2}\textbf\l_bit_titleen_tl\\
      } {
        \heiti\zihao{3}\textbf\l_bit_titleen_tl\\
      }
    \end{spacing}

    \int_compare:nNnTF {\g_@@_thesis_type_int} = {3}
    {
      \ctexset{
        chapter = {
          numbering = false,
          titleformat = {\heiti\zihao{3}\centering\textbf},
        }
      }
    } {
      \ctexset{
        chapter = {
          numbering = false,
          titleformat = {\heiti\zihao{-3}\centering\textmd},
        }
      }
    }

    \vspace*{10mm}

    {
      \let\clearpage\relax
      \chapter{\c_@@_name_abstract_en_tl}
    }

    % \setlength{\parskip}{0em}\par
  }
  {
    \par\vspace{3ex}\noindent\textbf{\c_@@_name_keywords_en_tl \l_@@_info_keywords_en_tl}
    \newpage
  }

% after \backmatter
  \NewDocumentEnvironment {conclusion} {}
  {
    \ctexset{
      section/number = \arabic{section}
    }

    \int_compare:nNnTF {\g_@@_thesis_type_int} < {3} 
    {
      \chapter{\c_@@_name_conclusion_tl}
    } {
      \chapter{\c_@@_name_conclusion_en_tl}
    }
  }
  {}

% after backmatter
  \NewDocumentEnvironment {bibprint} {}
  {
    % 设置参考文献字号为 5 号
    \renewcommand*{\bibfont}{\zihao{5}}
    % 设置参考文献各个项目之间的垂直距离为 0
    \setlength{\bibitemsep}{0ex}
    \setlength{\bibnamesep}{0ex}
    \setlength{\bibinitsep}{0ex}
    \@@_if_graduate:TF {
    } {
      % 「本科生」设置单倍行距
      \renewcommand{\baselinestretch}{1.2}
    }
    % 设置参考文献顺序标签 `[1]` 与文献内容 `作者. 文献标题...` 的间距
    \setlength{\biblabelsep}{1.7mm}
    % 设置参考文献后文缩进为 0（与 Word 模板保持一致）
    \RenewDocumentCommand \itemcmd {} {
      \addvspace{\bibitemsep} % 恢复 \bibitemsep 的作用
      \mkgbnumlabel{\printfield{labelnumber}}
      \hspace{\biblabelsep}
    }
    \chapter{\c_@@_name_reference_tl}
  }
  {}

  % #1: The name that used as chapter title
  % #2: The name that used in ToC.
  \NewDocumentEnvironment {appendices} { oo }
  {
    % Used in chapter, ToC.
    \tl_new:N \l_@@_appendix_plain_name_tl
    % Used before reference label.
    \tl_new:N \l_@@_appendix_title_tl

    \int_compare:nNnTF {\g_@@_thesis_type_int} = {3} 
    {
      \tl_set:Nn \l_@@_appendix_plain_name_tl {\c_@@_name_appendix_prefix_en_tl}
      \tl_set:Nn \l_@@_appendix_title_tl {\c_@@_name_appendix_en_tl}
    } {
      \tl_set:Nn \l_@@_appendix_plain_name_tl {\c_@@_name_appendix_prefix_tl}
      \tl_set:Nn \l_@@_appendix_title_tl {\c_@@_name_appendix_tl}
    }

    \ctexset{
      section/number = \l_@@_appendix_plain_name_tl\hspace{1ex}\Alph{section},
      subsection/number = \Alph{section}. \arabic{subsection},
    }

    \IfValueTF {#1} {
      \chapter*{#1}
      \stepcounter{chapter}
      \IfValueTF {#2} {
        \addcontentsline{toc}{chapter}{#2}
      } {
        \addcontentsline{toc}{chapter}{\l_@@_appendix_title_tl}
      }
    } {
      \chapter{\l_@@_appendix_title_tl}
    }

    \cs_set:Npn \thechapter {
      \Alph{section}
    }
  }
  {}

  \NewDocumentEnvironment {acknowledgements} {}
  {
    \ctexset{
      section/number = \arabic{section},
      subsection/number = \arabic{section}. \arabic{subsection},
    }

    \int_compare:nNnTF {\g_@@_thesis_type_int} = {3} 
    {
      \chapter{\c_@@_name_ack_en_tl}
    } {
      \chapter{\c_@@_name_ack_tl}
    }
  }
  {}

  \NewDocumentEnvironment {publications} {}
  {
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
    % ===== 上方定义与「参考文献」部分相同
    \newrefcontext[sorting=ynt]
    \chapter{\c_@@_name_publications_tl}
  }
  {}

  \NewDocumentEnvironment {resume} {}
  {
    \chapter{\c_@@_name_resume_tl}
  }
  {}

  \NewDocumentEnvironment {symbols} {}
  {
    \chapter{\c_@@_name_symbols_tl}
  }
  {}
