//
//  ViewController.swift
//  ExpendableTableView
//
//  Created by Akshit on 31/08/22.
//

import UIKit
struct ExpendableData {
    var Expendable = Bool()
    var title = String()
    var sectionData = [String]()
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tableViewData = [ExpendableData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableViewData = [ExpendableData(Expendable: false, title: "Title1", sectionData: ["cell1", "cell2", "cell3"]),
                         ExpendableData(Expendable: false, title: "Title2", sectionData: ["cell1", "cell2", "cell3"]),
                         ExpendableData(Expendable: false, title: "Title3", sectionData: ["cell1", "cell2", "cell3"]),
                         ExpendableData(Expendable: false, title: "Title4", sectionData: ["cell1", "cell2", "cell3"])]
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].Expendable == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.textLabel?.textColor = UIColor.systemPink
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.textLabel?.textColor = UIColor.systemGray
            return cell
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableViewData[indexPath.section].Expendable == true {
            tableViewData[indexPath.section].Expendable = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
        } else {
            tableViewData[indexPath.section].Expendable = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}



