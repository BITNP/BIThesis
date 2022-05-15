\RequirePackage{expl3, l3keys2e}
\ProvidesExplClass{bitbeamer}{
  2022-05-15
}{0.0.1}{BIThesis beamer class}

% Define our keyvalues
\keys_define:nn { bitbeamer }
  {
    titlegraphic .tl_set:N = \l_bit_titlegraphic_tl,
    framelogo .tl_set:N = \l_bit_framelogo_tl,
  }
\ProcessKeysOptions { bitbeamer }

% Pass every option not explicitly defined to `ctexbeamer`.
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{ctexbeamer}
}
% Executes the code for each option.
\ProcessOptions\relax

% Load
\LoadClass{ctexbeamer}

\RequirePackage{xeCJKfntef}
\RequirePackage{tikz}

\cs_new:Npn \CJKhl:nn #1 #2
  { \CJKsout*[thickness=2.5ex, format=\color{#1}]{#2} }

% Set header if logo path is provided. 
\tl_if_empty:NF \l_bit_titlegraphic_tl {
  % BIT Logo
  \titlegraphic{
      \includegraphics[width=2cm]{\l_bit_titlegraphic_tl}
  }
}

% Set title logo if logo path is provided.
\tl_if_empty:NF \l_bit_framelogo_tl {
  \addtobeamertemplate{frametitle}{}{%
    \begin{tikzpicture}[remember~picture,overlay]
      \node[anchor=north~east,yshift=2pt] at (current~page.north~east) {\includegraphics[height=0.8cm]{\tl_use:N \l_bit_framelogo_tl}};
    \end{tikzpicture}
  }
}

% Expose command to user.
\cs_new_eq:NN \CJKhl \CJKhl:nn
