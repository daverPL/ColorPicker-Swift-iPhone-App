
import UIKit

class ColorListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    var colors = [UIColor]()
    var colorNames = [String]()
    var colorNumbers = [Int]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        loadColors()
        
    }
    
    
    func loadColors() {
        
        colors.removeAll()
        colorNames.removeAll()
        colorNumbers.removeAll()
        
        if NSUserDefaults.standardUserDefaults().objectForKey(LAST_COLOR_NUMBER_KEY) != nil {
            let lastColorNumber = NSUserDefaults.standardUserDefaults().integerForKey(LAST_COLOR_NUMBER_KEY)
            
            for i in 1...lastColorNumber {
                
                if let color = NSUserDefaults.standardUserDefaults().colorForKey("Color_\(i)") {
                    let colorName = NSUserDefaults.standardUserDefaults().stringForKey("Color_\(i)_Name")!
                    
                    
                    colors.append(color)
                    colorNames.append(colorName)
                    colorNumbers.append(i)
                }
                
            }
            
        }
        table.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ColorCellTableViewCell
        
        cell.nameLabel.text = colorNames[colors.count - 1 - indexPath.row]
        cell.backgroundColor = colors[colors.count - 1 - indexPath.row]
        cell.valuesLabel.text = colors[colors.count - 1 - indexPath.row].rgbString()
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete
            
        {
            
            let colorNumber = colorNumbers[indexPath.row]
            
            NSUserDefaults.standardUserDefaults().removeObjectForKey("Color_\(colorNumber)")
            NSUserDefaults.standardUserDefaults().removeObjectForKey("Color_\(colorNumber)_Name")
            
            colors.removeAtIndex(indexPath.row)
            colorNames.removeAtIndex(indexPath.row)
            colorNumbers.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
        
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Usuń"
    }
    
}
