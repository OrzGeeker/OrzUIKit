// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

extension Bundle {

    static func bundle(with name: String) -> Bundle {

        guard let resourcePath = Bundle.main.path(forResource: name, ofType: "bundle"),
              let bundle = Bundle(path: resourcePath)
        else {
            return .main
        }
        
        return bundle
    }
}

extension Bundle {

    static let swiftAssetsBundle = Bundle.bundle(with: "OrzUIKit")
}