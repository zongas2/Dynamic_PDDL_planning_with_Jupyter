(define (problem pb2)
  (:domain dwr2)
  (:objects
    r1 r2 r3 - robot
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 - location
    k1 k2 k3 - crane
    p1 q1 p2 q2 p5 p12 p14 - pile
    ca cb cc cd ce cf pallet - container
  )
  (:init
    (adjacent l1 l2) (adjacent l2 l1)
    (adjacent l1 l3) (adjacent l3 l1)
    (adjacent l1 l4) (adjacent l4 l1)
    (adjacent l2 l3) (adjacent l3 l2)
    (adjacent l4 l3) (adjacent l3 l4)
    (adjacent l3 l5) (adjacent l5 l3)
    (adjacent l5 l6) (adjacent l6 l5)
    (adjacent l5 l7) (adjacent l7 l5)
    (adjacent l5 l8) (adjacent l8 l5)
    (adjacent l6 l7) (adjacent l7 l6)
    (adjacent l7 l12) (adjacent l12 l7)
    (adjacent l8 l9) (adjacent l9 l8)
    (adjacent l9 l10) (adjacent l10 l9)
    (adjacent l10 l11) (adjacent l11 l10)
    (adjacent l11 l12) (adjacent l12 l11)
    (adjacent l11 l13) (adjacent l13 l11)
    (adjacent l11 l14) (adjacent l14 l11)
    (adjacent l12 l13) (adjacent l13 l12)
    (adjacent l13 l14) (adjacent l14 l13)
    (adjacent l14 l15) (adjacent l15 l14)

    (attached p1 l1) (attached q1 l1)
    (attached p2 l2) (attached q2 l2)
    (attached p5 l5)
    (attached p12 l12)
    (attached p14 l14)

    (belong k1 r1)
    (belong k2 r2)
    (belong k3 r3)

    (in ca p1) (in cb p1) (in cc p1)
    (in cd q1) (in ce q1) (in cf q1)
    (top cc p1) (on cc cb) (on cb ca) (on ca pallet)
    (top cf q1) (on cf ce) (on ce cd) (on cd pallet)
    (top pallet p2)
    (top pallet q2)
    (top pallet p5)
    (top pallet p12)
    (top pallet p14)

    (at r1 l1)
    (unloaded r1)
    (occupied l1)

    (at r2 l7)
    (unloaded r2)
    (occupied l7)

    (at r3 l13)
    (unloaded r3)
    (occupied l13)

    (empty k1)
    (empty k2)
    (empty k3)

    (equal ca ca) (equal cb cb) (equal cc cc) (equal cd cd) (equal ce ce) (equal cf cf) (equal pallet pallet)
  )
  (:goal (and (in ca p2) (in cb p2) (in cd p5) (in ce p12) (in cf p14) ))
)