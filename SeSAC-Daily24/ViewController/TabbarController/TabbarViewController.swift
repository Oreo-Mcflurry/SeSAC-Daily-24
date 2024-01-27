//
//  TabbarViewController.swift
//  SeSAC-Daily24
//
//  Created by A_Mcflurry on 1/27/24.
//

import UIKit

class TabbarViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.backgroundColor = .darkGray
		let onepageVC = OnePageViewController()
		onepageVC.title = "Home"
		onepageVC.tabBarItem.image = UIImage.init(systemName: "house")
		let oneTapbbar = UINavigationController(rootViewController: onepageVC)

		let twopageVC = TwoPageViewController()
		twopageVC.title = "Search"
		twopageVC.tabBarItem.image = UIImage.init(systemName: "magnifyingglass.circle")
		let twoTapbar = UINavigationController(rootViewController: twopageVC)

		let threepageVC = ThreePageViewController()
		threepageVC.title = "Archive"
		threepageVC.tabBarItem.image = UIImage.init(systemName: "archivebox")
		let threeTapbar = UINavigationController(rootViewController: threepageVC)

		let recappageVC = RecapViewController()
		recappageVC.title = "Recap"
		recappageVC.tabBarItem.image = UIImage.init(systemName: "figure.cross.training")
		let recapTapbar = UINavigationController(rootViewController: recappageVC)

		tabBar.tintColor = .red
		tabBar.unselectedItemTintColor = .gray
		
		setViewControllers([oneTapbbar, twoTapbar, threeTapbar, recapTapbar], animated: false)
	}
}
