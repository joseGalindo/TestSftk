//
//  DestacadoCVC.swift
//  Coppel
//
//  Created by Jose Galindo Martinez on 11/14/23.
//

import UIKit

class DestacadoCVC: UICollectionViewCell {
    
    // UI
    @IBOutlet weak var tipoOferta: UILabel!
    @IBOutlet weak var imagenPromo: UIImageView!
    @IBOutlet weak var descripcion: UILabel!
    @IBOutlet weak var precioContado: UILabel!
    @IBOutlet weak var precioOriginal: UILabel!
    @IBOutlet weak var agregarBtn: UIButton!
    
    static let nibIdentifier = String(describing: DestacadoCVC.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        agregarBtn.layer.cornerRadius = 30
        agregarBtn.layer.borderWidth = 2
        agregarBtn.layer.borderColor = UIColor.blue.cgColor
    }
    
    func configureCell(value: DestacadoResponse?) {
        guard let value = value else { return }
        self.tipoOferta.text = "oferta Exclusiva"
        self.imagenPromo.image = UIImage(named: value.urlImage)
        self.descripcion.text = value.descriptionName
        self.precioContado.text = "$" + value.promotionPrice
        self.precioOriginal.text = "$" + value.regularPrice
        
    }

}
