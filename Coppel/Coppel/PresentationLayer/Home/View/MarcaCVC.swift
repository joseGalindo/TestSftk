//
//  MarcaCVC.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/12/23.
//

import UIKit

class MarcaCVC: UICollectionViewCell {
    
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var brandName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(brand: Brand) {
        brandName.text = brand.name
        imageView.image = UIImage(named: brand.imagen)
    }
}


// MARK: - UI Setup
extension MarcaCVC {
    private func setupUI() {
        self.imageView.layer.borderWidth = 1
        self.imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(brandName)
        
        NSLayoutConstraint.activate([
            brandName.heightAnchor.constraint(equalToConstant: 25),
            brandName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            brandName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            brandName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.brandName.topAnchor, constant: -10)
        ])
    }
}
