module tests/safe029

open program
open model

/**
PPC safe029
"SyncdWR Fre SyncsWW Rfe SyncdRW Rfe DpdW Wse"
Cycle=SyncdWR Fre SyncsWW Rfe SyncdRW Rfe DpdW Wse
Relax=
Safe=Fre Wse SyncdWR DpdW BCSyncsWW BCSyncdRW
{
0:r2=x;
1:r2=x; 1:r4=y;
2:r2=y; 2:r5=z;
3:r2=z; 3:r4=x;
}
 P0           | P1           | P2            | P3           ;
 li r1,1      | lwz r1,0(r2) | lwz r1,0(r2)  | li r1,2      ;
 stw r1,0(r2) | sync         | xor r3,r1,r1  | stw r1,0(r2) ;
 sync         | li r3,1      | li r4,1       | sync         ;
 li r3,2      | stw r3,0(r4) | stwx r4,r3,r5 | lwz r3,0(r4) ;
 stw r3,0(r2) |              |               |              ;
exists
(x=2 /\ z=2 /\ 1:r1=2 /\ 2:r1=1 /\ 3:r3=0)


**/


one sig x, y, z extends Location {}

one sig P1, P2, P3, P4 extends Processor {}

one sig op1 extends Write {}
one sig op2 extends Sync {}
one sig op3 extends Write {}
one sig op4 extends Read {}
one sig op5 extends Sync {}
one sig op6 extends Write {}
one sig op7 extends Read {}
one sig op8 extends Write {}
one sig op9 extends Write {}
one sig op10 extends Sync {}
one sig op11 extends Read {}

fact {
    P1.write[1, op1, x, 1]
    P1.sync[2, op2]
    P1.write[3, op3, x, 2]
    P2.read[4, op4, x, 2]
    P2.sync[5, op5]
    P2.write[6, op6, y, 1]
    P3.read[7, op7, y, 1]
    P3.write[8, op8, z, 1] and op8.dep[op7]
    P4.write[9, op9, z, 2]
    P4.sync[10, op10]
    P4.read[11, op11, x, 0]
}

fact {
    x.final[2]
    z.final[2]
}

Allowed:
    run { Allowed_PPC } for 5 int expect 0