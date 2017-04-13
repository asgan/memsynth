#lang racket
; THIS FILE IS AUTOMATICALLY GENERATED
; from log file: demos/logs/log-20161014.txt
(require "../../../../litmus/litmus.rkt" ocelot
         "../../../../frameworks/alglave/model.rkt")
(provide models)

(define rf (declare-relation 2 "rf"))

(define models
  (list
    (memory-model 'model0 (& po (- dp (-> Writes MemoryEvent))) (-> none none) (+ (^ (+ (:> (+ (:> (join (:> po Syncs) po) Reads) (join (join (:> po Syncs) po) rf)) Reads) (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (join Reads (:> (:> (join (:> po Syncs) po) Reads) Reads))))) (^ (join (:> (:> (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) Reads) (:> (:> (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) Reads)))) #f)
    (memory-model 'model1 (& po (& (-> Reads MemoryEvent) dp)) (-> none none) (+ (^ (:> (+ (+ (<: (join Reads (join (:> po Syncs) po)) (:> (join (:> po Syncs) po) Reads)) (:> (join (join (:> po Syncs) po) rf) (join Writes rf))) (:> (+ (+ rf (join (:> po Syncs) po)) (<: Writes (join (:> po Syncs) po))) (+ (join Writes (join (:> po Syncs) po)) (join (join (:> po Syncs) po) Writes)))) (<: (+ Writes Reads) (join (+ Writes Reads) (+ (+ rf (join (:> po Syncs) po)) (:> (join (:> po Syncs) po) Reads)))))) (^ (:> (+ (+ (join (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)) (+ (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) (<: Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (:> (join (<: Writes (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (:> rf Reads)) (join (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) Writes))) (+ (join Reads (<: Reads (<: Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (:> (join Writes (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)))) (join (+ Writes Reads) (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))))))) #f)
    (memory-model 'model2 (& po (+ (-> Writes Reads) (-> Writes MemoryEvent))) (-> none none) (+ (^ (:> (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (:> (join Reads (:> (join (:> po Syncs) po) Reads)) Reads)) (join Reads (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads)))) (^ (join (+ (:> (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) (+ (+ (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads))) (+ (:> (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) (+ (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (<: Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)))) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) Reads)))))) #f)
    (memory-model 'model3 (& po (& dp (-> Reads Writes))) (-> none none) (+ (^ (<: (+ (:> (+ (join rf Reads) (join (join (:> po Syncs) po) Writes)) (:> Writes (+ Writes Reads))) (:> (join Writes (:> rf Reads)) (:> (join (join (:> po Syncs) po) Writes) Reads))) (<: (+ Writes (:> Reads (join (join (:> po Syncs) po) Writes))) (:> (+ (:> (join (:> po Syncs) po) Reads) (join (join (:> po Syncs) po) rf)) Reads)))) (^ (:> (:> (+ (<: (join Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)))) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) (join Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (+ (+ (join rf Reads) (join Writes rf)) (join (<: Reads Writes) (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (+ (join (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) (+ (join Reads (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes)) (join Writes (<: Writes rf))))))) #f)
    (memory-model 'model4 (& po (+ (-> Reads Writes) (& (-> Writes Writes) (join loc (~ loc))))) (- rf (- rf (- rf (join proc (~ proc))))) (+ (^ (:> (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) Reads) Reads)) (^ (+ (<: (+ (join (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) Writes) (join (<: Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) Reads)) (:> (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)))) (<: (join Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) Writes))) (:> (+ (join (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)) (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (:> rf Reads))) (join (<: Reads (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes)) (+ Writes (<: Reads Writes))))))) #f)
    (memory-model 'model5 (& po dp) (-> none none) (+ (^ (+ (+ (<: (+ Writes Reads) (+ (join (join (:> po Syncs) po) rf) (<: Writes (join (:> po Syncs) po)))) (:> (join (+ rf (join (:> po Syncs) po)) (join (:> po Syncs) po)) (+ Writes Reads))) (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (join (:> (:> (join (:> po Syncs) po) Reads) (<: Reads Writes)) Reads)))) (^ (+ (:> (<: (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (join (+ Writes Reads) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes))) (+ (:> (<: (+ Writes Reads) (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (<: Reads (join Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (:> (:> (:> rf Reads) Reads) (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes)))))) #f)
    (memory-model 'model6 (& po (-> (- Reads Writes) Writes)) (-> none none) (+ (^ (join (+ (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (+ (:> (:> (join (:> po Syncs) po) Reads) Reads) (+ (join (:> po Syncs) po) (:> (join (:> po Syncs) po) Reads)))) (+ (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (+ (:> (:> (join (:> po Syncs) po) Reads) Reads) (+ (:> rf Reads) (:> (join (:> po Syncs) po) Writes)))))) (^ (:> (+ (+ (:> (:> rf Reads) (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes)) (:> (join (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) rf) (+ Writes Reads))) (:> (<: (join Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (:> rf Reads)) Reads)) (join (:> (:> (+ Writes Reads) Writes) Writes) (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (:> (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) Reads)))))) #f)
    (memory-model 'model7 (& po (& (-> MemoryEvent Writes) (- po dp))) (& rf (- (-> univ univ) (- rf (- rf (join proc (~ proc)))))) (+ (^ (:> (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) Reads) Reads)) (^ (:> (:> (:> (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads) Reads) Reads) Reads))) #f)
    (memory-model 'model8 (& po (+ (-> MemoryEvent MemoryEvent) (& (-> Writes Writes) (join loc (~ loc))))) rf (+ (^ (:> (:> (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) Reads) Reads)) (^ (join (:> (:> (+ (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)) (+ Writes Reads)) (+ Reads (:> Writes (+ Writes Reads)))) (:> (+ (+ (+ rf (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))) (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads)) (+ (+ (+ Writes Reads) (:> Reads Writes)) (:> (:> Reads Writes) Reads)))))) #f)
    (memory-model 'model9 (& po (+ (-> Reads Writes) (& (-> Writes Writes) (join loc (~ loc))))) rf (+ (^ (join (<: Reads (:> (<: (+ Writes Reads) (:> (join (:> po Syncs) po) Writes)) (:> Writes (+ Writes Reads)))) (+ (:> (:> (:> (join (:> po Syncs) po) Reads) Reads) Reads) (:> (+ (+ rf (join (:> po Syncs) po)) (:> (join (:> po Syncs) po) Reads)) Reads)))) (^ (+ (:> (join (:> (:> rf Reads) Reads) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) Reads)) (join Reads (<: Reads (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads)))) (join (+ (:> (:> rf Reads) Reads) (<: Reads (<: Reads (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po))))) (+ (+ (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Reads) (:> rf Reads)) (:> (:> (& (+ (-> Reads MemoryEvent) (-> Writes Writes)) (join (:> po Lwsyncs) po)) Writes) (:> Reads Writes))))))) #f)
    ))