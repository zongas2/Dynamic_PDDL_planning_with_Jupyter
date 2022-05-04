(
    define (domain JettyGripDomain)
    
    (:requirements :strips )
    
    (:predicates
        (vehicle ?veh) (object ?obj) (crane ?crane) (area ?area)
        (veh_located ?vehicle ?area)                                ;?vehicle is at ?location
        (obj_located ?object ?area)                                 ;?object is at ?location (not loaded)
        (free2visit ?area)                                          ;empty area with no vehicle parked
        (connected_areas ?area1 ?area2)                             ;?area1 and ?area2 are connected (adjacent)
        (crane_holds ?crane ?object)                                ;?crane is holding ?object (not empty)
        (free2hold ?crane)                                          ;?crane is free to hold something (empty)
        (crane_belongs ?crane ?vehicle)                             ;?crane entity belonging to ?vehicle entity
        (stacked ?objBot ?objTop)                                   ;?objBot's state stacked/piled under ?objTop (in an existing stack)
        (on ?obj ?area)                                             ;?obj's is left (i.e., stacked/piled) on an empty pile at ?area (each area can have infinite empty piles)
        (free2catch ?obj)                                           ;?obj is free to be held by a crane (on top of a pile)
    )
    
    (:action veh_move
        :parameters ( ?Veh ?Area1 ?Area2 )
        :precondition (and 
						(vehicle ?Veh) (area ?Area1) (area ?Area2) (veh_located ?Veh ?Area1) (free2visit ?Area2) (connected_areas ?Area1 ?Area2)
						)
        :effect (and 
				(veh_located ?Veh ?Area2) (not (veh_located ?Veh ?Area1)) (not (free2visit ?Area2)) (free2visit ?Area1)
				)
    )
    
    (:action pickup_stacked
        :parameters ( ?Veh ?ObjTop ?ObjBot ?Area ?Crane )
        :precondition (and 
						(vehicle ?Veh) (object ?ObjTop) (object ?ObjBot) (area ?Area) (crane ?Crane)
                        (veh_located ?Veh ?Area) (obj_located ?ObjTop ?Area) (obj_located ?ObjBot ?Area)
                        (free2hold ?Crane) (free2catch ?ObjTop) (stacked ?ObjBot ?ObjTop)
                        (crane_belongs ?Crane ?Veh)
						)
        :effect (and 
					(crane_holds ?Crane ?ObjTop) (not (free2catch ?ObjTop)) (free2catch ?ObjBot) (not (stacked ?ObjBot ?ObjTop)) (not (obj_located ?ObjTop ?Area)) (not (free2hold ?Crane))
					)
    )

    (:action pickup_unstacked
        :parameters ( ?Veh ?Obj ?Area ?Crane )
        :precondition (and 
						(vehicle ?Veh) (object ?Obj) (area ?Area) (crane ?Crane)
                        (veh_located ?Veh ?Area) (obj_located ?Obj ?Area)
                        (free2hold ?Crane) (free2catch ?Obj) (on ?Obj ?Area)
                        (crane_belongs ?Crane ?Veh)
						)
        :effect (and 
				(crane_holds ?Crane ?Obj) (not (free2catch ?Obj)) (not (on ?Obj ?Area)) (not (obj_located ?Obj ?Area)) (not (free2hold ?Crane))
				)
    )
    
    (:action drop_on_top_stack
        :parameters ( ?Veh ?ObjTop ?ObjBot ?Area ?Crane )
        :precondition (and 
					(vehicle ?Veh) (object ?ObjTop) (object ?ObjBot) (area ?Area) (crane ?Crane)
                    (veh_located ?Veh ?Area) (crane_holds ?Crane ?ObjTop)
                    (free2catch ?ObjBot) (obj_located ?ObjBot ?Area)
                    (crane_belongs ?Crane ?Veh)
					)
        :effect (and 
					(obj_located ?ObjTop ?Area) (free2catch ?ObjTop) (stacked ?ObjBot ?ObjTop) (free2hold ?Crane) (not (crane_holds ?Crane ?ObjTop))
					)
    )

    (:action drop_on_floor
        :parameters ( ?Veh ?Obj ?Area ?Crane )
        :precondition (and 
					(vehicle ?Veh) (object ?Obj) (area ?Area) (crane ?Crane)
                    (veh_located ?Veh ?Area) (crane_holds ?Crane ?Obj)
                    (crane_belongs ?Crane ?Veh)
					)
        :effect (and 
					(obj_located ?Obj ?Area) (on ?Obj ?Area) (free2catch ?Obj) (free2hold ?Crane) (not (crane_holds ?Crane ?Obj))
				)
    )
)