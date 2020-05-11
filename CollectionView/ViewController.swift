//
//  ViewController.swift
//  CollectionView
//
//  Created by junior on 5/11/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listaPaises = ["Nicaragua", "Mexico", "Costa Rica", "Panama", "Belice"]
    
    // con esta variable estamos opteneindo el ancho de nuestra pantalla y dividiendola en dos
    private let myCellWith = UIScreen.main.bounds.width / 2

    @IBOutlet weak var viewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // data source de nuestra collection view
        viewController.dataSource = self
        viewController.delegate = self
        
        
        //registrando nuestra celda personalizada a nuestro viewCollecion
        viewController.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCustomCell")
    }


}

// extension de nuestro collection view, al igual que nuestra tabla implementa los mismos protocolos
extension ViewController : UICollectionViewDataSource {
    
    // esto es para el numero de secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaPaises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "myCustomCell", for: indexPath) as? CustomCollectionViewCell
        
        // implementando datos
        cell?.myLabel.text = listaPaises[indexPath.row]
        
        return cell!
    }
    
}

// extension para el delegate
extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("section \(indexPath.section), row \(indexPath.row), value \(listaPaises[indexPath.row])")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // decidir de que tamaño sera cada celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // lo que queremos es tener dos item por cada celda
        
        CGSize(width: myCellWith, height: myCellWith)
    }
}

