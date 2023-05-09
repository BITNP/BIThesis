%%
%% This is file `bitbeamer.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bithesis.dtx  (with options: `cls,beamer')
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
\ProvidesExplClass{bitbeamer}
{2023-05-01}{3.5.4}{BIT Thesis Templates}
\keys_define:nn { bitbeamer }
  {
    titlegraphic .tl_set:N = \l_bit_titlegraphic_tl,
    framelogo .tl_set:N = \l_bit_framelogo_tl,
  }
\ProcessKeysOptions { bitbeamer }
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexbeamer}
}
\ProcessOptions\relax
\LoadClass{ctexbeamer}
\RequirePackage{xeCJKfntef}
\RequirePackage{tikz}
\usetheme{Madrid}
\definecolor{bitred}{HTML}{A13E0B}
\definecolor{bitgreen}{HTML}{0A8F30}
\definecolor{bitdarkgreen}{HTML}{005B30}
\colorlet{beamer@blendedblue}{bitdarkgreen}
\cs_new:Npn \CJKhl:nn #1 #2
  { \CJKsout*[thickness=2.5ex, format=\color{#1}]{#2} }
\tl_if_empty:NF \l_bit_titlegraphic_tl {
  % BIT Logo
  \titlegraphic{
      \includegraphics[width=2cm]{\l_bit_titlegraphic_tl}
  }
}
\tl_if_empty:NF \l_bit_framelogo_tl {
  \addtobeamertemplate{frametitle}{}{%
    \begin{tikzpicture}[remember~picture,overlay]
      \node[anchor=north~east,yshift=2pt] at (current~page.north~east)
        {\includegraphics[height=0.8cm]{\tl_use:N \l_bit_framelogo_tl}};
    \end{tikzpicture}
  }
}
\cs_new_eq:NN \CJKhl \CJKhl:nn
\endinput
%%
%% End of file `bitbeamer.cls'.
