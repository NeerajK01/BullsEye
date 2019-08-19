//
//  ViewController.swift
//  BullsEye
//
//  Created by Neeraj kumar on 30/05/19.
//  Copyright © 2019 Neeraj kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    @IBAction func showAlert(){
        var difference = abs(targetValue - currentValue)
        if difference < 0{
            difference *= -1
        }
        
        let point = 100 - difference
        score += point

        
        let message = "You scored \(point) points."
        let title = "Ok"
        
        let alert = UIAlertController(title: "Bulls Eye", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of slider is now: \(slider)")
        let roundValue = slider.value.rounded()
        print(roundValue)
        currentValue = Int(roundValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    

}

