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
        
        let network = RemoteRepository()
        let cache = CacheDataRepository()
        
//        Task {
//            do {
//                let data = try await network.getDeliveries(offset: 0)
//                try await cache.addDeliveries(deliveries: data)
//                print("success")
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
        
        Task {
            do {
                let data = try await cache.getDeliveries(offset: 0)
                print(data.count)
                print(data.first?.goodsPicture)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

