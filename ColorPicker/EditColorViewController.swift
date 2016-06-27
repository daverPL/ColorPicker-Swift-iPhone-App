//
//  ViewController.swift
//  ColorPicker
//
//  Created by Dawid Raczka on 24.06.2016.
//  Copyright © 2016 daver. All rights reserved.
//

import UIKit

class EditColorViewController: UIViewController {
    
    var selectedColor :UIColor!
    
    @IBOutlet var previewContainer: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func actionRandomColor(sender: AnyObject) {
        //Button action:
        
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        
       UIColor.randomColor().getRed(&r, green: &g, blue: &b, alpha: &a)
        
        redSlider.value = Float(r)
        greenSlider.value = Float(g)
        blueSlider.value = Float(b)
        
        updateInterface()
    }
    
    @IBAction func actionSliderChanged(sender: UISlider) {
        //Sliders action:
        updateInterface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateInterface()
    }
    
    func updateInterface() {
        let selectedRed = CGFloat(redSlider.value)
        let selectedGreen = CGFloat(greenSlider.value)
        let selectedBlue = CGFloat(blueSlider.value)
        
        selectedColor = UIColor(red: selectedRed, green: selectedGreen, blue: selectedBlue, alpha: 1.0)
        
        previewContainer.backgroundColor = selectedColor
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let indentifier = segue.identifier {
            if (indentifier == "save") {
                
                let viewCtrl = segue.destinationViewController as! SaveColorViewController
                
                viewCtrl.colorToSave = selectedColor
            }
        }
    }
    
    
    
    

}

