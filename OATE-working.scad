


include <OPSC-base.scad>


OPSCbuild(shift=300);


// MANP -- Main Plate
// Description
module draw1(){
    color="red";
    thick = 12;
    difference(){
        extra = 2;
        oi("plateOOBB",y=-extra*15/2,width=3,height=5+extra,depth=thick,z=thick,color="red");
        oi("holeM6",y=30,z=thick/2,rotY=90,color="red");
        oi("holeM6",y=-30,z=thick/2,rotY=90,color="red");
        offset = -50;
        diff=42.55;
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff - 3,z=3,color="red");
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff - 2,z=3,color="red");
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff - 1,z=3,color="red");
        OATEinsert("rfProbe",rotZ=90,x=0.5,y=offset + diff - 0,z=3,color="red");
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff + 1,z=3,color="red");
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff + 2,z=3,color="red");
        //OATEinsert("rfProbe",rotZ=90,y=offset + diff + 3,z=3,color="red");
        OATEinsert("POGB",rotZ=90,y=offset,z=3,offset=0,color="red");
        //OATEinsert("QRRE",y=5,z=12-4,color="red");
        
        
    }    
    
}

// CAAD -- Carriage Adapter
// Description
module draw2(){
    color="orange";
    thickness = 12;
    union(){
        //main piece
        difference(){
            oi("cubeRounded",width=(5*15)-3,height=(5*15)-3,y=7.5,depth=thickness,color=color);
            oi("holeM6",24,7.5,color=color);
            oi("holeM6",10,7.5,color=color);
            oi("holeM3",-18.5,-1.3,color=color);
            oi("holeM3",-1,17.6,color=color);
            oi("holeM10",-19.5,20.05,color=color);
            oi("holeM10",20.5,20.05,color=color);
            oi("holeM10",0.5,-20.15,color=color);
            //bottom role of holes
            oi("holeM6",-30,-22.5,color=color);
            oi("holeM6",-15,-22.5,color=color);
            oi("holeM6",15,-22.5,color=color);
            oi("holeM6",30,-22.5,color=color);
            //top row of holes
            oi("holeM6",-30,37.5,color=color);
            oi("holeM6",-15,37.5,color=color);
            oi("holeM6",0,37.5,color=color);
            oi("holeM6",15,37.5,color=color);
            oi("holeM6",30,37.5,color=color);
        }
        //bumper
        difference(){
            bumpDepth=3;
            bumpShift=3;
            bumpInset=30;
            oi("cubeRounded",width=(5*15)-3,height=((5*15)-3)-bumpInset,y=7.5,depth=3,z=-thickness,color=color);
            oi("cube",width=(5*15)-3,x=bumpShift,height=(5*15)-3,y=7.5,depth=bumpDepth,z=-thickness,color=color);
        }
    }
}

// QRSH -- QR Code Scanner Holder
// Description
module draw3(){
    color = "yellow";
    thickness = 12;
    difference(){        
        oi("cubeRounded",width=(1.2*15)-3,height=(5*15)-3,y=0,depth=thickness,color=color);
        oi("holeM6",y=-30,z=-thickness/2,rotY=90,color=color);
        oi("holeM6",y=30,z=-thickness/2,rotY=90,color=color);
        OATEinsert("QRRE",x=-2,y=0,color=color,z=-thickness,rotZ=90,clearance=1);
        OATEinsert("QRRE",x=-1,y=0,  color=color,z=-thickness,rotZ=90,clearance=1);
        }
    
}


// PENH -- Pen Holder
// Description
module draw3OLD(){
    color = "yellow";
penOffset = 15;
    rad = 30;
    difference(){        
        oi("cylinder",rad=rad,depth=3,color=color);
        oi("couplerFlangeM5",color=color);
        oi("holeRect",x=penOffset-8,width=3,height=5,color=color);
        oi("holeRect",x=penOffset+8,width=3,height=5,color=color);
    }
    //pen
    penRad = 17/2;
    penLength = 100;
    //oi("Cylinder",x=penOffset,y=-penLength*3/4,z=17/2,rad=penRad,depth=penLength,rotX=90,color="red",alpha=.5);   
    
}

holeShift = 5*15;
bedWidth = 233;
bedHeight = 233+holeShift;
bedHoleSpacing = 170;
// BEPL -- Bed Plate
// Description
module draw4(){
    color="green";
    difference(){
        //bed
        oi("cubeRounded",width=bedWidth,height=bedHeight,depth=3,color=color);
        //connecting holes
        oi("holeM4",x=bedHoleSpacing/2,y=bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM4",x=bedHoleSpacing/2,y=-bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM4",x=-bedHoleSpacing/2,y=bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM4",x=-bedHoleSpacing/2,y=-bedHoleSpacing/2+holeShift/2,color=color);
        bedHoles(color);
    }
}

oobbSpacing = 15;
module bedHoles(color){
    width = 15;
    height = 20;
    
