//
//  TransformsViewController.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 4/1/23.
//

import UIKit

class TransformsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transformsTable: UITableView!
    
    var allTransforms: [Transformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transformsTable.delegate = self
        transformsTable.dataSource = self
        
        navigationItem.title = "Transformations"
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        transformsTable.register(xib, forCellReuseIdentifier: "customTableCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTransforms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let transform = allTransforms[indexPath.row]
        cell.cellImage.setImgage(url: transform.photo)
        cell.titleCell.text = transform.name
        cell.descriptionCell.text = transform.description
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }


}
