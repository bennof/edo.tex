Write-Output "Edo.TeX 2018"
Write-Output "-fmt=fmt -output-format=pdf"
$env:TEXINPUTS   = "$pwd\texmf\tex\edo"
$env:TEXFORMATS  = "$pwd\texmf\tex\edo"
$env:ENCFONTS    = "$pwd\texmf\fonts\enc"
$env:TFMFONTS    = "$pwd\texmf\fonts\tfm"
$env:TEXFONTMAPS = "$pwd\texmf\fonts\map"
$env:T1FONTS     = "$pwd\texmf\fonts\type1"
.\bin\pdftex.exe --ini --recorder --file-line-error edo.pdf.tex
Move-Item -force edo.pdf.fmt .\texmf\tex\edo\
Write-Output "Edo.pdf.tex build" 


$PSFile = @" 
Write-Output `"Edo.TeX 2018`"
`$env:EDOTEX      = `"$pwd\`"
`$env:TEXINPUTS   = `".:$pwd\texmf\tex\edo\`"
`$env:TEXFORMATS  = `"$pwd\texmf\tex\edo\`"
`$env:ENCFONTS    = `"$pwd\texmf\fonts\enc\`"
`$env:TFMFONTS    = `"$pwd\texmf\fonts\tfm\`"
`$env:TEXFONTMAPS = `"$pwd\texmf\fonts\map\`"
`$env:T1FONTS     = `"$pwd\texmf\fonts\type1\`"
$pwd\bin\pdftex.exe -fmt $pwd\texmf\tex\edo\edo.pdf `$(`$args[0])
"@ 
$PSFile | Out-File -FilePath $pwd\bin\edotex.ps1

Write-Output "Add $pwd to your PATH variable"