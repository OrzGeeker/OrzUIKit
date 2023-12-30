// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

@objc public extension UIColor {
        
    static let test1: UIColor = Scheme.test1.color

    static let test2: UIColor = Scheme.test2.color

    static let test3: UIColor = Scheme.test3.color

}


extension UIColor {

    enum Scheme: String, CaseIterable {
        
        case test1

        case test2

        case test3

    }
}

extension UIColor.Scheme {

    var color: UIColor { UIColor.uikitColor(with: self.rawValue) }

    var name: String { String(describing: self) }
}

