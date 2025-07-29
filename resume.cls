\ProvidesClass{resume}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} 
\ProcessOptions\relax
\LoadClass{article} 
\usepackage[parfill]{parskip}
\usepackage[dvipsnames]{xcolor}
\usepackage{array}
\usepackage{ifthen} 
\usepackage{setspace}
\usepackage{geometry}
\usepackage{hyperref}
\usepackage{graphicx}
\pagestyle{empty} 

\hypersetup{
    colorlinks=true,
    linkcolor=PineGreen,
    filecolor=PineGreen,      
    urlcolor=PineGreen,
}

\geometry{
    top=0.2in, 
    bottom=0in,
    left=0.3in,
    right=0.3in,
}

\newcommand{\name}[1]{\renewcommand{\name}{#1}}
\newcommand{\linksep}{$\bullet$}

\let \@linkone \relax
\let \@linktwo \relax
\let \@linkthree \relax

\newcommand{\links}[1]{
    \@ifundefined{@linkone}{
        \def \@linkone {#1}
    }{
        \@ifundefined{@linktwo}{ 
            \def \@linktwo {#1}
        }{
            \@ifundefined{@linkthree}{ 
                \def \@linkthree {#1}
                
            }{
                 \def \@linkfour {#1}
            }
        }
        
    }
}

\newcommand{\printname}{
    \begingroup
        \hfil{\Huge\bfseries\name}\hfil
        \break 
    \endgroup
}

\newcommand{\printlink}{
    \begingroup
        {\centerline{\@linkone \ \linksep  \ \@linktwo \ \linksep \ \@linkthree \ \linksep \ \@linkfour}}
    \endgroup
}

\let\ori@document=\document 
\renewcommand{\document}{
    \ori@document
    \printname 
    \smallskip
    \printlink

    \hrule
}

\newenvironment{rSection}[1]{ 
    \textcolor{PineGreen}{\MakeUppercase{\large\textbf{#1}}}
    \vspace{-0.8em}
    \begin{list}{}{ 
        \setlength{\leftmargin}{1em}
    }
    \item[] 
    \vspace{0.4em}
    }{
    \end{list}
    \vspace{0.1em}
}


\newenvironment{rSubsection}[2]{%
    \textbf{#1} \hfill {#2}%
    \vspace{-0.5em}
    \begin{list}{$\cdot$}{%
        \leftmargin=1em
        \itemsep=0.3em % Adjust space between items here
        \setstretch{0.5}
        \parsep=0em % Adjust space between paragraphs within an item here
        \topsep=-0.2em % Adjust space between the title and the first item
    }%
}{%
    \end{list}
}


\newenvironment{rOthers}[2]{ 
    {#1} \hfill{#2}
    \vspace{-0.5em}
}{
}

\newenvironment{rAwards}[4]{ 
    {#1} \href{#2}{#3} \hfill{#4}
    \vspace{-0.5em}
}{
}