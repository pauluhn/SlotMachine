//
//  ViewController.swift
//  SlotMachine
//
//  Created by Paul on 10/2/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Containers
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    // First container
    var titleLabel: UILabel!
    
    // Information labels
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    // Buttons
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    // Constants
    let kMarginForView: CGFloat = 10.0
    let kMarginForSlot: CGFloat = 1.0
    let kHalf: CGFloat = 1.0/2.0
    let kThird: CGFloat = 1.0/3.0
    let kSixth: CGFloat = 1.0/6.0
    let kEighth: CGFloat = 1.0/8.0
    let kNumberOfContainers = 3 // Columns
    let kNumberOfSlots = 3 // Rows
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerViews()  {
        let x = self.view.bounds.origin.x + kMarginForView
        let w = self.view.bounds.width - (kMarginForView * 2)
        let h = self.view.bounds.height * kSixth
        var y = self.view.bounds.origin.y
        
        self.firstContainer = UIView(frame: CGRectMake(x, y, w, h))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        y += firstContainer.frame.height
        
        self.secondContainer = UIView(frame: CGRectMake(x, y, w, h * 3))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        y += secondContainer.frame.height

        self.thirdContainer = UIView(frame: CGRectMake(x, y, w, h))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        y += thirdContainer.frame.height
        
        self.fourthContainer = UIView(frame: CGRectMake(x, y, w, h))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }

    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        for var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                
                var x = containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) / CGFloat(kNumberOfContainers))
                var y = containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) / CGFloat(kNumberOfSlots))
                var w = containerView.bounds.width / CGFloat(kNumberOfContainers) - kMarginForSlot
                var h = containerView.bounds.height / CGFloat(kNumberOfSlots) - kMarginForSlot
                slotImageView.frame = CGRectMake(x, y, w, h)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setupThirdContainer(containerView:UIView) {
        let x = containerView.frame.width * kSixth
        let y = containerView.frame.height * kThird
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPointMake(x, y)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPointMake(x * 3, y)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPointMake(x * 5, y)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPointMake(x, y * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPointMake(x * 3, y * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPointMake(x * 5, y * 2)
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupFourthContainer (containerView: UIView) {
        let x = containerView.frame.width * kEighth
        let y = containerView.frame.height * kHalf
        
        self.resetButton = UIButton()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPointMake(x, y)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPointMake(x * 3, y)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betMaxButton.backgroundColor = UIColor.redColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPointMake(x * 5, y)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.spinButton.backgroundColor = UIColor.greenColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPointMake(x * 7, y)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }
}

