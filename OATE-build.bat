REM ######  OATE GENERATE FILES  ######
REM ###################################
REM 

SET MODE=MAIN

SET STYLE=3DPR
SET FILEFULL=output\%MODE%-%STYLE%
del %FILEFULL%.stl
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET STYLE=LAZE
del %FILEFULL%.dxf
openscad -o %FILEFULL%.dxf -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET MODE=CAAD

SET STYLE=3DPR
SET FILEFULL=output\%MODE%-%STYLE%
del %FILEFULL%.stl
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET STYLE=LAZE
del %FILEFULL%.dxf
openscad -o %FILEFULL%.dxf -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET MODE=PENH

SET STYLE=3DPR
SET FILEFULL=output\%MODE%-%STYLE%
del %FILEFULL%.stl
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET STYLE=LAZE
del %FILEFULL%.dxf
openscad -o %FILEFULL%.dxf -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET MODE=MANP

SET STYLE=3DPR
SET FILEFULL=output\%MODE%-%STYLE%
del %FILEFULL%.stl
openscad -o %FILEFULL%.stl -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad

SET STYLE=LAZE
del %FILEFULL%.dxf
openscad -o %FILEFULL%.dxf -D "m=\"%MODE%\";o=\"%STYLE%\"" OATE-working.scad