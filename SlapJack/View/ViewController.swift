//
//  ViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck: Deck?
    
    var currentCard: Card?
    var scoreCount = 0
    

    @IBOutlet weak var cardsGoneThroughLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    // buttonState? B.setTitle(for:_)
    
    //    @IBAction func newGameButtonState() {
    //        newGameButton.setTitle(for: _)
    //    }
    @IBAction func newGameButtonTapped(_ sender: Any) {
        
        DeckController.sharedController.performNewDeckFetchRequest
        guard let deck = deck else {return}
        DeckController.sharedController.deleteDeck(deckToDelete: deck)
        
    }
    
    @IBOutlet var cardTapped: [UITapGestureRecognizer]!
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    
    @IBAction func cardImageTapped(_ sender: UITapGestureRecognizer) {
        guard gestureRecognizer.view != nil else {return}
        if gestureRecognizer.state == .ended {
            if currentCard?.cardValue == "JACK" {
                print("you hit the jack")
                scoreCount += 1
                scoreLabel.text = "Score \(scoreCount)"
                
            }
        }
        
    }
    // Build Timer
    
    // Once you have a timer. Display a different card every second
    
    // Build a tap Gesture Recognizer. If the screen is tapped and the singleCard variable is a Jack update the score accordingly
    
    var seconds = 52
    var timer = Timer()
    var isTimerRunning = false
//    var cardsIntoSeconds = [seconds]
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fire(timer:)), userInfo: nil, repeats: true)
    }
    
//    func updateTimer() {
//        cardsIntoSeconds -= 1
//        //cardsGoneThroughLabel.text = cards.count
//    }

    @objc func fire(timer: Timer) {
        
        deck = DeckController.sharedController.performNewDeckFetchRequest.first
        guard let deck = deck,
            // all the cards in the deck
            let cards = deck.card,
            
            let singleCard = cards.allObjects[seconds - 1] as? Card,
            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
            let imageURLString = singleCard.cardImage,
            // getting the cardImage which is just a url string still from the chosen card
            //https://deckofcardsapi.com/static/img/QS.png
            let cardURL = URL(string: imageURLString) else {return}
        // passing my url string into type URL string
        
        if singleCard.cardValue == "JACK" {
            
        }
        currentCard = singleCard
        
        // for card in cards { [string: any]
        // let value = card["value"]
        //Card(value, _) }
        // dict["cards"] as [[string: any]].compactMap { Card(dictionary: $0) }
        
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            // calling my searchCardImage func on my chosen cards url string that is now a URL and doing a completion on image wich i have turned into a  uiImage from network
            DispatchQueue.main.async {
                self.cardImageView.image = image
                // passing my now decoded image (which is now an image no longer a url string) into the cardImageView outlet
            }
        }
        
        
        
        cardsGoneThroughLabel.text = "Card \(seconds)"
        
        //cardImageView.image = "card url \(card.)"
        //print(card)
        
        
        // need to write then call function to cycle through cards here. for singleCard in cards.allObjects
        //        cycleThroughCards()
        //        cycleThroughCards()
        //giveMeCardValue()
        //runTimer()
        if seconds == 1 {
            timer.invalidate()
            isTimerRunning = false
        }
        seconds -= 1
    }
       //cardImageView.image = current cards image
        // cardsLeftlabel = card number of 52
    
    // commented out the above code sunay
    
//    func loopCardsWithSeconds(completion: ([Card]?) -> Void)? = nil {
//        deck = DeckController.sharedController.searchNewDeck.first
//        guard let deck = deck,
//            // all the cards in the deck
//            let cards = deck.card,
//            
//            let singleCard = cards.allObjects[0] as? Card,
//            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
//            let singleCardValue = singleCard.cardValue else {return}
//        return [singleCardValue]
//    }
    
    
    
    
    // let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    //    timer.tolerance = 0.2
    //    RunLoop.current.add(timer, forMode: .commonModes)
    
    //    @objc func runTimer() {
    //        deck = DeckController.sharedController.searchNewDeck.first
    //        guard let deck = deck,
    //            // all the cards in the deck
    //            let cards = deck.card else {return}
    //            let cardStack = [cards]
    //        for cardValue in cardStack {
    //
    //        }
    //
    //            let singleCard = cards.allObjects[0] as? Card,
    //
    //            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
    //           // let cardValue = singleCard.cardValue else {return}
    //        //RunLoop.current.add(timer, forMode: .RunLoop.Mode.common)
    //
    //        for index in cardValue {
    //            if cardValue == "JACk" {
    //                print("slapJack")
    //            }
    //        }
    //
    //
    //    }
    ////
    //    func cycleThroughCards() {
    //        deck = DeckController.sharedController.searchNewDeck.first
    //        guard let deck = deck,
    //            // all the cards in the deck
    //            let cards = deck.card,
    //            let singleCard = cards.allObjects[0] as? Card,
    //            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
    //            let cardValue = singleCard.cardValue else {return}
    //
    //        let cardStack = [cardValue]
    //        for cardValue in cardStack {
    //            print("cyle through cards \(cardValue)")
    //
    //
    //
    //        }
    //    }
        @IBAction func slapJackButtonTapped(_ sender: Any) {
            //giveMeCardValue()
           // runTimer()
        }
    
    func requestCardsInDeck() {
        deck = DeckController.sharedController.performNewDeckFetchRequest.first
        guard let deck = deck,
            // all the cards in the deck
            let cards = deck.card,

            let singleCard = cards.allObjects[0] as? Card,

            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
            let cardValue = singleCard.cardValue else {return}
        print(cardValue.count)
        print(cardValue)
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score 0"
        deck = DeckController.sharedController.performNewDeckFetchRequest.first
        guard let deck = deck,
            // all the cards in the deck
            let cards = deck.card,
            
            let singleCard = cards.allObjects[0] as? Card,
            // takes all cards and selects the first card (second would be [1] etc) and casts as my version of card
            let imageURLString = singleCard.cardImage,
            // getting the cardImage which is just a url string still from the chosen card
            //https://deckofcardsapi.com/static/img/QS.png
            let cardURL = URL(string: imageURLString) else {return}
        // passing my url string into type URL string
        
        if singleCard.cardValue == "JACK" {
            
        }
        
        // for card in cards { [string: any]
        // let value = card["value"]
        //Card(value, _) }
        // dict["cards"] as [[string: any]].compactMap { Card(dictionary: $0) }
        
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            // calling my searchCardImage func on my chosen cards url string that is now a URL and doing a completion on image wich i have turned into a  uiImage from network
            DispatchQueue.main.async {
                self.cardImageView.image = image
                // passing my now decoded image (which is now an image no longer a url string) into the cardImageView outlet
            }
        }
        
        
        
        cardsGoneThroughLabel.text = "Card \(cards.count)"
        //cardImageView.image = "card url \(card.)"
        //print(card)
        
        
        // need to write then call function to cycle through cards here. for singleCard in cards.allObjects
//        cycleThroughCards()
//        cycleThroughCards()
        //giveMeCardValue()
        runTimer()
    }
    
    
    
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        DeckController.sharedController.GetNewDeck() { deck in
            DispatchQueue.main.async {
                if let deck = deck {
                    self.deck = deck
                }
            }
            
        }
        
    }
    
}


