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
    
    static let sharedController = IntroViewController()
    
    @IBAction func slapJackButtonTapped(_ sender: Any) {
        DeckController.sharedController.performNewDeckFetchRequest
    }
    
    override func viewDidLoad() {
        slapJackButton.layer.cornerRadius = 5.0
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "aceOfDiamondsImage")!)

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
