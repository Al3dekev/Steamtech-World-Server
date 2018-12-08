@echo off
::ZIP FILE NAME VARIABLE
set commonname="SteamTech WorldSERVER"
set oldername="SteamTech World - Server"


::ZIP VARIABLE
set zipext='.zip'
set commonzipname=%commonname%%zipext%
set olderzipname=%oldername%%zipext%




::TAKING BACK ANCIENT VER
cd '.\OLDVERSIONS\'
hub download MAIN

::CHOOSE NEW ZIP NAME FOR THE OLDER VER
set /p oldversion="[NUMERO ANCIENNE VERSION POUR ZIP]: "
set versioningzipname=%commonname%" - "%oldversion%%zipext%


if exist %olderzipname% (

ren %olderzipname% %versioningzipname%

) else (
ren %commonzipname% %versioningzipname%
)

::OLD VERSION ONLINE
hub release create -o -a %versioningzipname% -m "OLD: "%oldversion% %oldversion%


cd ..

7z a %commonzipname% libraries/ config/ mods/ SteamTechWorld.jar run.bat minecraft_server.1.12.2.jar
echo "Suppression de la Release precedente..."
hub release delete Main
echo "Release supprimee."

echo "Creation d'une Release..."
set /p newversion="[NUMERO NOUVELLE VERSION POUR TITRE RELEASE]: "

hub release create -o -a %commonzipname% -m %newversion% Main
PAUSE