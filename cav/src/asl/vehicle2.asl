// Agent vehicle22 in project cav.mas2j
vehicle(1,0).
vehicle2(1,0).
pedestrian1(0,0).
pedestrian2(0,0).
pedestrian3(0,0).
pedestrian4(0,0).
pedestrian5(0,0).
pedestrian6(0,0).

/* Initial goals */
!prepare_startVehicle2.

/* Plans */
+!prepare_startVehicle2:true
<-
 //.print("Vehicle2 is going to start.");
 ?vehicle2(1,X);    
 //.print(vehicle2(1,X));
 locate(X); 
 -vehicle2(1,X); 
!start_vehicle2.

+!start_vehicle2:  not moving 			 //start_vehicle2: add moving
<- 
	.print("The vehicle2 is starting!");
	?vehicle2(1,X); 
	//.print("The vehicle2 is starting2!");
	start_v;
	?vehicle2(1,Y);
	!run.
	
+!run :  safeVP1 &  not moving 					 
	<-                                   
	//.print("The AV2 is moving!");
    !start_vehicle2.

+!run :  safeVP1  &  moving 
	<- 
	//.print("Continue2");
	?vehicle2(1,X);
	move_v(X+10);
	?vehicle2(1,Y);
	!run.
	
+!run :  not safeVP1 & moving 					//check d ->remove moving
	<- 
	?vehicle2(1,X);
	stop_v; 
	?vehicle2(1,Y);								
	//.print("The AV has to stop1!");
	!run.

+!run :  not safeVP1 & not moving 				//check d ->remove moving
	<- 
	?vehicle2(1,X);
	stop_v; 
	?vehicle2(1,Y);								
	//.print("The AV has to stop1!");
	!run.
	
+!run :  not safeVP2 & moving 					//check d ->remove moving
	<- 
	?vehicle2(1,X);
	stop_v; 
	?vehicle2(1,Y);								
	//.print("The AV has to stop2!");
	!run.

+!run :  not safeVP2 & not moving 				//check d ->remove moving
	<- 
	?vehicle2(1,X);
	stop_v; 
	?vehicle2(1,Y);								
	//.print("The AV has to stop2!");
	!run.
