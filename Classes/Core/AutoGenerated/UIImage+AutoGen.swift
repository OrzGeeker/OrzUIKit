// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

import UIKit

@objc public extension UIImage {
        
    static let test2: UIImage = ImageAssets.test2.image

    static let test3: UIImage = ImageAssets.test3.image

    static let test1: UIImage = ImageAssets.test1.image

}

public enum ImageAssets: String, CaseIterable {
    
        case test2

        case test3

        case test1

    
    public var name: String { String(describing: self) }

    public var image: UIImage { .uikitImage(name: self.rawValue) }
}

