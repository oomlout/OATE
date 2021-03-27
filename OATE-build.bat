REM ######  OATE GENERATE FILES  ######
REM ###################################
REM 

SET MODE=CAAD

SET STYLE=3DPR
SET FILEFULL=OATE-output\%MODE%\%MODE%-%STYLE%
del %FILEFULL%
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\"" OATE-working.scad
