//
//  ViewController.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var arrayList: Array<Any>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserDefaults.standard.set(arrayList, forKey: "array")
        UserDefaults.standard.object(forKey: "array")
        UserDefaults.standard.removeObject(forKey: "array")
    }


}

