s="3DPR";       //Style used for choosing clearances

/*
//o="LAZE";     //Ouput used for choosing STL or DXF output
o="3DPR";
m="PENH";       //Mode used for choosing what to draw
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
    
}


module drawMAIN(){
    drawPENH();
        translate([100,0,0]){
            drawCAAD();
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
        oi("cubeRounded",width=72,height=57,depth=6);
        oi("holeM3",24,7.5);
        oi("holeM3",10,7.5);
        oi("holeM3",-18.5,-1.3);
        oi("holeM3",1,17.6);
        oi("holeM10",-19.5,20.05);
        oi("holeM10",20.5,20.05);
        oi("holeM10",0.5,-20.15);
        oi("holeM6",-30,-22.5);
        oi("holeM6",-15,-22.5);
        oi("holeM6",15,-22.5);
        oi("holeM6",30,-22.5);
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