//
//  DeliveryDetailsViewController.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit
import SwiftUI

class DeliveryDetailsViewController: UIViewController {
    
    let viewModel: DeliveryDetailsViewModel
    var delegate: DeliveryDetailsViewDelegate!
    
    init(viewModel: DeliveryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Delivery Info"
        view.backgroundColor = .systemBackground
        
        let deliveryView = DeliveryDetailsView(viewModel: viewModel, didTapFavouriteButton: didTapFavouriteButton)
        let hostingController = UIHostingController(rootView: deliveryView)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(hostingController)
        view.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    private func didTapFavouriteButton() {
        delegate.forceReladTableView()
    }
}
