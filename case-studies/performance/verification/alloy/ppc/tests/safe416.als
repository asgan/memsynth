module tests/safe416

open program
open model

/**
PPC safe416
"SyncsWR Fre SyncdWW Rfe SyncdRR Fre"
Cycle=SyncsWR Fre SyncdWW Rfe SyncdRR Fre
Relax=
Safe=Fre SyncsWR SyncdRR BCSyncdWW
{
0:r2=y; 0:r4=x;
1:r2=x; 1:r4=y;
2:r2=y;
}
 P0           | P1           | P2           ;
 li r1,2      | lwz r1,0(r2) | li r1,1      ;
 stw r1,0(r2) | sync         | stw r1,0(r2) ;
 sync         | lwz r3,0(r4) | sync         ;
 li r3,1      |              | lwz r3,0(r2) ;
 stw r3,0(r4) |              |              ;
exists
(y=2 /\ 1:r1=1 /\ 1:r3=0 /\ 2:r3=1)


**/


one sig x, y extends Location {}

one sig P1, P2, P3 extends Processor {}

one sig op1 extends Write {}
one sig op2 extends Sync {}
one sig op3 extends Write {}
one sig op4 extends Read {}
one sig op5 extends Sync {}
one sig op6 extends Read {}
one sig op7 extends Write {}
one sig op8 extends Sync {}
one sig op9 extends Read {}

fact {
    P1.write[1, op1, y, 2]
    P1.sync[2, op2]
    P1.write[3, op3, x, 1]
    P2.read[4, op4, x, 1]
    P2.sync[5, op5]
    P2.read[6, op6, y, 0]
    P3.write[7, op7, y, 1]
    P3.sync[8, op8]
    P3.read[9, op9, y, 1]
}

fact {
    y.final[2]
}

Allowed:
    run { Allowed_PPC } for 5 int expect 0