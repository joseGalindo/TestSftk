//
//  UICollectionView+Extension.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/12/23.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register(_ type: UICollectionViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T
    }
    
    func dequeueReusableSuppelemntaryView<T>(_ kind:String, type: T.Type, for indexPath: IndexPath) -> T? {
        let className = String(describing: type)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: className, for: indexPath) as? T
    }
    
    
}
