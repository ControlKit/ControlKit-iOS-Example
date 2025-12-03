//
//  DetailsViewController.swift
//  ControlKitExample
//
//  Created by Maziar Saadatfar on 10/1/25.
//
import UIKit
import ForceUpdateKit
import LaunchAlertKit
import InboxKit
import NetPromoterScoreKit
import AgreementKit
import ContactSupportKit
import VoteKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var item: ControlKitProtocol?
    var items: [String] {
        return item?.styles.keys.sorted() ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        edgesForExtendedLayout = [.top,.bottom]
        navigationController?.navigationBar.isTranslucent = true
        extendedLayoutIncludesOpaqueBars = true
        titleLabel.text = item?.title
        imageView.image = UIImage(named: item!.icon)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        let size = CGSize(width: 30, height: 30)
        cell.imageView?.image = UIImage(named: item!.icon)?.imageWithSize(size: size) ??
        UIImage(named: item!.icon)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let index = item?.styles.firstIndex(where: { $0.key == items[indexPath.row] }) {
            let idx = item!.styles.distance(from: item!.styles.startIndex, to: index)
            item?.selectedIndex = idx
            item?.check(root: self.navigationController)
        }
    }
}
