//
//  HeroDetailUI.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class HeroDetailUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HeroDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationItem.title = presenter.navigationTitle
    }
    
    func registerCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.registerReusableCell(HeaderComponentTableViewCell.self)
        tableView.registerReusableCell(HeroComponentsTableViewCell.self)
        tableView.registerReusableCell(DotaHeroListsTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
    }
    
}


extension HeroDetailUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type, for: indexPath)
        (cell as? CellConfigurable)?.configure(with: item)
        cell.accessibilityLabel = item.type
        cell.selectionStyle = .none
        return cell
    }
    
}

extension HeroDetailUI: HeroDetailView {
    
}


