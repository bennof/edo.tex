# Batch build file 
# Copyright 2018 Benjamin Benno Falkner

>output.log (

echo Building Edo.TeX at %~dp0
setx EDOTEX      "%~dp0"
setx TEXINPUTS   "%~dp0texmf\tex\edo"
setx TEXFORMATS  "%~dp0texmf\tex\edo"
setx ENCFONTS    "%~dp0texmf\fonts\enc"
setx TFMFONTS    "%~dp0texmf\fonts\tfm"
setx TEXFONTMAPS "%~dp0texmf\fonts\map"
setx T1FONTS     "%~dp0texmf\fonts\type1"

echo %~dp0bin\pdftex.exe --ini --recorder --file-line-error edo.pdf.tex
echo xcopy /y %~dp0edo.pdf.fmt   %~dp0texmf\tex\edo\edo.pdf.fmt

)
