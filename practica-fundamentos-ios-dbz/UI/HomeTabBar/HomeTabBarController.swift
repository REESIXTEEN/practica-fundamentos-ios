//
//  HomeTabBarController.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 27/12/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupTabs()
    }
    
    private func setupTabs(){
        let navigationController1 = UINavigationController(rootViewController: TableViewController())
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController1.tabBarItem = UITabBarItem(title: "TableView", image: tabImage, tag:0)
        
        let navigationController2 = UINavigationController(rootViewController: CollectionViewController())
        let tabImage2 = UIImage(systemName: "circle.grid.3x3.fill")!
        navigationController2.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImage2, tag:1)
        
        let navigationController3 = UINavigationController(rootViewController: UserViewController())
        let tabImage3 = UIImage(systemName: "person.fill")!
        navigationController3.tabBarItem = UITabBarItem(title: "Profile", image: tabImage3, tag:2)
        
        viewControllers = [navigationController1,navigationController2,navigationController3]
    }
    
    private func setupLayout(){
        tabBar.backgroundColor = .systemBackground
    }
    


}
