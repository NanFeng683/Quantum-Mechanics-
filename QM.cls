\ProvidesClass{QM}[Quantum Mechanics]
\NeedsTeXFormat{LaTeX2e}

\ProcessOptions\relax
\LoadClass[openany,twoside,scheme=chinese,fontset=none]{ctexbook}

% ----------------------------------------------------------
% 基本设置
% ----------------------------------------------------------

% 页面、版心 %% 后方为原数据
\RequirePackage{geometry}
\geometry{
  paperheight=203mm, % 203mm
  paperwidth=140mm,  % 140mm
  top=25.4mm,          % 27mm
  bottom=19.8mm,     % 19.8mm
  left=20mm,         % 21mm
  right=20mm,        % 15mm
  footskip=12mm      % 10mm
}

% 中文行距 1.5


% 英文字体
\setmainfont{XITS}

% 中文字体，使用方正书宋、黑体、楷体、仿宋、霞鹜文楷等免费字体，采用思源字体作为书宋和黑体粗体
\setCJKmainfont[
  BoldFont=Source Han Serif SC Bold,
  ItalicFont=FZKai-Z03
]{FZShuSong-Z01}
\setCJKsansfont[
  BoldFont=Source Han Sans SC
]{FZHei-B01}
\setCJKmonofont{FZFangSong-Z02}

% 字体
\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhxbs}{Source Han Serif SC Bold}
\setCJKfamilyfont{zhdbs}{Source Han Serif SC Heavy}
\setCJKfamilyfont{zhhei}{FZHei-B01}
\setCJKfamilyfont{zhdh}{Source Han Sans SC}
\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
\setCJKfamilyfont{zhkai}{FZKai-Z03}
\setCJKfamilyfont{zhNkai}{FZNewKai-Z03}
\setCJKfamilyfont{zhXYkai}{LXGWWenKai-Bold}


\newcommand{\songti}{\CJKfamily{zhsong}}
\newcommand{\xbsong}{\CJKfamily{zhxbs}}
\newcommand{\dbsong}{\CJKfamily{zhdbs}}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\newcommand{\dahei}{\CJKfamily{zhdh}}
\newcommand{\fangsong}{\CJKfamily{zhfs}}
\newcommand{\kaishu}{\CJKfamily{zhkai}}
\newcommand{\Nkaishu}{\CJKfamily{zhNkai}}
\newcommand{\ykai}{\CJKfamily{zhXYkai}}

% 汉字效果，着重号等
\RequirePackage{CJKfntef}

% ----------------------------------------------------------
% 版式
% ----------------------------------------------------------

% PDF 整页
\RequirePackage{pdfpages}

% 版式风格
\RequirePackage{fancyhdr}

