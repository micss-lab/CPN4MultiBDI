// Agent buildAgent in project productionLine

/* Initial beliefs and rules */

/* Initial goals */

buildStatus(0).
buildFree(true).


//!arrangePosition.


/* Plans */

!arrangePosition.

+!arrangePosition: true <- resetPosition; .print("Build initializes itself"); !awareSortAg. // reset first



+!mybuild : true <- -+buildFree(false);  ?buildStatus(M); .print("M= ",M); K = M+1; -+buildStatus(K); .print("K=", K);  !state.



+!state : buildStatus(L) & L ==1 <-.print("Press 1  ",L);  mediumPress;  .send(sortAgent,achieve,samplecolor);  !awareSortAg.

+!state : buildStatus(Z) & Z ==2 <- .print("Press 2  ",Z); secondPress;   !eject.


+!eject : true <- .print("Eject"); -+buildStatus(0); ejectProduct; .send(sortAgent,achieve,samplecolor);!awareSortAg. //state_eject

 +!awareSortAg: true <- ?buildFree(Bf); .send(sortAgent,tell,buildFree(true)).









 +!mybuild : false <- ?buildStatus(M); !mybuild.
 +!arrangePosition:false <- ?buildStatus(YY);!arrangePosition.