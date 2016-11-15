## LaTeX Europass template - hrvatski prijevod ##
S obzirom da neslužbena [LaTeX klasa za izradu životopisa u Europass formatu](http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/) nije dostupna za hrvatski jezik (ili je moja *google-fu* sposobnost zakržljala :) ), odlučio sam napraviti prilagodbu iste za hrvatski jezik. Ispostavilo se da je postupak relativno jednostavan pa sam ga odlučio dokumentirati ovdje, za slučaj da se nađe još netko s istim problemom. (odnosi se na LaTeX klasu, ne autora - *op.ur.*)

Postupak je testiran na Ubuntu GNU/Linux distribuciji s *texlive* paketom, standardni YMMV *disclaimer* i dalje vrijedi. U mom slučaju, potrebni paketi instalirani su naredbom

    sudo apt-get install gedit-latex-plugin texlive-lang-european texlive-formats-extra texlive-latex-extra

Za rad s LaTeX dokumentima koristim *gedit-ov* LaTeX *plugin*, pa je zato naredba takva.

Europass klasu potom je potrebno upoznati s činjenicom da postoji novi prijevod, koji se u ovom slučaju naziva *croatian*. Potrebne su izmjene u datoteci *europecv.cls*, puna putanja do nje je

    /usr/share/texlive/texmf-dist/tex/latex/europecv/europecv.cls

a sadržaj koji je potrebno dodati je

    \DeclareOption{croatian}{%
      \AtEndOfPackage{%
        \InputIfFileExists{ecvhr.def}{}{%
        \ClassWarningNoLine{europecv}{Croatian definition file 'ecvhr.def' not found}}%
      }%
    }

Ja sam ga dodao na linije 31-36, ali moguće su i druge lokacije nakon *% Set language* komentara.

Da stvari budu jednostavnije, priložen je jednostavni *Makefile*, pa je samo potrebno instalirati *prerequisite* i pokrenuti

    make

te naravno popuniti životopis (*cv_template_hr.tex*) svojim podacima odnosno prema potrebi kreirati datoteku *publications.bib* koja će sadržavati popis objavljenih stručnih ili znanstvenih radova koji će biti uključen u životopis.
