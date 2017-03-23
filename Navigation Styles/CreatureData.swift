//
//  CreatureData.swift
//  Navigation Styles
//
//  Created by Christopher Andrews on 3/11/17.
//  Copyright © 2017 Andrews, Christopher P. All rights reserved.
//

import Foundation
import UIKit



struct Creature{
    var label: String
    var image: UIImage?
    
    init(label:String, image:UIImage?){
        
        self.label = label
        self.image = image
    }
}


private var creatureLookup: Dictionary<String, Creature> = [
    "Dalek": Creature(label: "Exterminate!", image: #imageLiteral(resourceName: "dalek")),
    "Cyberman" : Creature(label: "Delete!", image: #imageLiteral(resourceName: "cyberman")),
    "Auton": Creature(label: "...", image: #imageLiteral(resourceName: "auton"))
]

func getCreature(type:String)->Creature?{
    return creatureLookup[type]
}

