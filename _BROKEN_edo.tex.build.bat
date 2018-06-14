REM Batch build file 
REM Copyright 2018 Benjamin Benno Falkner


@echo Building Edo.TeX at %~dp0 ...
setx EDOTEX      "%~dp0"
setx TEXINPUTS   "%~dp0texmf\tex\edo"
setx TEXFORMATS  "%~dp0texmf\tex\edo"
setx ENCFONTS    "%~dp0texmf\fonts\enc"
setx TFMFONTS    "%~dp0texmf\fonts\tfm"
setx TEXFONTMAPS "%~dp0texmf\fonts\map"
setx T1FONTS     "%~dp0texmf\fonts\type1"

%~dp0bin\pdftex.exe --ini --recorder --file-line-error edo.pdf.tex
@echo ... done.
@echo. 
@echo Setup ...
xcopy /y %~dp0edo.pdf.fmt   %~dp0texmf\tex\edo\edo.pdf.fmt
@echo write bin\edotex.ps1
)

>bin\edotex.ps1 (
echo Write-Output "Edo.TeX 2018"
echo $env:EDOTEX      = "%~dp0"
echo $env:TEXINPUTS   = "%~dp0texmf\tex\edo"
echo $env:TEXFORMATS  = "%~dp0texmf\tex\edo"
echo $env:ENCFONTS    = "%~dp0texmf\fonts\enc"
echo $env:TFMFONTS    = "%~dp0texmf\fonts\tfm"
echo $env:TEXFONTMAPS = "%~dp0texmf\fonts\map"
echo $env:T1FONTS     = "%~dp0texmf\fonts\type1"
echo %~dp0bin\pdftex.exe $args[1]
)
@echo write bin\edotex.bat >> output.log
>bin\edotex.bat (
echo echo Edo.TeX 2018
echo setx EDOTEX      "%~dp0"
echo setx TEXINPUTS   "%~dp0texmf\tex\edo"
echo setx TEXFORMATS  "%~dp0texmf\tex\edo"
echo setx ENCFONTS    "%~dp0texmf\fonts\enc"
echo setx TFMFONTS    "%~dp0texmf\fonts\tfm"
echo setx TEXFONTMAPS "%~dp0texmf\fonts\map"
echo setx T1FONTS     "%~dp0texmf\fonts\type1"
echo %~dp0bin\pdftex.exe %%1
)
@echo ... done. >> output.log
@echo Add %~dp0 to your PATH variable


