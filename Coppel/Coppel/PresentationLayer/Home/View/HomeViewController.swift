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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identificador = segue.identifier else { return }
        switch Segues(rawValue: identificador) {
        case .categories:
            guard let destVC = segue.destination as? CategoriasViewController else { return }
        case .destacados:
            guard let destVC = segue.destination as? DestacadosViewController else { return }
        default:
            break
        }
    }
}


extension HomeViewController {
    
    func setupUI() {
        self.marcasCollectionView.dataSource = self
        self.marcasCollectionView.collectionViewLayout = myCollectionViewLayout()
        self.marcasCollectionView.register(MarcaCVC.self)
    }
    
    private func myCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = .init(top: 5,
                                    left: 5,
                                    bottom: 5,
                                    right: 5)
        return layout
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

enum Segues: String {
    case categories = "CategoriasViewController"
    case destacados = "DestacadosViewController"
}
