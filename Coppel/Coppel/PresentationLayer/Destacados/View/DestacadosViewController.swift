//
//  DestacadosViewController.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/14/23.
//

import UIKit
import Combine

class DestacadosViewController: UIViewController {

    // UI
    @IBOutlet weak var carruselDestacados: UICollectionView!
    
    
    // Properties
    private let viewModel = DestacadoViewModel()
    private var cancelables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindingViewModel()
        viewModel.simulateApiCall()
    }

}

extension DestacadosViewController {
    func setupUI() {
        carruselDestacados.dataSource = self
        let uinib = UINib(nibName: DestacadoCVC.nibIdentifier, bundle: nil)
        carruselDestacados.register(uinib, forCellWithReuseIdentifier: DestacadoCVC.nibIdentifier)
    }
}


extension DestacadosViewController {
    
    func bindingViewModel() {
        viewModel.$destacados
            .sink { [weak self] (destacados) in
                guard let destacadosVal = destacados else { return }
        }.store(in: &cancelables)
    }
}


extension DestacadosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.destacados?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestacadoCVC.nibIdentifier, for: indexPath) as? DestacadoCVC else {
            return UICollectionViewCell()
        }
        cell.configureCell(value: viewModel.destacados?[indexPath.row])
        return cell
    }
    
    
}
