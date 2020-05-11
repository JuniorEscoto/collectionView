//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by junior on 5/11/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // aqui podemos hacer configuraciones referente a la celda
        backgroundColor = .lightGray
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .brown
    }

}
