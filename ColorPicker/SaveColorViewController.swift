
import UIKit

class SaveColorViewController: UIViewController {
    
    var colorToSave : UIColor?
    
    @IBOutlet weak var colorNameText: UITextField!
    
    @IBAction func saveColor (sender: AnyObject) {
        self.colorNameText.resignFirstResponder()
        
        
        if(colorNameText.text == nil || colorNameText.text!.isEmpty) { //user didn't write name
            let message = "You didn't write name"
            
            let alert = UIAlertController(title: "Write name", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            var newColorNumber = 1
            
            if NSUserDefaults.standardUserDefaults().objectForKey(LAST_COLOR_NUMBER_KEY) != nil
            {
                newColorNumber = NSUserDefaults.standardUserDefaults().integerForKey(LAST_COLOR_NUMBER_KEY) + 1
            }
            
            NSUserDefaults.standardUserDefaults().setColor(colorToSave, forKey: "Color_\(newColorNumber)")
            NSUserDefaults.standardUserDefaults().setValue(colorNameText.text, forKey: "Color_\(newColorNumber)_Name")
            
            NSUserDefaults.standardUserDefaults().setInteger(newColorNumber, forKey: LAST_COLOR_NUMBER_KEY)
            
            tabBarController?.selectedIndex = 1
            self.navigationController?.popViewControllerAnimated(false)
            
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = colorToSave {
            view.backgroundColor = color
        }
    }
}
