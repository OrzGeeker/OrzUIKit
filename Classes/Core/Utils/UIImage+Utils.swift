@objc public extension UIImage {

    static func uikitImage(name: String) -> UIImage {

        guard let image = UIImage(named: name, in: .swiftAssetsBundle, compatibleWith: nil)
        else {
            return UIImage()
        }
        return image
    }
}
