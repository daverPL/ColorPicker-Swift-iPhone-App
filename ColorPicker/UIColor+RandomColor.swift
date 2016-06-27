import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random_uniform(256)) / 256.0
        
        let saturation = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        
        let brightness = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}