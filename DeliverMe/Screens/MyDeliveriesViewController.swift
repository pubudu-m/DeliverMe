//
//  ViewController.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit

class MyDeliveriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let vm = RemoteRepository()
        
        Task {
            do {
                let data = try await vm.getDeliveries(offset: 0)
                print(data.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

