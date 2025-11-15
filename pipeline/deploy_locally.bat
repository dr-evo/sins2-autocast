@echo off
title Deploy the mod to local mod folder

SET SourceFolder=..\src\autocast
SET DestinationFolder=%LocalAppData%\sins2\mods\autocast

REM Parameters:
REM /E : Copy subdirectories, including empty ones.
REM /R:0 : Number of retries on failed files (0 means no retries).
REM /W:0 : Wait time between retries (0 seconds).
REM /Y : Suppresses prompting to confirm overwriting of existing destination files (though Robocopy usually doesn't prompt anyway).
REM /PURGE : delete dest files/dirs that no longer exist in source

robocopy "%SourceFolder%" "%DestinationFolder%" /E /R:0 /W:0


pause