% plain 版式，章标题页
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[RO,LE]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
% heading 版式，正文普通页
\fancypagestyle{heading}{
  \fancyhf{}
  \fancyhead[CE]{\zihao{6}\leftmark} 
  \fancyhead[CO]{\zihao{6}\rightmark} 
  \fancyhead[RO,LE]{\zihao{-5}\thepage} 
  \renewcommand{\headrulewidth}{0.25mm}  
  \renewcommand{\footrulewidth}{0pt} 
}
% foreword 版式，前言、目录、序等页
\fancypagestyle{foreword}{
  \fancyhf{}
  \fancyfoot[RO,LE]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
% 全文尺寸
\RequirePackage[fontsize=9pt]{fontsize}

% 章节标题设置
\ctexset{
  %contentsname=~\vspace{-2em}\\\makebox[5][s]{目录}\vspace{-1em},
  chapter={
    nameformat=\zihao{4}\fangsong,
    aftername=\vspace{0.7em}\break,
    titleformat=\zihao{-3},
    beforeskip=1em,
    afterskip=2em,
   },
  section={
    %number={\arabic{chapter}$\cdot$\arabic{section}},
    format=\centering\zihao{5}\kaishu,
    beforeskip=1.2em,
    afterskip=1em,
    name={$\S$,}
   }
}


% 章节标题加*
\RequirePackage{zhlipsum}

\ExplSyntaxOn
\NewDocumentCommand \starthis { s m s o +m }
  {
    \group_begin:
    \exp_args:Nnf \cs_set:cpn { the \cs_to_str:N #2 } 
      { 
        \exp_after:wN \exp_after:wN \exp_after:wN 
        \exp_stop_f: \cs:w the \cs_to_str:N #2 \cs_end: * 
      }
    \IfBooleanT {#1}
      {
        \exp_args:Nnf \cs_set:cpn { CTEXthe \cs_to_str:N #2 } 
          { 
            \exp_after:wN \exp_after:wN \exp_after:wN 
            \exp_stop_f: \cs:w CTEXthe \cs_to_str:N #2 \cs_end: * 
          }
      }
    \IfBooleanTF {#3}
      { \IfValueTF {#4} { #2 * [#4] } { #2 * } }
      { \IfValueTF {#4} { #2   [#4] } { #2   } }
      {#5}
    \group_end:
  }
\ExplSyntaxOff

% 目录
\RequirePackage[subfigure]{tocloft}
\tocloftpagestyle{foreword}
\renewcommand{\contentsname}{\bfseries\zihao{-3}\hfill\makebox[5em][s]{目录}\hfill\vspace{-1em}}
\renewcommand{\cftchapfont}{\heiti\zihao{-5}}
\renewcommand{\cftsecfont}{\zihao{-5}}
\renewcommand{\cftdot}{\ensuremath{\cdots}}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchapdotsep}{0}
\cftbeforetoctitleskip=2em
\cftaftertoctitleskip=6em
\cftbeforechapskip=-0.14em
\cftbeforesecskip=-0.14em

% 思考题，按节处理
\newcounter{question}[chapter]
\newcommand{\question}{\stepcounter{question}\par\thequestion .}
\newenvironment{questions}{
  \refstepcounter{section}
  \addcontentsline{toc}{section}{思考题}
  \setcounter{question}{0}
  \begin{center}\textsf{\makebox[5em][s]{思考题}}\end{center}
  \fangsong
}{\normalfont}

% 习题，按节处理
\newcounter{exercise}[chapter]
\newcommand{\exercise}{\stepcounter{exercise}\par\theexercise .}
\newenvironment{exercises}{%
  \refstepcounter{section}
  \addcontentsline{toc}{section}{习题}
  \setcounter{exercise}{0}
  \begin{center}\textsf{\makebox[5em][s]{习题}} \end{center}
  \fangsong
}{\normalfont}

% ----------------------------------------------------------
% 数学排版
% ----------------------------------------------------------
% 公式缩进
\RequirePackage[fleqn]{amsmath}
\setlength{\mathindent}{9em} % 6em

% 公式加框
\newcommand*\widefbox[1]{\fbox{\hspace{2em}#1\hspace{2em}}}

% 随时调整缩进
\newcommand{\eqindent}[1]{\setlength{\mathindent}{#1em}}

% 恢复正常缩进
\newcommand{\eqnormal}{\setlength{\mathindent}{9em}}

% ----------------------------------------------------------
% 快捷缩进

% 略长公式
\newcommand{\eqlong}{\setlength{\mathindent}{6em}}
% 长公式
\newcommand{\eqllong}{\setlength{\mathindent}{4em}}
% 特长公式
\newcommand{\eqlllong}{\setlength{\mathindent}{2em}}
% 短公式
\newcommand{\eqshort}{\setlength{\mathindent}{12em}}
% ----------------------------------------------------------

% 公式按节编号
\numberwithin{equation}{section}  % 标明章节


% 行距调整
\RequirePackage{zhlineskip}
\SetMathEnvironmentSinglespace{1.05}

% 部分分栏
\RequirePackage{multicol}

% 符号
\RequirePackage{yhmath}
\RequirePackage{unicode-math}
\RequirePackage{scalerel}
\RequirePackage{amssymb}
\RequirePackage{pifont}


% λ bar
\RequirePackage{tipa}
\newcommand{\lambdabar}{\mbox{\textipa{\textcrlambda}}}

% 实部虚部符号

\newcommand{\lm}{\operatorname{Im}}
\newcommand{\Rel}{\operatorname{Re}}
\newcommand{\RE}{\operatorname{Re}}

\AtBeginDocument{\renewcommand{\Re}{\operatorname{Re}}}


% 罗马字符
\newcommand{\rmnum}[1]{\romannumeral #1}
\newcommand{\Rmnum}[1]{\expandafter\@slowromancap\romannumeral #1@}

% 换行
\newcommand{\subtitle}[1]{\vspace{-1.56em}\xbsong\centerline{#1}\normalfont\par\null}
\newcommand{\xsection}[1]{\pskip{\heiti #1}\pskip}
\newcommand{\fspace}[1][1em]{\hspace{#1}}
\newcommand{\pskip}[1][0.75em]{\vspace{#1}}

% 数学字体
\setmathfont[
  StylisticSet=8 % 直立积分符号
]{XITS Math}

\RequirePackage{etoolbox}
% 公式前导文本， align 环境
\makeatletter
\newif\if@gather@prefix
\preto\place@tag@gather{%
  \if@gather@prefix
    \iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}%
      \kern\gdisplaywidth@
    \fi
  \fi
}
\appto\place@tag@gather{%
  \if@gather@prefix
    \iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}%
      \kern\displaywidth
    \fi
  \fi
  \global\@gather@prefixfalse
}
\preto\place@tag{%
  \if@gather@prefix
    \iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}%
      \kern\displaywidth@
    \fi
  \fi
}
\appto\place@tag{%
  \if@gather@prefix
    \iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}%
      \kern\displaywidth
    \fi
  \fi
  \global\@gather@prefixfalse
}
\def\math@cr@@@align{%
  \ifst@rred\nonumber\fi
  \if@eqnsw \global\tag@true \fi
  \global\advance\row@\@ne
  \add@amps\maxfields@
  \omit
  \kern-\alignsep@
  \if@gather@prefix\tag@true\fi
  \iftag@
    \setboxz@h{\@lign\strut@{\make@display@tag}}%
    \place@tag
  \fi
  \ifst@rred\else\global\@eqnswtrue\fi
  \global\lineht@\z@
  \cr
}
\newcommand*{\beforetext}[1]{%
  \ifmeasuring@\else
    \gdef\gather@prefix{#1}%
    \global\@gather@prefixtrue
  \fi
}
\makeatother

% 向量格式
\renewcommand{\vec}[1]{{\symbfsf {#1}}}
% 求导符号
\newcommand{\dif}{\mathop{}\!\symrm{d}}
% 数学模式连字符
\mathchardef\mathdash="2D

% 数学常数与设定数
%\newcommand{\e}{\mathrm e}
\def\e{\ell} % 文中特殊e的替换


% 例、解、讨论
\newcounter{exa}[chapter]
\newcommand{\exa}{\textsf{\stepcounter{exa}例~\theexa\quad}}
\newcommand{\theo}{\textsf{\stepcounter{exa}定理~\theexa\quad}}
\newcounter{example}[chapter]
%\newcommand{\example}{\stepcounter{example}【例~\theexample】\quad}
\newcommand{\example}{\textsf{\stepcounter{example}例\quad}}
\newcommand{\solution}{\textsf{解：}\quad}
\newcommand{\prove}{证：\quad}
\newcommand{\resolve}{\solution}
\newcommand{\discussion}{\heiti 讨论~\normalfont}
\newcommand{\theorem}{\textsf{\stepcounter{example}定理\quad}}



% ----------------------------------------------------------
% 页面元素
% ----------------------------------------------------------

% 书签、链接
\RequirePackage{hyperref}
\hypersetup{
  hidelinks,
  colorlinks=true,
  allcolors=black,
  pdfstartview=Fit,
  breaklinks=true,
  bookmarksnumbered=true, 
  pdftitle=量子力学, 
  %pdfpagelabels=true
}
\RequirePackage{bookmark}

% 摘录
\RequirePackage[
  leftmargin=2em,
  rightmargin=2em,
  font={fangsong},
  vskip=0pt
]{quoting}

% 图形
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}

% 表格
\RequirePackage{tabularray}
\RequirePackage{tabularx}
%%
\newcolumntype{L}{>{\RaggedRight\hangafter=1\hangindent=0em}X}
%%
\RequirePackage{multirow}
%\UseTblrLibrary{amsmath}
\UseTblrLibrary{siunitx}
\UseTblrLibrary{booktabs}
% 自定义格式
\NewColumnType{Z}[1][]{Q[co=1,si,#1]}

% 图表标题
\RequirePackage{caption}
\DeclareCaptionFormat{table}{\heiti\zihao{-5}#1#2#3}
\captionsetup[table]{%
  position=above,
  format=table,
  skip=0.2em,
  labelsep=quad
}
\captionsetup[figure]{%
  position=below,
  format=hang,
  font=small,
  skip=0.5em,
  labelsep=quad
}

% ----------------------------------------------------------
% 注释
% ----------------------------------------------------------
% 星号脚注
\newcommand\sbfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{\fnsymbol{footnote}}
  \footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% 无标号脚注
\newcommand\blfootnote[1]{%
    \begingroup%
    \renewcommand\thefootnote{}\footnote{#1}%
    \addtocounter{footnote}{-1}%
    \endgroup%
}

% ----------------------------------------------------------
% 额外宏包
% ----------------------------------------------------------
\RequirePackage{mathtools}
\RequirePackage{mhchem}


% ----------------------------------------------------------
% 自定义命令
% ----------------------------------------------------------
% 旧式正切余切函数名 tan cot tanh coth arctan arccot
\newcommand{\sh}{\operatorname{sh}}
\newcommand{\ch}{\operatorname{ch}}
\renewcommand{\th}{\operatorname{th}}
\newcommand{\tg}{\operatorname{tg}}
\newcommand{\ctg}{\operatorname{ctg}}
\newcommand{\tgh}{\operatorname{tgh}}
\newcommand{\ctgh}{\operatorname{ctgh}}
\newcommand{\arctg}{\operatorname{arctg}}
\newcommand{\arcctg}{\operatorname{arcctg}}

\newcommand{\lbr}{\ensuremath{\lbrbrak}}
\newcommand{\rbr}{\ensuremath{\rbrbrak}}
\newcommand{\lhbrak}{\ensuremath{\lbrbrak}}
\newcommand{\rhbrak}{\ensuremath{\rbrbrak}}