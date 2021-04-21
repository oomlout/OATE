REM ######  OATE GENERATE FILES  ######
REM ###################################
REM 
@echo off 
setlocal enabledelayedexpansion 
SET PROJECT=OATE

set ITEM[0]=ALL
REM Main Plate
set ITEM[1]=MANP
REM Carriage Adapter
set ITEM[2]=CAAD
REM Pen Holder
set ITEM[3]=PENH
REM Blacnl
set ITEM[4]=ZZZZ
REM Bed Plate
set ITEM[5]=BEPL
REM Blank
set ITEM[6]=ZZZZ
set ITEM[7]=ZZZZ
REM Bed Spacer
set ITEM[8]=BESP
set ITEM[9]=ZZZZ
REM Test Board Holder
set ITEM[10]=TEBH



SET STYLE=3DPR
SET FILEFULL=output\%PROJECT%

del %FILEFULL%.stl

(for /l %%i in (10,1,10) do (
    echo Making Index: %%i
    del %FILEFULL%-!ITEM[%%i]!-3DPR.stl   
    openscad -o %FILEFULL%-!ITEM[%%i]!-3DPR.stl -D "i=%%i;o=\"3DPR"" OATE-3DPR.scad
    del %FILEFULL%-!ITEM[%%i]!-3DPR.png   
    openscad -o %FILEFULL%-!ITEM[%%i]!-3DPR.png -D "i=%%i;o=\"3DPR"" OATE-3DPR.scad	
    del %FILEFULL%-!ITEM[%%i]!-LAZE.dxf
    openscad -o %FILEFULL%-!ITEM[%%i]!-LAZE.dxf -D "i=%%i;o=\"LAZE"" OATE-LAZE.scad
    del %FILEFULL%-!ITEM[%%i]!-LAZE.svg
    openscad -o %FILEFULL%-!ITEM[%%i]!-LAZE.svg -D "i=%%i;o=\"LAZE"" OATE-LAZE.scad
	del %FILEFULL%-!ITEM[%%i]!-LAZE.pdf
	inkscape.exe --export-filename="%FILEFULL%-!ITEM[%%i]!-LAZE.pdf" "%FILEFULL%-!ITEM[%%i]!-LAZE.svg"	
	prusa-slicer-console.exe --export-gcode --repair --output %FILEFULL%-!ITEM[%%i]!-3DPR.gcode  -load "C:\DB\Dropbox\BBBB-Product Working\3DPR\3DPR-commandLine\OOBB-run.ini" %FILEFULL%-!ITEM[%%i]!-3DPR.stl  
))

REM #############################################################################
REM ######      ALL DONE !!!!!! #################################################
REM #############################################################################
pause