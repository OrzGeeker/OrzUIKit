
import UIKit

@objc public extension UIImage {

    static func uikitImage(name: String) -> UIImage {

        guard let image = UIImage(named: name, in: .resourceBundle, compatibleWith: nil)
        else {
            return UIImage()
        }
        return image
    }
}
