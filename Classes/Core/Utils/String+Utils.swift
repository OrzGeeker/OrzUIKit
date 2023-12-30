
import UIKit

extension String {

    var color: UIColor {

        var hexColor = self
        
        if hexColor.hasPrefix("#") {
            
            let start = hexColor.index(hexColor.startIndex, offsetBy: 1)
            
            hexColor = String(hexColor[start...])
        }
        
        var ret: UIColor = .clear
        
        if hexColor.count == 8 || hexColor.count == 6 {
            
            let scanner = Scanner(string: hexColor)
            
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                
                let r, g, b, a: CGFloat
                
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                
                a = (hexColor.count == 8) ? CGFloat(hexNumber & 0x000000ff) / 255 : 1
                
                ret = .init(red: r, green: g, blue: b, alpha: a)
            }
        }
        
        return ret
    }

    func copyToPasteBoard() {
        UIPasteboard.general.string = self
    }
}

