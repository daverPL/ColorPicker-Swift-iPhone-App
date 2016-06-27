import UIKit

extension UIColor {
    
    func rgbString() -> String {
        
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String((Int)(r*255)) + " / " + String((Int)(g*255)) + " / " + String((Int)(b*255))
        
    }
    
}
