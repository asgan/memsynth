module tests/safe525

open program
open model

/**
PPC safe525
"SyncsWW Rfe LwSyncdRW Rfe SyncdRR Fre"
Cycle=SyncsWW Rfe LwSyncdRW Rfe SyncdRR Fre
Relax=
Safe=Fre LwSyncdRW ACSyncdRR BCSyncsWW
{
0:r2=y; 0:r4=x;
1:r2=x; 1:r4=y;
2:r2=y;
}
 P0           | P1           | P2           ;
 lwz r1,0(r2) | lwz r1,0(r2) | li r1,1      ;
 lwsync       | sync         | stw r1,0(r2) ;
 li r3,1      | lwz r3,0(r4) | sync         ;
 stw r3,0(r4) |              | li r3,2      ;
              |              | stw r3,0(r2) ;
exists
(y=2 /\ 0:r1=2 /\ 1:r1=1 /\ 1:r3=0)


**/


one sig x, y extends Location {}

one sig P1, P2, P3 extends Processor {}

one sig op1 extends Read {}
one sig op2 extends Lwsync {}
one sig op3 extends Write {}
one sig op4 extends Read {}
one sig op5 extends Sync {}
one sig op6 extends Read {}
one sig op7 extends Write {}
one sig op8 extends Sync {}
one sig op9 extends Write {}

fact {
    P1.read[1, op1, y, 2]
    P1.lwsync[2, op2]
    P1.write[3, op3, x, 1]
    P2.read[4, op4, x, 1]
    P2.sync[5, op5]
    P2.read[6, op6, y, 0]
    P3.write[7, op7, y, 1]
    P3.sync[8, op8]
    P3.write[9, op9, y, 2]
}

fact {
    y.final[2]
}

Allowed:
    run { Allowed_PPC } for 5 int expect 0