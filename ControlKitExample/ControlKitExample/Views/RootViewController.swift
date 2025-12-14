//
//  RootViewController.swift
//  ControlKitExample
//
//  Created by Maziar on 10/15/23.
//

import UIKit
import ControlKitBase

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let controlKitItems: [ControlKitProtocol] = [
        ForceUpdate(),
        LaunchAlert(),
        InboxViewKit(),
        Agreement(),
        ContactSupport(),
        NetPromoterScore(),
        Vote()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupLanguageButton()
        clearButton.setCurvedView(cornerRadius: 10, borderWidth: 1.0, borderColor: .gray)
    }
    
    // MARK: - Language Selection
    let languageUserDefaultsKey = "SelectedLanguageCode"
    let languages: [(flag: String, name: String, code: String)] = [
        ("🇬🇧", "English", "en"),
        ("🇫🇷", "French", "fr"),
        ("🇮🇹", "Italian", "it"),
        ("🇪🇸", "Spanish", "es"),
        ("🇷🇺", "Russian", "ru"),
        ("🇩🇪", "German", "de"),
        ("🇸🇦", "Arabic", "ar"),
        ("🇮🇷", "Persian", "fa")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controlKitItems.count
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = controlKitItems[indexPath.row].title
        let size = CGSize(width: 30, height: 30)
        cell.imageView?.image = UIImage(named: controlKitItems[indexPath.row].icon)?.imageWithSize(size: size) ??
        UIImage(named: controlKitItems[indexPath.row].icon)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsViewController(nibName: DetailsViewController.nameOfClass, bundle: nil)
        vc.item = controlKitItems[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func changeAppIdTapped(_ sender: Any) {
        showChangeIdPopup()
    }
    
    @IBAction func clearAllDataTapped(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "latestLaunchAlertResponseId")
        UserDefaults.standard.removeObject(forKey: "CK_Vote_Name_\(Vote().name ?? "")")
        UserDefaults.standard.removeObject(forKey: "CK_NPS_Name_\(NetPromoterScore().name ?? "")")
    }
}
