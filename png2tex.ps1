#  --------------------------------------------------------
#  |         SKYBOX CONVERTER MADE BY TAXMACHINE          |
#  |ENJOY MAKING FUN AND HENTAI SKYBOX TO FUCK ROBLOX TOS |
#  --------------------------------------------------------
Write-Host "Starting Convertion" -Foregroundcolor Green
if(Test-Path -Path .\input) {
    Set-Location .\input
} else {Write-Host "No Input folder found, creating one. Put the images in it before restarting the script " -Foregroundcolor Green | mkdir .\input | Set-Location .. | Stop-Process "powershell.exe"} # makes sure that the input folder exists if not it'll makes it
# this looks like very stupids but it has to go through .dds format before so windows could understand wtf is happenning before renaming into .tex 
Copy-Item ".\*.png" -Destination "..\backup\"
Get-ChildItem *.png | Rename-Item -NewName { $_.Name -replace '.png', '.dds'}
Copy-Item ".\*.dds" -Destination "..\backup\"
Get-ChildItem *.dds | Rename-Item -NewName { $_.Name -replace '.dds', '.tex'}
#ask file names to rename them correctly so it makes the compression easier
Write-Host "Let the fields empty if you don't care about naming the files, but i highly recommend you to do so" -Foregroundcolor Yellow
$top = Read-Host -Prompt "Enter the file name of the image you want at the top of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -Path ".\$top.tex" -NewName "sky512_up.tex"
$down = Read-Host -Prompt "Enter the file name of the image you want at the bottom of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -Path ".\$down.tex" -NewName "sky512_dn.tex"
$right = Read-Host -Prompt "Enter the name of the file you want at the right of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -Path ".\$right.tex" -NewName "sky512_rt.tex"
$left = Read-Host -Prompt "Enter the name of the file you want at the left of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -path ".\$left.tex" -NewName "sky512_lf.tex"
$back = Read-Host -Prompt "Enter the name of the file you want at the back of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -Path ".\$back.tex" -NewName "sky512_bk.tex"
$front = Read-Host -Prompt "Enter the name of the file you want at the front of the skybox WITHOUT THE FILE EXTENSION"
Rename-Item -Path ".\$front.tex" -NewName "sky512_ft.tex"
Set-Location ..
if(Test-Path -Path .\output) {
    Set-Location .\output
} else {mkdir output | Write-Host "No Output folder found, making a new one" -Foregroundcolor Green} # makes sure that the output folder is exists if not it'll makes it
Move-Item -Path "..\input\*.tex" -Destination ".\" # moves .tex files in the output folder
if(Test-Path -Path .\*.tex) {
    $random = [System.IO.Path]::GetRandomFileName() # Get a random name for the zip compression, ty to .NET Framework for that
    Compress-Archive -Path ".\*.tex" -Destination "$random.zip"
    Remove-Item -Path ".\*.tex"
    Write-Host "Compressing files..." -Foregroundcolor Green
    Write-Host "$random created!" -Foregroundcolor Green
} else {Write-host "No Tex files found, killing program..." -Foregroundcolor Red | Set-Location .. | Stop-Process -id "powershell.exe"}
Set-Location ..
Start-Sleep(5)
Write-host "Successfully converted and compress all the images" -Foregroundcolor Green

# --------------------------------------------
# | Powershell is the easiest way to do that |
# |             and it's fun                 |
# --------------------------------------------
