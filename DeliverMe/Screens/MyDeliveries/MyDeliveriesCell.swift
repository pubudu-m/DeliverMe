//
//  MyDeliveriesCell.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import UIKit
import SDWebImage

class MyDeliveriesCell: UITableViewCell {
    static let identifier = "DeliveriesCell"
    
    private(set) var delivery: Delivery!
    
    private let packageImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "shippingbox")
        image.tintColor = .label
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let routeStartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 2
        label.text = "From"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let routeEndLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 2
        label.text = "To"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.text = "Price"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [routeStartLabel, routeEndLabel, priceLabel])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.distribution = .equalSpacing
        vStack.alignment = .leading
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    private let favouriteIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(systemName: "heart.fill")
        icon.tintColor = .label
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [vStack, favouriteIcon])
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with delivery: Delivery) {
        packageImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        packageImage.sd_setImage(with: URL(string: delivery.goodsPicture))
        
        routeStartLabel.text = "From: \(delivery.route.start)"
        routeEndLabel.text = "To: \(delivery.route.end)"
        
        priceLabel.text = Helpers.calculateTotalDeliveryFee(deliveryFee: delivery.deliveryFee, surcharge: delivery.surcharge)
        
        if let isFavourite = delivery.isFavourite {
            favouriteIcon.isHidden = !isFavourite
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        packageImage.image = nil
        routeStartLabel.text = ""
        routeEndLabel.text = ""
        priceLabel.text = ""
        favouriteIcon.isHidden = true
    }
    
    private func setupUI() {
        addSubview(packageImage)
        addSubview(hStack)
        
        NSLayoutConstraint.activate([
            packageImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            packageImage.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            packageImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            packageImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            
            favouriteIcon.heightAnchor.constraint(equalToConstant: 20),
            favouriteIcon.widthAnchor.constraint(equalToConstant: 20),
            
            hStack.leadingAnchor.constraint(equalTo: packageImage.trailingAnchor, constant: 10),
            hStack.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -10),
            hStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
