//
//  DeliveryDetailsViewController.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit
import SwiftUI

class DeliveryDetailsViewController: UIViewController {
    
    let delivery: Delivery
    
    init(delivery: Delivery) {
        self.delivery = delivery
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
        
        let deliveryView = DeliveryDetailsView(delivery: delivery)
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
}
