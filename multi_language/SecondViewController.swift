//
//  SecondViewController.swift
//  multi_language
//
//  Created by GDM on 2020/5/20.
//  Copyright © 2020 GDM. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var returnAction: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicSetting()
        configureUI()
    }
    
    func basicSetting() {
        title = "多语言切换"
        view.backgroundColor = UIColor.white
    }
    
    func configureUI() {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = NSLocalizedString("comment", comment: "")
        view.addSubview(label)
        
        let enButton = UIButton(type: .custom)
        enButton.tag = 1000
        enButton.setTitle("英文", for: .normal)
        enButton.setTitleColor(UIColor.black, for: .normal)
        enButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        enButton.layer.cornerRadius = 10.0
        enButton.layer.masksToBounds = true
        enButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        view.addSubview(enButton)
        
        let zhHansButton = UIButton(type: .custom)
        zhHansButton.tag = 1001
        zhHansButton.setTitle("中文", for: .normal)
        zhHansButton.setTitleColor(UIColor.black, for: .normal)
        zhHansButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        zhHansButton.layer.cornerRadius = 10.0
        zhHansButton.layer.masksToBounds = true
        zhHansButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        view.addSubview(zhHansButton)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaInsets).offset(120)
            make.left.equalTo(view.safeAreaInsets).offset(50)
            make.right.equalTo(view.safeAreaInsets).offset(-50)
        }
        
        enButton.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaInsets).offset(100)
            make.right.equalTo(view.safeAreaInsets).offset(-100)
            make.height.equalTo(50)
        }
        
        zhHansButton.snp.makeConstraints { (make) in
            make.top.equalTo(enButton.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaInsets).offset(100)
            make.right.equalTo(view.safeAreaInsets).offset(-100)
            make.height.equalTo(50)
        }
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        if sender.tag == 1000 {
            DAConfig.setUserLanguage(userLanguage: "en")
        } else {
            DAConfig.setUserLanguage(userLanguage: "zh-Hans")
        }
        self.navigationController?.popViewController(animated: true)
        returnAction!()
    }
 
}
