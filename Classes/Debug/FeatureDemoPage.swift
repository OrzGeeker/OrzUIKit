import UIKit
import SnapKit

enum ItemType: String, CaseIterable {

    case colorScheme
    case image

    var title: String {
        switch self {
        case .colorScheme:
            return "配色方案 (共\(UIColor.Scheme.allCases.count)种)"
        case .image:
            return "图片资源 (共\(UIImage.Assets.allCases.count)个)"
        }
    }
}

@objc(OrzUIKitFeatureDemoPage)
@objcMembers
public final class FeatureDemoPage: UIViewController {


    lazy var tableView: UITableView = {

        let ret = UITableView(frame: .zero, style: .plain)

        ret.delegate = self

        ret.dataSource = self

        ret.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        ret.separatorStyle = .none

        return ret
    }()

    var items = ItemType.allCases
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets.top)
            make.left.right.bottom.equalTo(view)
        }

        tableView.reloadData()
    }
}

extension FeatureDemoPage: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = items[indexPath.row].title
        
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)

        let item = items[indexPath.row]

        let page = CollectionItemPage(itemType: item)

        page.title = item.title

        self.navigationController?.pushViewController(page, animated: true)
    }
}
