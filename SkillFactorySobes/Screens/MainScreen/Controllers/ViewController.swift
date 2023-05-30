//
//  ViewController.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var dataSource: DataSource
    private var delegate: Delegate
    
    private let tableView = UITableView()
    
    private let viewModel: ViewModelProtocol = ViewModel()
    
    // MARK: - Lifecycle
    init(dataSourse: DataSource, delegate: Delegate) {
        self.dataSource = dataSourse
        self.delegate = delegate
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bing()
        tapCell()
    }
    
    // MARK: - Actions
    func tapCell() {
        delegate.onTapCell = { [weak self] index in
            guard let self else { return }

            let detailVC = DetailController()
            
            detailVC.cellIndex = index
            detailVC.allCharacters = self.viewModel.allCharacters

            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

// MARK: - Private methods
private extension ViewController {
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
    }
    
    func bing() {
        viewModel.onUpdataCharacters = { [weak self] allCharacters in
            guard let self else { return }
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.delegate
            self.dataSource.allCharacters = allCharacters
            self.tableView.reloadData()
        }
    }
}
