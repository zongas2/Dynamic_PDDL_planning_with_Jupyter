(
    define (problem JettyGripProb1)
    
    (:domain JettyGripDomain)
    
    (:objects
        area1 area2 area3 obj1 obj2 obj3 veh1 crane1 )
    
    (:init
        (area area1) (area area2) (area area3)
        (object obj1) (object obj2) (object obj3) 
        (vehicle veh1) (crane crane1)
        
        (free2visit area1)                                  ;initially the only occupied - with a vehicle - area is only area2
        (free2visit area3)                                  ;initially the only occupied - with a vehicle - area is only area2
        (connected_areas area1 area2)                       ;connecting areas billaterally in a two-way manner
        (connected_areas area2 area1)                       ;connecting areas billaterally in a two-way manner
        (connected_areas area1 area3)                       ;connecting areas billaterally in a two-way manner
        (connected_areas area3 area1)                       ;connecting areas billaterally in a two-way manner
        
        (veh_located veh1 area2)                            ;initially the only single crane belongs to the only single vehicle
        (crane_belongs crane1 veh1) (free2hold crane1)      ;initially the crane is empty
        
        (obj_located obj1 area1) (obj_located obj3 area1)   ;initially object1 and object3 are located in area1
        (on obj1 area1)                                     ;initially object1 is located on the floor of area1
        (stacked obj1 obj3)                                 ;initially object3 is stacked over object1 in area1
        (free2catch obj3)                                   ;initially object3 is free on top
        
        (obj_located obj2 area2)                            ;initially object2 is located in area2
        (on obj2 area2)                                     ;initially object2 is located on the floor of area2
        (free2catch obj2)                                   ;initially object2 is free on top
    )
    
    (:goal 
        (and
        (veh_located veh1 area1)                            ;finally veh1 should be in area1
        (free2hold crane1)                                  ;finally crane1 should be free/empty
        
        (free2visit area2)                                  ;finally the vehicle is parked in area1 so the other two are free
        (free2visit area3)                                  ;finally the vehicle is parked in area1 so the other two are free
        
        (obj_located obj1 area3)                            ;finally all 3 objects should be in area3
        (obj_located obj2 area3)
        (obj_located obj3 area3)
        
        (free2catch obj1)                                   ;finally obj1 should be free on top
        (free2catch obj3)                                   ;finally obj3 should be free on top
        (stacked obj2 obj1)                                 ;finally obj1 should be stacked on top of obj2
        (on obj2 area3)                                     ;finally obj2 should be on the floor of area3
        (on obj3 area3)                                     ;finally obj3 should be on the floor of area3
        )
    )
)