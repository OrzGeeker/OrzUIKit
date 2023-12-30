// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

import UIKit

@objc public extension UIColor {
        
    static let test1: UIColor = ColorScheme.test1.color

    static let test2: UIColor = ColorScheme.test2.color

    static let test3: UIColor = ColorScheme.test3.color

    static let test4: UIColor = ColorScheme.test4.color

}

public enum ColorScheme: String, CaseIterable {
    
        case test1

        case test2

        case test3

        case test4


    public var color: UIColor { UIColor.uikitColor(with: self.rawValue) }

    public var name: String { String(describing: self) }
}
