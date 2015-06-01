//
//  ViewController.swift
//  LayerSprings
//
//  Created by Nick Brandaleone on 6/1/15.
//  Copyright (c) 2015 Nick Brandaleone. All rights reserved.
//
// Based upon article: http://www.ios-animations-by-emails.com/posts/welcome-issue#tutorial
// See: https://github.com/icanzilb/SwiftSpinner for more elaborate example
//

import UIKit

class ViewController: UIViewController {
    
    let size = CGSize(width: 200.0, height: 200.0)
    let circleView = UIView()
    let circleLayer = CAShapeLayer()
    var currentInnerRotation: CGFloat = 0.0
    var blurEffect: UIBlurEffect! = UIBlurEffect(style: .Dark)
    var blurView: UIVisualEffectView!
    var vibrancyView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Hurricane_Irene.jog")!)
        
        circleView.frame.size = size
        
        circleLayer.path = UIBezierPath(ovalInRect: circleView.frame).CGPath
        circleLayer.lineWidth = 6.0
        circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 0.4
        circleLayer.lineCap = kCALineJoinRound
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.orangeColor().CGColor
        
        // add shape to CircleView
        circleView.layer.addSublayer(circleLayer)
        
        // add the view to the root view
        circleView.center = view.center
        //circleView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        //view.addSubview(circleView)
        
        // animate by rotating pi/4 degrees every 0.5 second
        animate()
        
        // add blur and vibrancy effects
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        view.addSubview(blurView)
        
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = view.bounds
        vibrancyView.contentView.addSubview(circleView)
        view.addSubview(vibrancyView)         //blurView.contentView.addSubview(vibrancyView)
    }
    
    func animate(){
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: {
            
            self.currentInnerRotation += CGFloat(M_PI_4)
            self.circleView.transform = CGAffineTransformMakeRotation(self.currentInnerRotation)
            
            }, completion: {_ in
                self.animate()
        })
    }
    
    
}

