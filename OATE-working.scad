


include <OPSC-base.scad>


OPSCbuild();


// MANP -- Main Plate
// Description
module draw1(){
    color="red";
    thick = 12;
    difference(){
        oi("plateOOBB",width=3,height=5
        ,depth=thick,z=thick,color="red");
        oi("holeM6",y=30,z=thick/2,rotY=90,color="red");
        oi("holeM6",y=-30,z=thick/2,rotY=90,color="red");
        OATEinsert("rfProbe",y=20,z=3,color="red");
        OATEinsert("POGB",rotZ=90,y=-15,z=3,offset=0,color="red");
        OATEinsert("QRRE",y=5,z=12-4,color="red");
        
        
    }    
    
}

// CAAD -- Carriage Adapter
// Description
module draw2(){
    color="orange";
    difference(){
        oi("cubeRounded",width=(5*15)-3,height=(5*15)-3,y=7.5,depth=6,color=color);
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
    
}

// PENH -- Pen Holder
// Description
module draw3(){
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

bedWidth = 233;
bedHeight = 233;
bedHoleSpacing = 170;
// BEPL -- Bed Plate
// Description
module draw4(){
    difference(){
        //bed
        oi("rectangleRounded",width=bedWidth,height=bedHeight,depth=3)
        //bed holes
        oi("holeM4",x=bedHoleSpacing/2,y=bedHoleSpacing/2);
        oi("holeM4",x=bedHoleSpacing/2,y=-bedHoleSpacing/2);
        oi("holeM4",x=-bedHoleSpacing/2,y=bedHoleSpacing/2);
        oi("holeM4",x=-bedHoleSpacing/2,y=-bedHoleSpacing/2);
    
}

// BBESP -- Bed Spacer Plate
// Description
module draw5(){
    
}

// ZZZZ
// Description
module draw6(){
    
}

// ZZZZ
// Description
module draw7(){
    
}

// ZZZZ
// Description
module draw8(){
    
}

// ZZZZ
// Description
module draw9(){
    
}

// ZZZZ
// Description
module draw10(){
    
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
                    }
                }
            }
        }
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


