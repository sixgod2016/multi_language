//
//  ViewController.swift
//  multi_language
//
//  Created by GDM on 2020/5/18.
//  Copyright © 2020 GDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appLanguage = AppLanguage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSetting()
        configureUI()
    }

    func basicSetting() {
        title = NSLocalizedString("title", comment: "")
        view.backgroundColor = UIColor.white
    }
    
    func configureUI() {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        btn.center = view.center
        btn.setTitle("英文", for: .normal)
        btn.setTitle("中文", for: .selected)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        view.addSubview(btn)
    }

    @objc func buttonClick(_ sender: UIButton) {
        let next = SecondViewController()
        next.returnAction = {
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: ViewController())
        }
        self.navigationController?.pushViewController(next, animated: true)
//        sender.isSelected = !sender.isSelected
//        selectedLanguage = sender.isSelected ? 0 : 1
//        title = appLanguage.localizedString(key: "title", comment: "")
    }
    
}

