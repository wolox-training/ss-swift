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

        let library = setUpTabBarItem(navigation: "library",
                                      title: "LIBRARY_TAB_BAR_BUTTON",
                                      image: "ic_library active",
                                      tag: 0,
                                      controller: LibraryViewController())
        let wishlist = setUpTabBarItem(navigation: "wishlist",
                                       title: "WISHLIST_TAB_BAR_BUTTON",
                                       image: "ic_wishlist", tag: 1,
                                       controller: LibraryViewController())
        let suggest = setUpTabBarItem(navigation: "suggest",
                                      title: "SUGGEST_TAB_BAR_BUTTON",
                                      image: "ic_add new", tag: 2,
                                      controller: LibraryViewController())
        let myRentals = setUpTabBarItem(navigation: "myRentals",
                                        title: "RENTALS_TAB_BAR_BUTTON",
                                        image: "ic_myrentals",
                                        tag: 3,
                                        controller: LibraryViewController())
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        viewControllers = [library, wishlist, suggest, myRentals]
    }
    private func setUpTabBarItem(navigation: String, title: String, image: String, tag: Int,
                                 controller: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.tabBarItem = UITabBarItem()
        navigation.tabBarItem.title = title.localized()
        navigation.tabBarItem.image = UIImage(named: image)
        navigation.tabBarItem.tag = tag
        return navigation
    }
}
