//
//  MyDeliveriesCell.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit

class MyDeliveriesCell: UITableViewCell {
    static let identifier = "DeliveriesCell"
    
    private(set) var delivery: Delivery!

    private let routeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 2
        label.text = "Route details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with delivery: Delivery) {
        routeLabel.text = delivery.route.start
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        routeLabel.text = ""
    }
    
    private func setupUI() {
        addSubview(routeLabel)
        
        NSLayoutConstraint.activate([
            routeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            routeLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            routeLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
