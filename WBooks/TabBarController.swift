//
//  TabBarController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 10/03/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let library = UINavigationController(rootViewController: LibraryViewController())
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = "LIBRARY_TAB_BAR_BUTTON".localized()
        library.tabBarItem.image = UIImage(named: "ic_library active")
        library.tabBarItem.tag = 0
        let wishlist = UINavigationController(rootViewController: LibraryViewController())
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = "WISHLIST_TAB_BAR_BUTTON".localized()
        wishlist.tabBarItem.image = UIImage(named: "ic_wishlist")
        wishlist.tabBarItem.tag = 1
        let suggest = UINavigationController(rootViewController: LibraryViewController())
        suggest.tabBarItem = UITabBarItem()
        suggest.tabBarItem.title = "SUGGEST_TAB_BAR_BUTTON".localized()
        suggest.tabBarItem.image = UIImage(named: "ic_add new")
        suggest.tabBarItem.tag = 2
        let myRentals = UINavigationController(rootViewController: LibraryViewController())
        myRentals.tabBarItem = UITabBarItem()
        myRentals.tabBarItem.title = "RENTALS_TAB_BAR_BUTTON".localized()
        myRentals.tabBarItem.image = UIImage(named: "ic_myrentals")
        myRentals.tabBarItem.tag = 3
        
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        viewControllers = [library, wishlist, suggest, myRentals]
        
        // Do any additional setup after loading the view.
    }
    
    

}
