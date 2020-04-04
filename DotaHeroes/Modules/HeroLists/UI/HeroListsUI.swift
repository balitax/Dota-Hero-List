//  
//  HeroListsUI.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 04/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class HeroListsUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    
    var presenter: HeroListsPresentation!
    var emptyView = EmptySearchView()
    
    lazy var refreshControll: UIRefreshControl = {
        let refreshControll = UIRefreshControl()
        refreshControll.tintColor = UIColor.defaultTheme
        refreshControll.addTarget(self, action: #selector(self.didPullRefresh(_:)), for: .valueChanged)
        return refreshControll
    }()
    
    var roleHeroes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewComponent()
        self.navigationItem.title = "DOTA HERO"
        
        presenter.fetchHeroList()
        
    }
    
    private func setupTableViewComponent() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerReusableCell(DotaHeroListsTableViewCell.self)
        self.tableView.reloadData()
        self.tableView.refreshControl = refreshControll
        self.refreshControll.beginRefreshing()
        self.sortButton.disableButton()
    }
    
    @objc func didPullRefresh(_ sender: UIRefreshControl) {
        self.sortButton.disableButton()
        SortingEntity.shared.removeAllEntity()
        presenter.fetchHeroList()
    }
    
    @IBAction func didSortHeroes(_ sender: UIButton) {
        presenter.presentHeroSort(self.roleHeroes, delegate: self)
    }
    
}

extension HeroListsUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DotaHeroListsTableViewCell.reuseIdentifier, for: indexPath) as! DotaHeroListsTableViewCell
        
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        cell.configure(with: item)
        cell.accessibilityLabel = item.type
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushDetailHero(self.roleHeroes)
    }
    
}

extension HeroListsUI: HeroListsView, SortViewDelegate {
    
    func didSortHero(by role: String) {
        presenter.filterHeroByRoles(role)
    }
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .error(let error):
            
            self.tableView.reloadData()
            self.tableView.backgroundView = self.emptyView
            
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
                
            }
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [alertAction])
        case .success:
            self.tableView.reloadData()
            self.tableView.backgroundView = nil
            self.sortButton.enableButton()
            self.refreshControll.endRefreshing()
        case .empty:
            self.tableView.reloadData()
            self.tableView.backgroundView = self.emptyView
        default:
            break
        }
    }
    
    func sortHeroesData(_ sortsBy: [String]) {
        self.roleHeroes = sortsBy
    }
    
}


