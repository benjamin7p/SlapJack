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
    
    // need to get newCardValue to pass
    
    var performNewDeckFetchRequest: [Deck] {
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
                
                if let cardsInDeck = response["cards"] as? [[String: Any]] {
                    for cardInfo in cardsInDeck {
                        let newCardInDeck = Card(dictionary: cardInfo)
                         newCardInDeck!.deck = newDeck
                        //print(cardInfo)
                        //print(newDeck?.card?.count)
                        //print(newDeck)
                        
                        //let newCardValue = [cardValue]
                        //let thisCard = Card
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
    
    
    
    func deleteDeck(deckToDelete: Deck) {
        Stack.context.delete(deckToDelete)
        saveToPersistentStorage()
    }
    
    
    // func delete(deckToDelete: Deck) {
    //        appDelegate.persistentContainer.viewContext.delete(deckToDelete)
    //
    //    }
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

    
    
    
}


