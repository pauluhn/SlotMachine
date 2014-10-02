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
    
    // Constants
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 1.0
    let kSixth:CGFloat = 1.0/6.0
    let kNumberOfContainers = 3 // Columns
    let kNumberOfSlots = 3 // Rows
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
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
}

