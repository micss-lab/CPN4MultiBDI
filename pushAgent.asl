// Agent pushAgent in project productionLine

/* Initial beliefs and rules */

/* Initial goals */

//!start.


!push.
/* Plans */

//+!push : true <- .print("Actuating push motor : Brick is PUSHED");.print("**");!toBuild;.print("*");!toBuild;.print("**");!toBuild;.print("**").


+!push : true <-  pushMotor;.print("Actuating push motor : Brick is PUSHED"). //[.send(dropAgent,achieve,loop);.send(sortAgent,achieve,samplecolor)] check these later.
+!push : false <- .print("Push Operation"); !push.


+done(M)[source(initAgent)] : true        // 1
   <- .print(" 1) DONE Message from ",initAgent,": ",M);
      -done(M).  //!senseDrop; iptal et.

//+!toBuild: true <-  .send([buildAgent],achieve,build). // go to samplecolor.



// THIS AGENT RECEIVES AND ACHIEVE MESSAGE FROM THE SORT AGENT.