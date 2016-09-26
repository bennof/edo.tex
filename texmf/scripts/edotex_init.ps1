echo "Edo.TeX 2016"
echo "-fmt=fmt -output-format=pdf"
$env:TEXINPUTS   = "$pwd\texmf\tex\edo"
$env:TEXFORMATS  = "$pwd\texmf\tex\edo"
$env:ENCFONTS    = "$pwd\texmf\fonts\enc"
$env:TFMFONTS    = "$pwd\texmf\fonts\tfm"
$env:TEXFONTMAPS = "$pwd\texmf\fonts\map"
$env:T1FONTS     = "$pwd\texmf\fonts\type1"
.\bin\pdftex.exe --ini --recorder --file-line-error edo.pdf.tex
move -force edo.pdf.fmt .\texmf\tex\edo\
echo "Edo.pdf.tex build" 
