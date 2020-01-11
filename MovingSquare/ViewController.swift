//
//  ViewController.swift
//  MovingSquare
//
//  Created by MacStudent on 2020-01-11.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Square: UIView!
     var timer:Timer?
        var goToTop = false
        var goToBottom = true
    //    var goToLeft = false
    //    var goToRight = false
        
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
        override func viewDidLoad() {
            super.viewDidLoad()
            startTimer()
          
        }
        
        @objc func btnUp() {
            var xPosition = Square.frame.origin.x
            var yPosition = Square.frame.origin.y
            
            if goToBottom {
                yPosition += 20
            } else if goToTop {
                yPosition -= 20
            }
            
            if yPosition > h {
               // xPosition = xCordinate()
                xPosition = w - 20
                yPosition = h - 70
                goToTop = true
                goToBottom = false
            } else if yPosition < 0 {
                //xPosition = xCordinate()
                xPosition = w - 20
                yPosition +=  70
                goToTop = false
                goToBottom = true
            }
            
    //        if goToLeft{
    //            xPosition = w - 20
    //            yPosition = h - 70
    //             goToLeft = true
    //            goToRight = false
    //        } else {
    //            goToLeft = false
    //            goToRight = true
    //        }

            let width = Square.frame.size.width
            let height = Square.frame.size.height

            UIView.animate(withDuration: 1.0, animations: {
                self.Square.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            })
        }
        
    //    func xCordinate() -> CGFloat{
    //        let randomInt = Int.random(in: 1..<Int(w - 30))
    //        return CGFloat(randomInt)
    //    }
        func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 0.3,
            target: self,
            selector: #selector(btnUp),
            userInfo: nil,
            repeats: true)
        }
        func stopTimer() {
            if timer != nil {
                timer?.invalidate()
                timer = nil
            }
        }

    }

