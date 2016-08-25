//
//  ViewController.swift
//  CAGradientLayer
//
//  Created by noveltek on 2016/8/24.
//  Copyright © 2016年 noveltek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    var colorSets = [[CGColor]]()
    
    var currentColorSet: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createColorSets()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }

    func createGradientLayer(){
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        /**
         single color assign, use color array replace. colorSets.
         */
//        gradientLayer.colors = [UIColor.redColor().CGColor, UIColor.yellowColor().CGColor, UIColor.purpleColor().CGColor]
        
        gradientLayer.colors = colorSets[currentColorSet]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func createColorSets() {
        colorSets.append([UIColor.redColor().CGColor, UIColor.yellowColor().CGColor])
        colorSets.append([UIColor.greenColor().CGColor, UIColor.magentaColor().CGColor])
        colorSets.append([UIColor.grayColor().CGColor, UIColor.lightGrayColor().CGColor])
        colorSets.append([UIColor.blueColor().CGColor, UIColor.brownColor().CGColor])
        
        currentColorSet = 0
    }
    
    func handleTapGesture(gestureRecognizer: UITapGestureRecognizer) {
        if currentColorSet < colorSets.count - 1 {
            currentColorSet! += 1
        }
        else {
            currentColorSet = 0
        }
        
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
            colorChangeAnimation.duration = 2.0
            colorChangeAnimation.toValue = colorSets[currentColorSet]
            colorChangeAnimation.fillMode = kCAFillModeForwards
            colorChangeAnimation.removedOnCompletion = false
        
        // Add this line to make the ViewController class the delegate of the animation object.
        colorChangeAnimation.delegate = self
        
        gradientLayer.addAnimation(colorChangeAnimation, forKey: "colorChange")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = colorSets[currentColorSet]
        }
    }

}

/**
 属性	            说明
 duration	        动画时长（秒为单位）（注：此处与原文有出入）
 repeatCount	    重复次数。永久重复的话设置为HUGE_VALF。
 beginTime	        指定动画开始时间。从开始指定延迟几秒执行的话，请设置为「CACurrentMediaTime() + 秒数」的形式。
 timingFunction	    设定动画的速度变化
 autoreverses	    动画结束时是否执行逆动画
 
 属性	            说明
 fromValue	        开始值
 toValue	        终了值（絶対値）
 byValue	        终了值（相对值）
 */