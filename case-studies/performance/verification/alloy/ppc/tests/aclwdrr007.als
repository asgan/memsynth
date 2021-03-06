module tests/aclwdrr007

open program
open model

/**
PPC aclwdrr007
"Fre LwSyncdWW Wse Rfe LwSyncdRR"
Cycle=Fre LwSyncdWW Wse Rfe LwSyncdRR
Relax=ACLwSyncdRR
Safe=Fre Wse LwSyncdWW
{
0:r2=y; 0:r4=x;
1:r2=x;
2:r2=x; 2:r4=y;
}
 P0           | P1           | P2           ;
 li r1,1      | li r1,2      | lwz r1,0(r2) ;
 stw r1,0(r2) | stw r1,0(r2) | lwsync       ;
 lwsync       |              | lwz r3,0(r4) ;
 li r3,1      |              |              ;
 stw r3,0(r4) |              |              ;
exists
(x=2 /\ 2:r1=2 /\ 2:r3=0)


**/


one sig x, y extends Location {}

one sig P1, P2, P3 extends Processor {}

one sig op1 extends Write {}
one sig op2 extends Lwsync {}
one sig op3 extends Write {}
one sig op4 extends Write {}
one sig op5 extends Read {}
one sig op6 extends Lwsync {}
one sig op7 extends Read {}

fact {
    P1.write[1, op1, y, 1]
    P1.lwsync[2, op2]
    P1.write[3, op3, x, 1]
    P2.write[4, op4, x, 2]
    P3.read[5, op5, x, 2]
    P3.lwsync[6, op6]
    P3.read[7, op7, y, 0]
}

fact {
    x.final[2]
}

Allowed:
    run { Allowed_PPC } for 4 int expect 1