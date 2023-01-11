//
//  DetailsViewController.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 2/1/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var transformacionesButton: UIButton!
    
    
    var heroe: Heroe!
    var transformations: [Transformation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        transformacionesButton.alpha = 0
        title = heroe.name
        
        heroeImage.setImgage(url: heroe.photo)
        nameLabel.text = heroe.name
        descriptionLabel.text = heroe.description
        
        let token = LocalDataLayer.shared.getValue(key: .token)
        NetworkLayer.shared.fetchTransformations(token: token, heroeId: heroe.id) { [weak self] transformations, error in
            guard let self = self else {return}
            
            if let transformations = transformations {
                self.transformations = self.cleanTranformations(transformations)
                
                if !self.transformations.isEmpty {
                    DispatchQueue.main.async {
                        self.transformacionesButton.alpha = 1
                    }
                }
                
            }else{
                print("Error fetching transformations :", error?.localizedDescription ?? "")
            }
            
        }
        
        
    }
    
    private func cleanTranformations(_ transformations: [Transformation]) -> [Transformation] {
        // delete duplicates
        var uniqueTransf: [Transformation] = []
        transformations.forEach { transf in
            if(!uniqueTransf.map{$0.name}.contains(transf.name)){
                uniqueTransf.append(transf)
            }
        }
        //order transformations ascending
        uniqueTransf.sort {$0.name.localizedStandardCompare($1.name) == .orderedAscending}
        return uniqueTransf
    }


    @IBAction func transformacionesTapped(_ sender: UIButton) {
        let transformView = TransformsViewController()
        transformView.allTransforms = self.transformations
        navigationController?.pushViewController(transformView, animated: true)
    }
    
    
}
