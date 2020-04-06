//
//  SortView.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol SortViewDelegate: class {
    func didSortHero(by role: String)
}

class SortView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sorts = [String]()
    weak var delegate: SortViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewComponent()
        self.navigationItem.title = "HERO ROLES FILTER"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.dismissView))
        
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupTableViewComponent() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerReusableCell(ListItemTableViewCell.self)
        self.tableView.reloadData()
    }
    
}

extension SortView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sorts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.reuseIdentifier, for: indexPath) as! ListItemTableViewCell
        cell.itemTitle.text = self.sorts[indexPath.row]
        cell.selectionStyle = .none
        
        let getEntity = SortingEntity
            .shared
            .getSortingEntity(key: SortingEntity.shared.keySort)
        
        if getEntity == self.sorts[indexPath.row] {
            cell.selectRow()
        } else {
            cell.deselectRow()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        SortingEntity
            .shared
            .saveSortingEntity(value: self.sorts[indexPath.row])
        
        let cell = tableView.cellForRow(at: indexPath) as! ListItemTableViewCell
        cell.selectRow()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.delegate?.didSortHero(by: self.sorts[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
