// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================

import UIKit

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
#if canImport(Core)
    static let resourceBundle = Bundle.module
#else
    static let resourceBundle = Bundle.bundle(with: "OrzUIKit")
#endif
}