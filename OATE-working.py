import os
import oomBase
import oomInkscape
import oomlout_SVGG as svg
from datetime import datetime
import time

import svgwrite
from svgwrite.extensions import Inkscape
from svgwrite import cm, mm 

##import OOMP

#pathName = '"C:/DB/Dropbox/a/"'

#oomBase.oomSendKeysAltTab()

#x = input("    x: ")
#x = int(input("    x: "))

# oomBase.oomLaunchFolder(pathName)
#oomBase.oomLaunchInkscape(pathName)
#oomBase.oomLaunchWebsite(pathName)
#oomBase.oomEditPython(pathName)
#oomBase.oomLaunch(pathName)
#oomBase.oomLaunchNotepad(pathName)

# oomBase.oomSendKeys("TTTH")
# oomBase.oomSendKeysNoWait("TTTH")

# x = 10
# y = 10
# oomBase.oomMouseClick(x,y)

# oomBase.oomMouseLeft(inkscape)

#time.sleep(0.5)


# time.sleep(1)
# oomBase.oomSendKeysAltTab()
# time.sleep(3)
# da = datetime.now()
# dateString = da.strftime("%Y") + "-" + da.strftime("%m") + "-" + da.strftime("%d")  + "-" + da.strftime("%H") + "-" + da.strftime("%M") + "-" + da.strftime("%S")
# oomBase.oomSendKeys(dateString)

###### INKSCAPE

#oomInkscape.drawRectRounded(x,y,wid,hei)

###### New SVG Test

##filename = "output-working"
##svgFile = "output/" + filename + ".svg"
##pdfFile = "output/" + filename + ".pdf"

##
##### Print all variables
##oomBase.oomPrintVariables(globals().copy().items())
##
##def draw():
##    dwg = svgwrite.Drawing(svgFile, profile='full', size=(210*mm, 297*mm))
##
##    drawPiece(dwg, 0, 0)
##    
##    dwg.save()
##    oomInkscape.toPDF(svgFile,pdfFile)
##
##def drawPiece(dwg, xOffset, yOffset):
##    x = 0
##    y = 0
##    width = 11
##    height = 22
##    svg.oomInsert(dwg,"rectangle",[x+xOffset,y+yOffset],[width,height])
##
##
##    
##    
##
##draw()

##
#######  OOMTEMPLATE
##
##
##def lablTest():#####define details
##    domain = "Component"
##    kingdom = "Electronics"
##    division = "Passive"
##    classa = "Capacitor"
##    family = "CAPE"
##    genus = family + "-05-X-UF100"
##    species = genus + "-01"
##    name = "5 mm Capacitor (Electrolytic)"
##
##
##
##    loi = []
##    loi.append(["Z",domain[0].upper()])
##    loi.append(["YY",kingdom[0:2].upper()])
##    loi.append(["XXXX",classa.upper()])
##    loi.append(["WWW",family.upper()])
##    loi.append(["VVVVV",genus.upper()])
##    loi.append(["NAME",name])
##    baseDir = "C:\\DB\\Dropbox\\BBBB-Product Working\\LABL\\"
##    inFile = baseDir + "oompTestTemplate.svg"
##    svgFile = baseDir + "testOutput.svg"
##    pdfFile = baseDir + "testOutput.pdf"
##    oomTemplate.searchAndReplaceSVG(loi,inFile,svgFile)
##    oomInkscape.toPDF(svgFile,pdfFile)
