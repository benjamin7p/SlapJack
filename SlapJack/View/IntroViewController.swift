//
//  IntroViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/25/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var slapJackButton: UIButton!
    
    var deck: Deck = Deck()
    
    
    @IBAction func slapJackButtonTapped(_ sender: Any) {
        DeckController.sharedController.searchNewDeck
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeckController.sharedController.GetNewDeck() { deck in
            DispatchQueue.main.async {
                if let deck = deck {
                    self.deck = deck
                    DeckController.sharedController.saveToPersistentStorage()
                }
            }
        }
        
    }
}
