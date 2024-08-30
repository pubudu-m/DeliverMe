//
//  ViewController.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit

class MyDeliveriesViewController: UIViewController {
    
    let viewModel: MyDeliveriesViewModel
    
    var isLoadingData = false
    var requestDataCount = 20
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(MyDeliveriesCell.self, forCellReuseIdentifier: MyDeliveriesCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        self.viewModel = MyDeliveriesViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        loadData()
    }
    
    private func loadData() {
        isLoadingData = true
        Task {
            do {
                try await viewModel.getDeliveries(requestDataCount: requestDataCount)
                DispatchQueue.main.async {
                    self.isLoadingData = false
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupUI() {
        navigationItem.title = "My Deliveries"
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

extension MyDeliveriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.deliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyDeliveriesCell.identifier, for: indexPath) as? MyDeliveriesCell else {
            fatalError("Unable to dequeue DeliveriesCell in DeliveriesViewController")
        }
        
        let delivery = viewModel.deliveries[indexPath.row]
        cell.configure(with: delivery)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if !isLoadingData && (offsetY > contentHeight - scrollView.frame.height) {
            requestDataCount += 20
            loadData()
        }
    }
}

