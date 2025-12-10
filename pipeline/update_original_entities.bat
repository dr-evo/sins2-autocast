@echo off

SET SourceFolder=C:\Program Files (x86)\Steam\steamapps\common\Sins2\entities
SET DestinationFolder=..\docs\original-entities


rem /XO	Exclude Older: Skips files in the source that are older than the ones already in the destination. It ensures you only copy newer or "changed" files.
rem /XL	Exclude Lonely: Crucial for your request. This prevents Robocopy from copying files that don't already exist in Folder A. It will only update files that are common to both folders.
rem /V	Verbose: Shows skipped files in the output, so you can see exactly which files were deemed "identical" and weren't copied.
rem /S	(Optional) Add this if you want to include subdirectories.


robocopy "%SourceFolder%" "%DestinationFolder%" /XO /XL


