module tests/podrwposwr031

open program
open model

/**
PPC podrwposwr031
"Fre SyncdWR Fre SyncdWR Fre SyncdWW Rfe PodRW PosWR"
Cycle=Fre SyncdWR Fre SyncdWR Fre SyncdWW Rfe PodRW PosWR
Relax=[PodRW,PosWR]
Safe=Fre SyncdWR BCSyncdWW
{
0:r2=a; 0:r4=x;
1:r2=x; 1:r4=y;
2:r2=y; 2:r4=z;
3:r2=z; 3:r4=a;
}
 P0           | P1           | P2           | P3           ;
 li r1,2      | li r1,1      | li r1,1      | lwz r1,0(r2) ;
 stw r1,0(r2) | stw r1,0(r2) | stw r1,0(r2) | li r3,1      ;
 sync         | sync         | sync         | stw r3,0(r4) ;
 lwz r3,0(r4) | lwz r3,0(r4) | li r3,1      | lwz r5,0(r4) ;
              |              | stw r3,0(r4) |              ;
exists
(a=2 /\ 0:r3=0 /\ 1:r3=0 /\ 3:r1=1 /\ 3:r5=1)


**/


one sig a, x, y, z extends Location {}

one sig P1, P2, P3, P4 extends Processor {}

one sig op1 extends Write {}
one sig op2 extends Sync {}
one sig op3 extends Read {}
one sig op4 extends Write {}
one sig op5 extends Sync {}
one sig op6 extends Read {}
one sig op7 extends Write {}
one sig op8 extends Sync {}
one sig op9 extends Write {}
one sig op10 extends Read {}
one sig op11 extends Write {}
one sig op12 extends Read {}

fact {
    P1.write[1, op1, a, 2]
    P1.sync[2, op2]
    P1.read[3, op3, x, 0]
    P2.write[4, op4, x, 1]
    P2.sync[5, op5]
    P2.read[6, op6, y, 0]
    P3.write[7, op7, y, 1]
    P3.sync[8, op8]
    P3.write[9, op9, z, 1]
    P4.read[10, op10, z, 1]
    P4.write[11, op11, a, 1]
    P4.read[12, op12, a, 1]
}

fact {
    a.final[2]
}

Allowed:
    run { Allowed_PPC } for 5 int expect 1