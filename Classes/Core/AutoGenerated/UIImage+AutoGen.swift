// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

@objc public extension UIImage {
        
    static let test2: UIImage = Assets.test2.image

    static let test3: UIImage = Assets.test3.image

    static let test1: UIImage = Assets.test1.image

}


extension UIImage {

    enum Assets: String, CaseIterable {
        
        case test2

        case test3

        case test1

    }
}

extension UIImage.Assets {
    
    var name: String { String(describing: self) }

    var image: UIImage { .uikitImage(name: self.rawValue) }
}

