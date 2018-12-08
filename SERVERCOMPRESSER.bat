@echo off
set zipfile="SteamTechWorldSERVER.zip"


7z a %zipfile% libraries/ config/ mods/ SteamTechWorld.jar run.bat minecraft_server.1.12.2.jar
