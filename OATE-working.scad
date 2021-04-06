s="3DPR";       //Style used for choosing clearances

/*
//o="LAZE";     //Ouput used for choosing STL or DXF output
o="3DPR";
//m="MAIN";
//m="PENH";       //Mode used for choosing what to draw
//m="CAAD";
//m="PENH";
m="MANP";
//m="TEST";
*/


include <OPSC-base.scad>



if(m=="MAIN"){
    if(o=="LAZE"){
        projection(){
            drawMAIN();
        }
    }else{
        drawMAIN();
    }
}if(m=="CAAD"){
    if(o=="LAZE"){
        projection(){
            drawCAAD();
        }
    }else{
        drawCAAD();
    }
}if(m=="PENH"){
    if(o=="LAZE"){
        projection(){
            drawPENH();
        }
    }else{
        drawPENH();
    }
}if(m=="MANP"){
    if(o=="LAZE"){
        projection(){
            drawMANP();
        }
    }else{
        drawMANP();
    }
}if(m=="TEST"){
    test();
}



module test(){
    //OPSCInsert("OOBBHole",100,0,0);
    //OPSCInsert("OOBBHoleSlot",50,0,0,rotZ=45);
    //OPSCInsert("M3SocketHeadFull",0,0,0);
    //OPSCInsert("M3SocketHead",0,0,0,length=25);
    //OPSCInsert("cubeRounded",width=20,height=20,depth=6,rad=5);
    //OPSCInsert("cube",width=20,height=20,depth=6,rad=5,alpha=0.3,color="red");
    //drawPOGB();
    //drawQRRE();
    //oi("socketHeadM3",x=0,y=0);
}


module drawMAIN(){
    drawPENH();
        translate([100,0,0]){
            drawCAAD();
        }
        translate([200,0,0]){
            drawMANP();
        }
    }


module drawPENH(){
    penOffset = 15;
    rad = 30;
    difference(){        
        oi("cylinder",rad=rad,depth=3);
        oi("couplerFlangeM5");
        oi("holeRect",x=penOffset-8,width=3,height=5);
        oi("holeRect",x=penOffset+8,width=3,height=5);
    }
    //pen
    penRad = 17/2;
    penLength = 100;
    //oi("Cylinder",x=penOffset,y=-penLength*3/4,z=17/2,rad=penRad,depth=penLength,rotX=90,color="red",alpha=.5);
}

// Draw CAAD --- Carriage Adapter
module drawCAAD(){
    difference(){
        oi("cubeRounded",width=(5*15)-3,height=(5*15)-3,y=7.5,depth=6);
        oi("holeM6",24,7.5);
        oi("holeM6",10,7.5);
        oi("holeM3",-18.5,-1.3);
        oi("holeM3",1,17.6);
        oi("holeM10",-19.5,20.05);
        oi("holeM10",20.5,20.05);
        oi("holeM10",0.5,-20.15);
        //bottom role of holes
        oi("holeM6",-30,-22.5);
        oi("holeM6",-15,-22.5);
        oi("holeM6",15,-22.5);
        oi("holeM6",30,-22.5);
        //top row of holes
        oi("holeM6",-30,37.5);
        oi("holeM6",-15,37.5);
        oi("holeM6",0,37.5);
        oi("holeM6",15,37.5);
        oi("holeM6",30,37.5);
    }
    //surround
    //0,0,72,57
    //m3 hole 
    //24,7.5
    //10,7.5
    //-18.5,-1.3
    //01,17.6
    //m10 hole
    //-19.5,20.05
    //20.5,20.05
    //0.5,-20.15
    //m6
    //(-30,-15,15,30),-22.5
}

module drawMANP(){
    thick = 12;
    difference(){
        oi("plateOOBB",width=3,height=5
        ,depth=thick,z=thick);
        oi("holeM6",y=30,z=thick/2,rotY=90);
        oi("holeM6",y=-30,z=thick/2,rotY=90);
        OATEinsert("rfProbe",y=20);
        OATEinsert("POGB",rotZ=90,y=-15,z=3,offset=0);
        OATEinsert("QRRE",y=5,z=12-4);
        
        
    }
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

module OLD01_drawPOGB(offset=0){
    pogoH = 0;
    //difference(){
        //board
        cl1=1;
        clZ=10;
        oi("cube",width=22+cl1,height=34+cl1,depth=1.6+clZ,z=clZ,color="green");
        //mounting holes
        
        #oi("socketHeadM3",x=7,y=13,z=offset);
        #oi("socketHeadM3",x=-7,y=13,z=offset);
        #oi("socketHeadM3",x=7,y=-13,z=offset);
        #oi("socketHeadM3",x=-7,y=-13,z=offset);
    //}
    //pogoPins
    col1=8;
    row1=-6;
    gap1=2.54;
    cl=0;
    
    //TP4
    OATEinsert("pogoPinR100",x=col1,y=row1+0*gap1,z=pogoH,clearance=cl,color="gold");
    //TP3
    OATEinsert("pogoPinR100",x=col1,y=row1+1*gap1,z=pogoH,clearance=cl,color="gold");
    //TP10
    OATEinsert("pogoPinR100",x=col1,y=row1+2*gap1,z=pogoH,clearance=cl,color="gold");
    //TP9
    OATEinsert("pogoPinR100",x=col1,y=row1+3*gap1,z=pogoH,clearance=cl,color="gold");
    //TP5
    OATEinsert("pogoPinR100",x=col1,y=row1+4*gap1,z=pogoH,clearance=cl,color="gold");
    //TP6
    OATEinsert("pogoPinR100",x=-2.91,y=-6.685,z=pogoH,clearance=cl,color="gold");
    //TP7
    OATEinsert("pogoPinR100",x=-5.725,y=-3,z=pogoH,clearance=cl,color="gold");
    //TP8
    col2=-8.1;
    OATEinsert("pogoPinR100",x=col2,y=-4.95,z=pogoH,clearance=cl,color="gold");
    //TP1
    OATEinsert("pogoPinR100",x=col2,y=-1.67,z=pogoH,clearance=cl,color="gold");
    //TP2
    OATEinsert("pogoPinR100",x=col2,y=0.681,z=pogoH,clearance=cl,color="gold");
    
    
    
    
}

module drawRFProbe(){
    oi("holeRect",width=10,height=10);
    oi("socketHeadM3",x=8,z=socketHeadM3Depth,rotY=180);
    oi("socketHeadM3",x=-8,z=socketHeadM3Depth,rotY=180);
    
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


