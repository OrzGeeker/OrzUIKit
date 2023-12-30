import UIKit
import SnapKit

#if canImport(Core)
import Core
#endif

final class CollectionItemPage: UIViewController {

    let itemType: ItemType

    init(itemType: ItemType) {
        self.itemType = itemType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let column: CGFloat = 3
        let padding = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let columnWidth = (view.bounds.size.width - (column - 1) * flowLayout.minimumInteritemSpacing - padding) / column
        flowLayout.itemSize = CGSize(width: columnWidth, height: 60 + 12 + 8)
        flowLayout.scrollDirection = .vertical
        var ret = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)

        ret.delegate = self

        ret.dataSource = self

        ret.register(ColorCell.self, forCellWithReuseIdentifier: ItemType.colorScheme.rawValue)

        ret.register(ImageCell.self, forCellWithReuseIdentifier: ItemType.image.rawValue)

        ret.showsVerticalScrollIndicator = false
        
        ret.backgroundColor = .white

        return ret

    }()


    lazy var items: [Any] = {

        switch itemType {
        case .colorScheme:
            return ColorScheme.allCases.sorted { $0.name < $1.name }
        case .image:
            return ImageAssets.allCases.sorted { $0.name < $1.name }
        }

    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaInsets.top)
            make.bottom.equalTo(self.view.safeAreaInsets.bottom)
            make.left.right.equalTo(self.view)
        }

        collectionView.reloadData()
    }
}

extension CollectionItemPage: UICollectionViewDelegate, UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemType.rawValue, for: indexPath)

        let item = items[indexPath.row]

        if let colorCell = cell as? ColorCell, let schemeColor = item as? ColorScheme {

            colorCell.colorView.backgroundColor = schemeColor.color

            colorCell.nameLabel.text = schemeColor.name

            colorCell.hexValueLabel.text = schemeColor.color.hexValue

        } else if let imageCell = cell as? ImageCell, let imageAsset = item as? ImageAssets {

            imageCell.imageView.image = imageAsset.image
        }

        return cell
    }
}


class ColorCell: UICollectionViewCell {

    lazy var colorView: UIView = { 
        let ret = UIView()

        ret.layer.borderColor = UIColor.black.cgColor

        ret.layer.borderWidth = 1

        ret.layer.cornerRadius = 5

        ret.layer.masksToBounds = true

        return ret
    }()

    lazy var nameLabel: UILabel = {

        let ret = UILabel()

        ret.textColor = .black

        ret.textAlignment = .center

        ret.font = .systemFont(ofSize: 12, weight: .medium)

        return ret
    }()

    lazy var hexValueLabel: UILabel = {

        let ret = UILabel()

        ret.textColor = .black

        ret.textAlignment = .center

        ret.font = .systemFont(ofSize: 8)

        return ret
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(hexValueLabel)

        colorView.snp.makeConstraints { make in
            make.left.top.right.equalTo(contentView)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(colorView.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(nameLabel.font.lineHeight)
        }

        hexValueLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.bottom.right.equalTo(contentView)
            make.height.equalTo(hexValueLabel.font.lineHeight)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ImageCell: UICollectionViewCell {


    lazy var imageView: UIImageView = {

        let ret = UIImageView()

        ret.contentMode = .scaleAspectFit

        return ret

    }()


    override init(frame: CGRect) {

        super.init(frame: frame)

        contentView.addSubview(imageView)

        imageView.snp.makeConstraints { make in

            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
