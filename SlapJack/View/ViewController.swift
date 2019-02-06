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
    

    @IBOutlet weak var cardsGoneThroughLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    // buttonState? B.setTitle(for:_)
    
    //    @IBAction func newGameButtonState() {
    //        newGameButton.setTitle(for: _)
    //    }
    
    
    @IBAction func newGameButtonTapped(_ sender: UIButton) {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    // Build Timer
    
    // Once you have a timer. Display a different card every second
    
    // Build a tap Gesture Recognizer. If the screen is tapped and the singleCard variable is a Jack update the score accordingly
    
    var seconds = 52
    var timer = Timer()
    
    var scoreCount = 0
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fire(timer:)), userInfo: nil, repeats: true)
    }
    
//    func updateTimer() {
//        cardsIntoSeconds -= 1
//        //cardsGoneThroughLabel.text = cards.count
//    }

    @objc func fire(timer: Timer) {
        
        //deck = DeckController.sharedController.performNewDeckFetchRequest.first
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
        
//        if singleCard.cardValue == "JACK" {
//
//        }
//        currentCard = singleCard
        
        
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            DispatchQueue.main.async {
                self.cardImageView.image = image
            }
        }
        seconds -= 1

        cardsGoneThroughLabel.text = "Card \(seconds)"
        
        
        if seconds == 0 {
            newGameButton.isHidden = false
            cardPic()
            
        
            
            DeckController.sharedController.deleteDeck(deckToDelete: deck)
            
            timer.invalidate()
        }
        
       
    }
    
    func cardPic() {
        let backgroundImage = cardImageView
        backgroundImage?.image = UIImage(named: "aceOfSpades")!
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else {return}
        if sender.state == .ended {
            if currentCard?.cardValue == "JACK" {
                scoreCount += 1
                scoreLabel.text = "Score \(scoreCount)"
                

            } else {
                scoreCount -= 1
                scoreLabel.text = "\(scoreCount)"
            }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score \(scoreCount)"
        newGameButton.isHidden = true
        newGameButton.layer.cornerRadius = 5.0
        
                let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender: )))
                self.view.addGestureRecognizer(tap)

        
        
        
        
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
        
        
        
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            // calling my searchCardImage func on my chosen cards url string that is now a URL and doing a completion on image wich i have turned into a  uiImage from network
            DispatchQueue.main.async {
                self.cardImageView.image = image
                // passing my now decoded image (which is now an image no longer a url string) into the cardImageView outlet
            }
        }
        
        
        
        cardsGoneThroughLabel.text = "Card \(cards.count)"
        
        runTimer()
    }
    
    
    
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        cardPic()
        if pauseButton.titleLabel?.text == "Pause" {
            timer.invalidate()
            pauseButton.setTitle("Play", for: .normal)
        } else {
            
            if pauseButton.titleLabel?.text == "Play" {
                runTimer()
                pauseButton.setTitle("Pause", for: .normal)
                
                
            }
            
        }
    }
    
}
