#!/bin/sh
echo "Edo.TeX 2018"
TEXINPUTS=$(pwd)/texmf/tex/edo export TEXINPUTS
TEXFORMAT=$(pwd)/texmf/tex/edo export TEXFORMAT
ENCFONTS=$(pwd)/texmf/fonts/enc export ENCFONTS
TFMFONTS=$(pwd)/texmf/fonts/tfm export TFMFONTS
TEXFONTMAPS=$(pwd)/texmf/fonts/map export TEXFONTMAPS
T1FONTS=$(pwd)/texmf/fonts/type1 export T1FONTS

echo $TFMFONTS

pdftex --ini --recorder --file-line-error texmf/tex/edo/edo.pdf.tex
mv -f edo.pdf.fmt ./texmf/tex/edo/

echo "Edo.pdf.tex build" 

cat <<EOF > ./bin/edotex
echo "Edo.TeX 2018"
TEXINPUTS=.:$(pwd)/texmf/tex/edo export TEXINPUTS
TEXFORMAT=$(pwd)/texmf/tex/edo export TEXFORMAT
ENCFONTS=$(pwd)/texmf/fonts/enc export ENCFONTS
TFMFONTS=$(pwd)/texmf/fonts/tfm export TFMFONTS
TEXFONTMAPS=$(pwd)/texmf/fonts/map export TEXFONTMAPS
T1FONTS=$(pwd)/texmf/fonts/type1 export T1FONTS
pdftex -fmt $(pwd)/texmf/tex/edo/edo.pdf \$@
EOF
chmod u+x ./bin/edotex
echo "Add $(pwd)/bin to your PATH" 
