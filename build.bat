@Echo Off
:: Gov-Tuner ZIP creation script
:: Written by F4uzan, with the help of Gov-Tuner Team
:: zip and bzip2 binaries provided by GnuWin / gnuwin32 at http://gnuwin32.sourceforge.net
::
:: This script should build a zip archive containing all the files excluding the ".git" folder
:: "zip" binary is provided in the "win" folder, this folder will also be excluded out when compiling the zip
::
:: Arguments:
:: build <VERSION>
::
:: Example:
:: build 4.0.1

set version=%1
set zip_dir=win
set zip_exec=zip.exe
set dir=%cd%

echo:
echo Building Gov-Tuner v%version%
echo -----------------------------
:: Build and copy uninstaller before doing anything
echo Building Uninstaller
cd uninstaller
..\%zip_dir%\%zip_exec% -r Uninstall_Gov-Tuner.zip .>nul
echo Moving Uninstaller to common\system\etc\GovTuner
move /y Uninstall_Gov-Tuner.zip ../common/system/etc/GovTuner>nul
cd ..

echo Using zip to build output
echo Building output zip
%zip_dir%\%zip_exec% -r Gov-Tuner_%version%.zip . -x ".git/*" "win/*" "uninstaller/*" "build.*" ".gitignore" "Gov-Tuner_*.zip">nul
echo Output created: %dir%\Gov-Tuner_%version%.zip