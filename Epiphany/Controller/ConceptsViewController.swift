//
//  ConceptsViewController.swift
//  Epiphany
//
//  Created by Udbhav Prasad on 3/7/21.
//

import UIKit

class ConceptsViewController: UITableViewController {
    var concepts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ConceptsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.concepts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "conceptCell", for: indexPath)
        cell.textLabel?.text = self.concepts[indexPath.row]
        
        return cell
    }
}
