//
//  ViewController.swift
//  cathgame
//
//  Created by GÖKHAN ÖZMEN on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var tımer = Timer()
    var counter = 0
    var tvsarray = [UIImageView]()
    var hıdetımer = Timer()
    var hıghscore = 0
    
    
    
    @IBOutlet weak var tımeLabel: UILabel!
    @IBOutlet weak var tvs2: UIImageView!
    @IBOutlet weak var tvs3: UIImageView!
    @IBOutlet weak var tvs4: UIImageView!
    @IBOutlet weak var tvs5: UIImageView!
    @IBOutlet weak var tvs8: UIImageView!
    @IBOutlet weak var tvs9: UIImageView!
    @IBOutlet weak var tvs7: UIImageView!
    @IBOutlet weak var tvs6: UIImageView!
    @IBOutlet weak var tvs1: UIImageView!
    @IBOutlet weak var hıghScoreLabel:UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "SCORE : \(score)"
        let storedhıghscore = UserDefaults.standard.object(forKey: "hıghscore")
        if storedhıghscore == nil {
            hıghscore = 0
            hıghScoreLabel.text = "highscore: \(hıghscore)"
            
            
            if let newscore = storedhıghscore as? Int{
                
                hıghscore=newscore
                hıghScoreLabel.text = "hıghscore :\(hıghscore )"
            }
            
        }
        
        tvs1.isUserInteractionEnabled = true
        tvs2.isUserInteractionEnabled = true
        tvs3.isUserInteractionEnabled = true
        tvs4.isUserInteractionEnabled = true
        tvs5.isUserInteractionEnabled = true
        tvs6.isUserInteractionEnabled = true
        tvs7.isUserInteractionEnabled = true
        tvs8.isUserInteractionEnabled = true
        tvs9.isUserInteractionEnabled = true
        
        let recognızer1 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer2 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer3 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer4 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer5 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer6 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer7 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer8 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        let recognızer9 = UITapGestureRecognizer(target: self, action: #selector(ıncreaseScore))
        tvs1.addGestureRecognizer(recognızer1)
        tvs2.addGestureRecognizer(recognızer2)
        tvs3.addGestureRecognizer(recognızer3)
        tvs4.addGestureRecognizer(recognızer4)
        tvs5.addGestureRecognizer(recognızer5)
        tvs6.addGestureRecognizer(recognızer6)
        tvs7.addGestureRecognizer(recognızer7)
        tvs8.addGestureRecognizer(recognızer8)
        tvs9.addGestureRecognizer(recognızer9)
        
        tvsarray = [tvs1,tvs2,tvs3,tvs4,tvs5,tvs6,tvs7,tvs8,tvs9]
        
        
        counter = 10
        tımeLabel.text = String(counter)
        tımer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TımerCounter), userInfo: nil, repeats: true)
        hıdetımer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hıdetvs), userInfo: nil, repeats:true)
        
        hıdetvs()
        
        
    }
    
    
    @objc func hıdetvs(){
        for kenny in tvsarray{
            kenny.isHidden = true
        }
        
        
        
        let random = Int( arc4random_uniform(UInt32(tvsarray.count - 1)))
        tvsarray[random].isHidden = false
        
        
    }
    
    @objc func ıncreaseScore(){
        score += 1
        scoreLabel.text = "SCORE : \(score)"
        
        
        
    }
    
    @objc func TımerCounter(){
        counter -= 1
        tımeLabel.text = String(counter)
        if counter == 0 {
            tımer.invalidate()
            hıdetımer.invalidate()
            for kenny in tvsarray{
                kenny.isHidden = true
            }
            
            
            if self.score > self.hıghscore{
                self.hıghscore = self.score
                hıghScoreLabel.text="Hıghscore:\(hıghscore)"
                UserDefaults.standard.set(self.hıghscore, forKey: "hıghscore")
                
                
                
            }
            
            tımeLabel.text = "tıme's UP"
            
            
            let alert = UIAlertController(title: "TIME'S UP!", message: "PLAY AGAIN?", preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            let replaybutton = UIAlertAction(title: "REPLAY", style: UIAlertAction.Style.default) { UIAlertAction in
                self.score = 0
                self.counter=10
                self.scoreLabel.text = "score\(self.score)"
                self.tımeLabel.text = String(self.counter)
                
                self.tımer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.TımerCounter), userInfo: nil, repeats: true)
                self.hıdetımer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hıdetvs), userInfo: nil, repeats:true)

                
                
            }
            
            alert.addAction(okbutton)
            alert.addAction(replaybutton)
            self.present(alert, animated: true)
            
            
        }
        
        
    } }

    
    
