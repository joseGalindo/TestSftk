//
//  HomeViewController.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    // UI
    @IBOutlet weak var marcasCollectionView: UICollectionView!
    
    // Properties
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

}


extension HomeViewController {
    
    func setupUI() {
        self.marcasCollectionView.dataSource = self
        self.marcasCollectionView.register(MarcaCVC.self)
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.marcas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(MarcaCVC.self, for: indexPath) else {
            return UICollectionViewCell()
        }
        cell.configureCell(brand: viewModel.marcas[indexPath.row])
        return cell
    }
}
