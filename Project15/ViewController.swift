//
//  ViewController.swift
//  Project15
//
//  Created by Sabrina Fletcher on 4/17/18.
//  Copyright © 2018 Sabrina Fletcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    var currentAnimation = 0
    
    @IBOutlet weak var tap: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(_ sender: UIButton) {
        tap.isHidden = true
        //this animation method has a spring with Damping parameter and initialVelocity, Spring is the after effect of the penguin still moving and the initail Velocity is how fast the animation moves
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: { [unowned self] in switch self.currentAnimation{
        case 0:
            //doubles the size of the penguin
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        case 1:
            //resets the penguin back to its default settings
            self.imageView.transform = CGAffineTransform.identity
        case 2:
            //moves the position of the penguin
            self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
        case 3:
            //resets the penguin back to its default settings
            self.imageView.transform = CGAffineTransform.identity
        case 4:
            //rotates the penguin 180 degrees
            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        case 5:
            //resets the penguin back to its default settings
            self.imageView.transform = CGAffineTransform.identity
        case 6:
            //makes the penguin transparent and the background color green
            self.imageView.alpha = 0.1
            self.imageView.backgroundColor = UIColor.green
        case 7:
            //makes the penguin visible and the background color clear
            self.imageView.alpha = 1
            self.imageView.backgroundColor = UIColor.clear
        default:
            break
            } }) { [unowned self] (finished: Bool) in self.tap.isHidden = false}
        
        currentAnimation += 1
        
        if currentAnimation > 7{
            currentAnimation = 0
        }
    }
    
}

