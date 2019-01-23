//
//  Deck.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

//class DeckManager {
//    
//    let context: NSManagedObjectContext
//    let appDelegate: AppDelegate
//    
//    init(appDelegate: AppDelegate) {
//        self.appDelegate = appDelegate
//        self.context = appDelegate.persistentContainer.viewContext
//    }
//    
//    func fetchData() -> [Deck] {
//        let request = NSFetchRequest<Deck>(entityName: "Deck")
//        do {
//            return try context.fetch(request)
//        } catch {
//            return []
//        }
//    }
//
//    func createNewDeck(newDeckId: String) -> Deck {
//        let deck = Deck(context: appDelegate.persistentContainer.viewContext)
//        deck.deckId = newDeckId
//        return deck
//    }
//    
//    func save() {
//        appDelegate.saveContext()
//    }
//    
//    func delete(deckToDelete: Deck) {
//        appDelegate.persistentContainer.viewContext.delete(deckToDelete)
//        
//    }
//    
////    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext
////    = Stack.context) {
////        guard let deck_id = dictionary["deck_id"] as? String else {return nil}
////
////
////    self.init(context: context)
////        self.deck_id = deck_id
////    }
//    
//    // deck manager file with deck extention for fetching funcs
//}
