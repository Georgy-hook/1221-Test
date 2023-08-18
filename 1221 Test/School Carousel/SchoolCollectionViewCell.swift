//
//  SchoolCollectionViewCell.swift
//  1221 Test
//
//  Created by Georgy on 18.08.2023.
//

import UIKit

class SchoolCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SchoolCollectionViewCell"
    
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountedPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.layer.cornerRadius = 7
        label.layer.opacity = 0.5
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        
        addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(discountedPriceLabel)
        containerView.addSubview(cartButton)
        containerView.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Product image constraints
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            productImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7),
            productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
            
            // Price label constraints
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: discountedPriceLabel.topAnchor),
            
            // Discounted price label constraints
            discountedPriceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            discountedPriceLabel.bottomAnchor.constraint(equalTo: cartButton.bottomAnchor),
            
            // Cart button constraints
            cartButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            cartButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            cartButton.widthAnchor.constraint(equalToConstant: 30),
            cartButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Tag label constraints
            tagLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -5),
            tagLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9),
            tagLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    // MARK: - Configure Cell
    
    func configure(with product: SchoolModel) {
        productImageView.image = product.image
        priceLabel.text = product.price
        discountedPriceLabel.attributedText = product.discountedPrice?.strikeThrough()
        setTagLabel(tag: product.tags?.first)
        guard product.discountedPrice != nil else {
            updateConstraintsForPriceLabel()
            return
        }
    }
    
    private func setTagLabel(tag: ProductTag?) {
        guard let tag = tag else {
            tagLabel.isHidden = true
            return
        }
        tagLabel.text = tag.rawValue
        switch tag{
        case .cardPrice:
            tagLabel.backgroundColor = .green
        case .priceDrop:
            tagLabel.backgroundColor = .red
        case .new:
            tagLabel.backgroundColor = .purple
        case .superPrice:
            tagLabel.backgroundColor = .red
        default:
            return
        }
    }
    
    private func updateConstraintsForPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            priceLabel.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor)
        ])
    }
}
