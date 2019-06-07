//
//  Card.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/24/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

extension Card {
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        guard let image = dictionary["image"] as? String else {return nil}
        guard let suit = dictionary["suit"] as? String else {return nil}
        guard let value = dictionary["value"] as? String else {return nil}
        
        self.init(context: context)
        
        self.cardImage = image
        self.cardSuit = suit
        self.cardValue = value
    }
}