    for(x =[0:width-1]){
        for(y =[0:height-1]){
            if( !((x == 1 && y == 1+(holeShift/oobbSpacing)) || 
                (x == width-2 && y == height-2)|| 
                (x == 1 && y == height-2)|| 
                (x == width-2 && y == 1+(holeShift/oobbSpacing)))
            ){
                xx= (x * oobbSpacing) - ((width-1)*oobbSpacing)/2;
                yy= (y * oobbSpacing) - ((height-1)*oobbSpacing)/2;
                oi("holeM6",x=xx,y=yy,color=color);
            }
        }
    }
        
    
}

//BLANK
module draw8(){
    
}

// CAMM -- Camera Mount
// Description
module draw7(){
    thick = 12;
    color="gray";
    difference(){
        cutoutShift=6;
        oi("plateOOBB",width=3,height=5
        ,depth=thick,z=thick,color=color);
        oi("plateOOBB",width=3,height=3
        ,depth=thick-cutoutShift,z=cutoutShift,color=color);
        oi("holeM6",y=30,z=thick/2,rotY=90,color=color);
        oi("holeM6",y=-30,z=thick/2,rotY=90,color=color);
        OATEinsert("camera", color=color);
    }
    
}

// BBESP -- Bed Spacer Plate
// Description
module draw5(){
    color="blue";
    difference(){
        //bed
        oi("cubeRounded",width=bedWidth,height=bedHeight,depth=3,color=color);
        //connecting holes
        oi("holeM10",x=bedHoleSpacing/2,y=bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM10",x=bedHoleSpacing/2,y=-bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM10",x=-bedHoleSpacing/2,y=bedHoleSpacing/2+holeShift/2,color=color);
        oi("holeM10",x=-bedHoleSpacing/2,y=-bedHoleSpacing/2+holeShift/2,color=color);
        bedHoles(color);
    }
}    


// board array
// Description
module draw9(){
    numBoards = 7; 
    boardSpacing = 21;
color = white;
    difference(){
        h = 12;
        w = 7;
        oi("plateOOBB",y=0,width=w,height=h,depth=3);
        oi("holeM6",x=gv("OS")*(w-1)/2,y=gv("OS")*(h-1)/2); 
        oi("holeM6",x=-gv("OS")*(w-1)/2,y=gv("OS")*(h-1)/2); 
        oi("holeM6",x=gv("OS")*(w-1)/2,y=-gv("OS")*(h-1)/2); 
        oi("holeM6",x=-gv("OS")*(w-1)/2,y=-gv("OS")*(h-1)/2); 
        
        for(i=[0:numBoards-1]){ 
            OATEinsert("unit",y=boardSpacing * i - (boardSpacing*numBoards/2)+boardSpacing/2,x=0, color=color);
       }
    }
    
}

// TEBH -- test Bed Holder
// Description
module draw6(){
    color = "white";
    oobbWid = 7;
    oobbHei = 2;
    wid = (15*oobbWid)-3;
    hei = (15*oobbHei)-3;
    dep = 12;
    widOff = (15*oobbWid)/2 - oobbSpacing/2;
    heiOff = (15*oobbHei)/2 - oobbSpacing/2;
    
    difference(){
        oi("cubeRounded",width=wid,height=hei,depth=dep);
        //mounting holes
        oi("holeM6",x=(1-1)*oobbSpacing-widOff,y=(1-1)*oobbSpacing-heiOff);
        oi("holeM6",x=(1-1)*oobbSpacing-widOff,y=(2-1)*oobbSpacing-heiOff);
        OATEinsert("TEBH",x=10,color=color);
    }
    
}

module drawTEBH(color){
    extra = 1;
    boardWid = 62.9;
    boardHei = 18.60;
    boardDep = 1.6;
    boardLip = 2;
    full = 15;
    
