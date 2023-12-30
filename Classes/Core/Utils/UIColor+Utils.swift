
import UIKit

extension UIColor {
    
    /// 自定义色值
    /// - Parameter hexString: 十六进制 色值字符串，支持Alpha通道
    /// - Returns: 颜色 UIColor
    static func custom(with hexString: String) -> UIColor { hexString.color }

    /// 获取组件内部资源Bundle中的颜色
    /// - Parameter name: 颜色命名
    /// - Returns: 颜色对象
    static func uikitColor(with name: String) -> UIColor {
        guard let color = UIColor(named: name, in: .resourceBundle, compatibleWith: nil)
        else {
            return .clear
        }
        return color
    }

    // 获取颜色十六进制字符串
    public var hexValue: String {
        
        let components = self.cgColor.components
        
        let r: CGFloat = components?[0] ?? 0
        let g: CGFloat = components?[1] ?? 0
        let b: CGFloat = components?[2] ?? 0
        let a: CGFloat = components?[3] ?? 1
        
        return .init(
            format: "#%02lX%02lX%02lX%02lX",
            lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)), lroundf(Float(a * 255))
        )
    }
}
