//
//  ViewController.swift
//  El Adivino
//
//  Created by Jair Benítez on 11/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelAnswer: UILabel!
    
    @IBOutlet weak var imageViewAnswer: UIImageView!
    
    let answerArray : [String] = ["Si", "No", "Puede Ser", "Pregunta otra vez", "Tenlo por seguro", "Ni lo sueñes"]
    let imageArray : [String] = ["si", "no", "puede_ser", "pregunta", "seguro", "no_suenes"]
    
    let nAnswer : UInt32
    
    
    required init?(coder aDecoder: NSCoder) {
        nAnswer = UInt32(self.answerArray.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            escogeFrase()
        }
    }
    
    

    @IBAction func askButtonPressed(_ sender: UIButton) {
        
        escogeFrase()
        
    }
    
    
    
    func escogeFrase() {
        
        let indexAnswer : Int = Int(arc4random_uniform(nAnswer))
        
        labelAnswer.text = self.answerArray[indexAnswer]
        
        imageViewAnswer.image = UIImage( named: self.imageArray[indexAnswer] )
        
    }
    
}

