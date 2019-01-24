//
//  Stack.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

enum Stack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SlapJack")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
            
        }
        
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
