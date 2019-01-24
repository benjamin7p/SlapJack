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

//var cardValue = [Card]
//for cardValue in Card {
//    let newCard = Card(dictionary: cardValue, context: context)
//}
////var array of card objects  [Card]
//if let cards = dictionary["cards"] as? [[String: Any]] {
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


//if let cards = dictionary["cards"] as? [[String: Any]] {
//    //do something
//}
//for card in cards {
//    let newCard = card(dictionary: "cards")
//}
//
////for card in cards
////let newCard = Card(dictionary: theBlobOfData, context: context)
//
////create a set
////add all the cards to the set
//
////save the set to
////        self.card = TheSetOfCardsYouJustCreated
//}


//extension Deck {
//    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
//        guard let deckId = dictionary["deck_id"] as? String else {return nil}
//        guard let remaining = dictionary["remaining"] as? Int64 else {return nil}
//
//        self.init(context: context)
//
//        self.deckId = deckId
//        self.cardsRemaining = remaining
