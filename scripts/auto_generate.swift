import Foundation

let autoGenFileContentHeader = """
// ====================================================================
// ⚠️ 组件scripts目录下auto_generate.swift脚本自动生成, 请不要手动修改文件内空 |
// ====================================================================
"""

let env = ProcessInfo.processInfo.environment

let pod_assets_dir = env["pod_assets_dir"]

// 配色方案接口文件自动生成
let color_scheme_interface_file_path = env["color_scheme_interface_file_path"]

try generate_color_scheme()

func generate_color_scheme() throws {

    guard let pod_assets_dir, let color_scheme_interface_file_path
    else {
        print("color scheme file path not set in env: \n\(env)")
        return
    }

    let pod_assets_dir_URL = URL(filePath: pod_assets_dir)

    let propertiesKeys: Set<URLResourceKey> = Set(arrayLiteral: .isDirectoryKey)

    guard let allColors = FileManager.default.enumerator(at: pod_assets_dir_URL, includingPropertiesForKeys: Array(propertiesKeys))?.allObjects.compactMap({
        object -> String? in

        guard let fileURL = object as? URL,
              let resourceValues = try? fileURL.resourceValues(forKeys: propertiesKeys),
              let isDirectory = resourceValues.isDirectory, isDirectory, fileURL.pathExtension == "colorset"
        else {
            return nil
        }

        return fileURL.deletingPathExtension().lastPathComponent
    }) else {
        print("assets has not colorset defined")
        return
    }

    let static_members = allColors.reduce("") { result, color in

        let static_color_member = """

            static let \(color): UIColor = Scheme.\(color).color

        """

        return result + static_color_member
    }

    let color_scheme_interface_content = """
        \(static_members)
    """

    let allColorCaseDefine = allColors.reduce("") { result, color in

        let case_define = """

                case \(color)

        """

        return result + case_define
    }

    let color_scheme_enum_type = """

    extension UIColor {

        enum Scheme: String, CaseIterable {
            \(allColorCaseDefine)
        }
    }

    extension UIColor.Scheme {

        var color: UIColor { UIColor.uikitColor(with: self.rawValue) }

        var name: String { String(describing: self) }
    }

    """

    let target_file_content = """
    \(autoGenFileContentHeader)

    @objc public extension UIColor {
        \(color_scheme_interface_content)
    }

    \(color_scheme_enum_type)

    """

    try target_file_content.write(toFile: color_scheme_interface_file_path, atomically: true, encoding: .utf8)

    print("auto generated the color scheme file content")
}

// 图片接口文件自动生成
let image_interface_file_path = env["image_interface_file_path"]

try generate_image_interface()

func generate_image_interface() throws {

    guard let pod_assets_dir, let image_interface_file_path
    else {
        print("image file path not set in env: \n\(env)")
        return
    }

    let pod_assets_dir_URL = URL(filePath: pod_assets_dir)

    let propertiesKeys: Set<URLResourceKey> = Set(arrayLiteral: .isDirectoryKey)

    guard let allImages = FileManager.default.enumerator(at: pod_assets_dir_URL, includingPropertiesForKeys: Array(propertiesKeys))?.allObjects.compactMap({
        object -> String? in

        guard let fileURL = object as? URL,
              let resourceValues = try? fileURL.resourceValues(forKeys: propertiesKeys),
              let isDirectory = resourceValues.isDirectory, isDirectory, fileURL.pathExtension == "imageset"
        else {
            return nil
        }

        return fileURL.deletingPathExtension().lastPathComponent
    }) else {
        print("assets has not imageset defined")
        return
    }

    let static_members = allImages.reduce("") { result, image in

        let static_image_member = """

            static let \(image): UIImage = Assets.\(image).image

        """

        return result + static_image_member
    }

    let image_interface_file_content = """
        \(static_members)
    """

    let allImageCaseDefine = allImages.reduce("") { result, image in

        let case_define = """

                case \(image)

        """

        return result + case_define
    }

    let image_enum_type = """

    extension UIImage {

        enum Assets: String, CaseIterable {
            \(allImageCaseDefine)
        }
    }

    extension UIImage.Assets {
        
        var name: String { String(describing: self) }

        var image: UIImage { .uikitImage(name: self.rawValue) }
    }

    """

    let target_file_content = """
    \(autoGenFileContentHeader)

    @objc public extension UIImage {
        \(image_interface_file_content)
    }

    \(image_enum_type)

    """

    try target_file_content.write(toFile: image_interface_file_path, atomically: true, encoding: .utf8)

    print("auto generated the image interface file content")

}

// 组件资源文件访问
let resource_bundle_file_path = env["resource_bundle_file_path"]
let resource_bundle_name = env["resource_bundle_name"]

try generate_resouce_bundle()

func generate_resouce_bundle() throws {
    
    guard let resource_bundle_file_path, let resource_bundle_name
    else {
        print("resource bundle file path not set in env: \n\(env)")
        return
    }
    
    let bundle_interface_file_content="""
    \(autoGenFileContentHeader)
    
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

        static let swiftAssetsBundle = Bundle.bundle(with: "\(resource_bundle_name)")
    }
    """

    try bundle_interface_file_content.write(toFile: resource_bundle_file_path, atomically: true, encoding: .utf8)

    print("auto generated the resource bundle interface file content")
}
