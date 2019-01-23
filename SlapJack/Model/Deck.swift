//
//  Deck.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/18/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

extension Deck {
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        guard let deckId = dictionary["deck_id"] as? String else {return nil}
        
        self.init(context: context)
        
            self.deckId = deckId
        
    }
}
