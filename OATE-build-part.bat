REM ######  OATE GENERATE FILES  ######
REM ###################################
REM 

REM SET MODE= set in calling method

SET STYLE=3DPR
SET FILEFULL=output\%MODE%-%STYLE%
del %FILEFULL%.stl
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET STYLE=LAZE
del %FILEFULL%.dxf
openscad -o %FILEFULL%.dxf -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

