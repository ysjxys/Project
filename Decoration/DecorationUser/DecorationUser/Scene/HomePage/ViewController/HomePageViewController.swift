//
//  HomePageViewController.swift
//  DecorationManager
//
//  Created by ysj on 2017/11/17.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation
import UIKit

class HomePageViewController: YSJViewController {
    
    // MARK: - LifeCircle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PurpleColor
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(YellowColor), for: .default)
        
        let rightBarItem = UIBarButtonItem(title: "hehe", style: .plain, target: self, action: #selector(rightBarBtnClick))
        rightBarItem.tintColor = GreenColor
        rightBarItem.setTitleTextAttributes([NSAttributedStringKey.font: FontR(UIScale(12))], for: .normal)
//        navigationItem.rightBarButtonItem = rightBarItem
        
        let rightBarItem2 = UIBarButtonItem(title: "haha", style: .plain, target: self, action: #selector(rightBarBtnClick2))
        
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceItem.width = 50
        
        navigationItem.rightBarButtonItems = [rightBarItem, spaceItem,  rightBarItem2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func rightBarBtnClick() {
        navigationController?.pushViewController(ShoppingStoreViewController(), animated: true)
    }
    
    @objc func rightBarBtnClick2() {
        
    }
}
