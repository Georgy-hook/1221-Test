//
//  ViewController.swift
//  1221 Test
//
//  Created by Georgy on 13.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Interface Elements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let searchBar: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
        textField.text = "Москва, Москва и Московская область"
        textField.backgroundColor = .clear
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 15
        
        let leftImageView = UIImageView(image: UIImage(named: "location_icon"))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    
    
    private let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        return button
    }()
    
    
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = .green
        
        let homeItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), selectedImage: nil)
        let catalogItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        let cartItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), selectedImage: nil)
        let profileItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: nil)
        let tabItems = [homeItem, catalogItem, cartItem, profileItem]
        tabBar.setItems(tabItems, animated: false)
        return tabBar
    }()
    
    private let storiesCarousel = StoriesCollectionView()
    
    
    private let promotionsCarousel = SalesCollectionView()
    
    
    private let qrCodeRectangle: UIImageView = {
        let rectangle = UIImageView()
        rectangle.image = UIImage(named: "Bonus card")
        return rectangle
    }()
    
    private let forClientsCarousel = ForClientsCollectionView()
    
    private let recommendedLabel: UILabel = {
        let label = UILabel()
        label.text = "Рекомендуем"
        return label
    }()
    
    private let recommendedCollectionView = RecomendedProductCollectionView()
    
    private let SchoolLabel: UILabel = {
        let label = UILabel()
        label.text = "Снова в школу"
        return label
    }()
    
    private let SchoolCarousel = SchoolCollectionView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        applyConstraints()
        
        let stories = StoriesModel.fetchStories()
        storiesCarousel.set(stories: stories)
        
        let forClientsImages = ForClientsModel.fetchForClients()
        forClientsCarousel.set(forClientsImages: forClientsImages)
        
        let sales = SalesModel.fetchSales()
        promotionsCarousel.set(sales: sales)
        
        let products = RecomededProductItem.fetchProducts()
        recommendedCollectionView.set(products: products)
        
        let schoolProducts = SchoolModel.fetchProducts()
        SchoolCarousel.set(products: schoolProducts)
    }
    
    // MARK: - Private Methods
    
    private func configureUI() {
        view.backgroundColor = .white
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(recommendedCollectionView)
        scrollView.addSubview(storiesCarousel)
        scrollView.addSubview(promotionsCarousel)
        scrollView.addSubview(qrCodeRectangle)
        scrollView.addSubview(forClientsCarousel)
        scrollView.addSubview(recommendedLabel)
        scrollView.addSubview(SchoolLabel)
        scrollView.addSubview(SchoolCarousel)
        scrollView.addSubview(tabBar)
        
    }
    
    private func applyConstraints() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        storiesCarousel.translatesAutoresizingMaskIntoConstraints = false
        promotionsCarousel.translatesAutoresizingMaskIntoConstraints = false
        qrCodeRectangle.translatesAutoresizingMaskIntoConstraints = false
        recommendedLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        SchoolLabel.translatesAutoresizingMaskIntoConstraints = false
        SchoolCarousel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        forClientsCarousel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            // Add constraints for scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Add constraints for tabBar
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 49),
            
            // Add constraints for storiesCarousel
            storiesCarousel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            storiesCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storiesCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storiesCarousel.heightAnchor.constraint(equalToConstant: 100),
            
            // Add constraints for promotionsCarousel
            promotionsCarousel.topAnchor.constraint(equalTo: storiesCarousel.bottomAnchor, constant: 20),
            promotionsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            promotionsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            promotionsCarousel.heightAnchor.constraint(equalToConstant: 150),
            
            // Add constraints for qrCodeRectangle
            qrCodeRectangle.topAnchor.constraint(equalTo: promotionsCarousel.bottomAnchor, constant: 10),
            qrCodeRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            qrCodeRectangle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            qrCodeRectangle.heightAnchor.constraint(equalToConstant: 110),
            
            // Add constraints for forClientsCarousel
            forClientsCarousel.topAnchor.constraint(equalTo: qrCodeRectangle.bottomAnchor, constant: 20),
            forClientsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forClientsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forClientsCarousel.heightAnchor.constraint(equalToConstant: 110),
            
            // Add constraints for recommendedLabel
            recommendedLabel.topAnchor.constraint(equalTo: forClientsCarousel.bottomAnchor, constant: 20),
            recommendedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Add constraints for recommendedCarousel
            recommendedCollectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 10),
            recommendedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recommendedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recommendedCollectionView.heightAnchor.constraint(equalToConstant: 150 ),
            
            // Add constraints for SchoolLabel
            SchoolLabel.topAnchor.constraint(equalTo: recommendedCollectionView.bottomAnchor, constant: 20),
            SchoolLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Add constraints for sweetMoodCarousel
            SchoolCarousel.topAnchor.constraint(equalTo: SchoolLabel.bottomAnchor, constant: 10),
            SchoolCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SchoolCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SchoolCarousel.heightAnchor.constraint(equalToConstant: 150 ),
            SchoolCarousel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -55)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
