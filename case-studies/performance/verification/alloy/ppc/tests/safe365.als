module tests/safe365

open program
open model

/**
PPC safe365
"SyncdWW Rfe SyncdRR Fre SyncdWR Fre"
Cycle=SyncdWW Rfe SyncdRR Fre SyncdWR Fre
Relax=
Safe=Fre SyncdWR SyncdRR BCSyncdWW
{
0:r2=x; 0:r4=y;
1:r2=y; 1:r4=z;
2:r2=z; 2:r4=x;
}
 P0           | P1           | P2           ;
 lwz r1,0(r2) | li r1,1      | li r1,1      ;
 sync         | stw r1,0(r2) | stw r1,0(r2) ;
 lwz r3,0(r4) | sync         | sync         ;
              | lwz r3,0(r4) | li r3,1      ;
              |              | stw r3,0(r4) ;
exists
(0:r1=1 /\ 0:r3=0 /\ 1:r3=0)


**/


one sig x, y, z extends Location {}

one sig P1, P2, P3 extends Processor {}

one sig op1 extends Read {}
one sig op2 extends Sync {}
one sig op3 extends Read {}
one sig op4 extends Write {}
one sig op5 extends Sync {}
one sig op6 extends Read {}
one sig op7 extends Write {}
one sig op8 extends Sync {}
one sig op9 extends Write {}

fact {
    P1.read[1, op1, x, 1]
    P1.sync[2, op2]
    P1.read[3, op3, y, 0]
    P2.write[4, op4, y, 1]
    P2.sync[5, op5]
    P2.read[6, op6, z, 0]
    P3.write[7, op7, z, 1]
    P3.sync[8, op8]
    P3.write[9, op9, x, 1]
}

Allowed:
    run { Allowed_PPC } for 5 int expect 0