//
//  DeckController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DeckController {
    
    let newDeckURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=52"

    static let sharedController = DeckController()
    

    var searchNewDeck: [Deck] {
        let request: NSFetchRequest<Deck> = Deck.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    func GetNewDeck(completion: ((Deck?) -> Void)? = nil) {
        guard let url = URL(string: newDeckURL) else {
            print("url not working")
            return
        }
        NetworkController.performNetworkRequest(for: url) { (data, error) in
            guard let data = data else { return }

            do {
                let response = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                
            
                let newDeck = Deck(dictionary: response, context: Stack.context)
                if let cards = response["cards"] as? [[String: Any]] {
                    for cardValue in cards {
                        let newCard = Card(dictionary: cardValue)
                         newCard!.deck = newDeck
                        print(newCard?.deck)
                    }
                }
                

                if let completion = completion {
                    completion(newDeck)
                }
                
            } catch {
                print(error)
            }
        }
        
    }
    
    func deleteDeck(deck: Deck) {
        Stack.context.delete(deck)
        saveToPersistentStorage()
    }
    
//    func saveDeck(deck: Deck) {
//        guard let deckId = deck.deckId else { return }
//          let cardsRemaining = deck.cardsRemaining
//        
//        for deck in searchNewDeck {
//            deleteDeck(deck: deck)
//        }
//        
//        let deckToSave = Deck(context: Stack.context)
//        deckToSave.deckId = deckId
//        deckToSave.cardsRemaining = cardsRemaining
//        saveToPersistentStorage()
//    }
    
   func saveToPersistentStorage() {
        
        do {
            try Stack.context.save()
        } catch {
            print("deck not saved to persistent storage")
        }
    }
    
//    func getNewDeck(deck_id: String, completion: (([Deck]?) -> Void)? = nil) {
//        guard let url = URL(string: baseURL + deck_id) else {
//            print("could not get deck")
//            return
//        }
//        NetworkController.performNetworkRequest(for: url) { (data, error) in
//            guard let data = data else {return}
//
//            do {
//                let jsonObjects = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                if let dictionary = jsonObjects as? Dictionary<String, [Dictionary<String, Any>]>,
//                    let results = dictionary["results"] {
//                    var newDeck: [Deck] = []
//                    for deck1 in results {
//                        if let newDeckId = Deck(dictionary: deck1) {
//                            newDeck.append(newDeckId)
//                        }
//                    }
//                    if let completion = completion {
//                        completion(newDeck)
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }
//

    
    
    
}


