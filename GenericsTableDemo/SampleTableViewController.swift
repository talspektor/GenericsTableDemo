//
//  SampleTableViewController.swift
//  GenericsTableDemo
//
//  Created by user140592 on 2/20/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class BaseTableViewController<T: BaseCell<U>, U>: UITableViewController {

    let cellId = "cellId"
    
    var items = [U]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(T.self, forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
//        cell.textLabel?.text = "\(indexPath.row)"
        
//        cell.item = self.items[indexPath.row]
        cell.item = items[indexPath.row]
        return cell
    }
}

class BaseCell<U>: UITableViewCell {
    var item: U!
}

struct Dog {
    let name: String
}

class DogCell: BaseCell<Dog> {
    override var item: Dog! {
        didSet {
            textLabel?.text = item.name
        }
    }
}

class StringCell: BaseCell<String> {
    override var item: String! {
        didSet {
            textLabel?.text = "\(item)"
        }
    }
}

class DummyController: BaseTableViewController<StringCell, String> {
    
}

class SomeListController: BaseTableViewController<DogCell, Dog> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        items = [
            Dog(name: "Woof"),
            Dog(name: "Ruff")
        ]
    }
}
