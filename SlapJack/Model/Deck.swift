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
        
//        var cardValue = [Card]
//        for cardValue in Card {
//            let newCard = Card(dictionary: cardValue, context: context)
//        }
//        //var array of card objects  [Card]
//       if let cards = dictionary["cards"] as? [[String: Any]] {
//            //do something
//        }
//        for card in cards {
//            let newCard = Card(dictionary: cards, context: context)
//        }
//        let setOfCards: [card]
        
        //for card in cards
        //let newCard = Card(dictionary: theBlobOfData, context: context)
        
        //create a set
        //add all the cards to the set
        
        //save the set to
//        self.card = TheSetOfCardsYouJustCreated
    }
}