    //main Board
    oi("cube",width=boardWid+extra,height=boardHei+extra,depth=boardDep+extra);
    //board keepout
    oi("cube",width=boardWid-boardLip,height=boardHei-boardLip,depth=full,z=full/2);
    //usb socket
    usbWid=21+1;
    usbHei=12+1;
    usbX=-34;
    usbY=0;
    oi("cube",width=usbWid,height=usbHei,depth=full,x=usbX,y=usbY,z=full/2);
    //SMD
    smdWid=15+1;
    smdHei=10+1;
    smdX=32;
    smdY=0;
    oi("cube",width=smdWid,height=smdHei,depth=full,x=smdX,y=smdY,z=full/2);
    
}

// BHX1 Board Holder X 1
// Description
module draw10(){
    color = gray;
    difference(){
        oi("plateOOBB",width=7,height=4,depth=3);
        oi("holeM6",x=gv("OS3"),y=gv("OS1")*1.5); 
        oi("holeM6",x=gv("OS3"),y=-gv("OS1")*1.5); 
        oi("holeM6",x=-gv("OS3"),y=gv("OS1")*1.5); 
        oi("holeM6",x=-gv("OS3"),y=-gv("OS1")*1.5); 
        OATEinsert("unit",x=0,y=0, color=color);
    }
}



module test(){
    //OPSCInsert("OSPCHole",100,0,0);
    //OPSCInsert("holeM3");
    //OPSCInsert("OPSCHoleSlot",x=50,rad=5,rotZ=45);
    //OPSCInsert("M3SocketHeadFull",0,0,0);
    //OPSCInsert("M3SocketHead",0,0,0,length=25);
    //OPSCInsert("cubeRounded",width=20,height=20,depth=6,rad=5);
   //OPSCInsert("cylinder",rad=20,depth=6); //OPSCInsert("cube",width=20,height=20,depth=6,rad=5,alpha=0.3,color="red");
    
}


module OATEinsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=0,rad=0,color="gray",alpha=1,clearance=0,offset=0){
    color(color,alpha){
            translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){    
                    if(item=="rfProbe"){
                        drawRFProbe();
                    }if(item=="pogoPinR100"){
                        translate([0,0,7.5]){
                            //multicomp R100-CR
                            oi("cylinder",rad=1.48/2+clearance/2,depth=30.2,color="gold");
                            oi("cylinder",rad=1.66/2+clearance/2,depth=22,color="gold");
                            oi("cylinder",rad=1.8/2,depth=1,z=-7.5+1);
                        }                        
                    }if(item=="POGB"){
                            drawPOGB(offset=offset);
                    }if(item=="QRRE"){
                            drawQRRE();
                    }if(item=="TEBH"){
                            drawTEBH(color);
                    }if(item=="camera"){
                            drawCamera(color);
                    }if(item=="unit"){
                            drawUnit(color);
                    }
            }
        }
}

module drawUnit(color){
    clear = 0.5;
    seperation=70.935;
    //board
    boardW=67;
    boardH=19;
    boardThickness=1.6;
    
    oi("cube",x=5.5,width=boardW+clear,height=boardH+clear,depth=boardThickness,z=boardThickness,color=color);
    //usb
    usbW=14.825;
    usbH=12.55;
    oi("cube",width=usbW+ clear,height=usbH+clear,x=-seperation/2,color=color,z=50, depth=100);
    //sma
    smaW=8;
    smaH=8;
    oi("cube",width=smaW+clear,height=smaH+clear,x=seperation/2,color=color,z=50, depth=100);
}

module drawRFProbe(){
    dep = 20;
    oi("cube",width=22,height=12,depth=dep,z=dep);
    oi("holeRect",width=10,height=10);
    oi("holeM3",x=8,z=socketHeadM3Depth,rotY=180);
    oi("holeM3",x=-8,z=socketHeadM3Depth,rotY=180);
    
}

module drawQRRE(clearance=0){
    oi("cube",width=21.4+clearance,height=11.8+clearance,depth=13.5,z=13.5);
    oi("holeM16D",x=14.6/2,z=6.1,rotX=90);
    oi("holeM16D",x=-14.6/2,z=6.1,rotX=90);
    
}
module drawQRREOLD(clearance=0){
    oi("cube",width=21.4+clearance,height=11.8+clearance,depth=13.5,z=13.5);
    oi("holeM10");
    
}

module drawPOGB(offset=0){
    pogoH = 0;
    //difference(){
        //board
        cl1=1;
        clZ=15;
        oi("cube",width=22+cl1,height=34+cl1,depth=clZ,z=clZ,color="green");
        oi("cube",width=22+cl1,height=20,depth=500,z=250,color="green");
        //mounting holes
        
        oi("holeM3",x=7,y=13,z=offset);
        oi("holeM3",x=-7,y=13,z=offset);
        oi("holeM3",x=7,y=-13,z=offset);
        oi("holeM3",x=-7,y=-13,z=offset);
    //}
}
 
 module drawCamera(color){
     //holes
     holeSpacing = 34;
     oi("holeM2",x=holeSpacing/2,y=holeSpacing/2,color=color);
     oi("holeM2",x=-holeSpacing/2,y=holeSpacing/2,color=color);
     oi("holeM2",x=holeSpacing/2,y=-holeSpacing/2,color=color);
     oi("holeM2",x=-holeSpacing/2,y=-holeSpacing/2,color=color);
     //cutout
     cutoutSize=38;
     difference(){
        oi("cube",width=cutoutSize,height=cutoutSize,depth=100,z=50,color=color);
        oi("holeM6",x=holeSpacing/2,y=holeSpacing/2,color=color);
    oi("holeM6",x=-holeSpacing/2,y=holeSpacing/2,color=color);
    oi("holeM6",x=holeSpacing/2,y=-holeSpacing/2,color=color);
    oi("holeM6",x=-holeSpacing/2,y=-holeSpacing/2,color=color);
     }
     
  
  
 }   
    
    
    
}


