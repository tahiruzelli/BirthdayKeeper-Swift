//
//  AddBirthdayViewController.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 11.03.2022.
//

import UIKit

class AddBirthdayViewController: UIViewController {

    @IBOutlet weak var birthdayTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBAction func addButtonAction(_ sender: Any) {
        if(checkNameSyntax()==false){
            let alert = alertDialog(title: "Warning!", message:  "Name is too short. It should more than 5 characters")
            self.present(alert,animated: true,completion: nil)
        }
        else if(checkBirthdaySyntax()==false){
            let alert = alertDialog(title: "Warning!", message: "Wrong birthday syntax. It should be \n '12/4' (Day/Mounth)")
            self.present(alert,animated: true,completion: nil)
        }
        else{
            var tmpArray : Array<Any> = UserDefaults.standard.object(forKey: userDefaultBirthdayKey) as? Array<Any> ?? []
            let tmpDictionary : Dictionary<String, Any> = [
                "name" : nameTextfield.text!,
                "birthday" : birthdayTextfield.text!
            ]
            tmpArray.append(tmpDictionary)
            UserDefaults.standard.set(tmpArray, forKey: userDefaultBirthdayKey)
            performSegue(withIdentifier: "toSeeBirthdaysVC", sender: nil)
        }

    }
    func checkNameSyntax () -> Bool {
        if(nameTextfield.text!.count < 5 ){
            return false
        }
        else{
            return true
        }
    }
    func checkBirthdaySyntax () -> Bool {
        let tmpArray : Array<String> = birthdayTextfield.text!.components(separatedBy: "/")
        if(tmpArray.count == 2){
            if(tmpArray.first!.isNumber && tmpArray.last!.isNumber){
                let tmpInt : Int = Int(tmpArray.first!) ?? 0
                let secondTmpInt : Int = Int(tmpArray.last!) ?? 0
                if(tmpInt >= 0 && tmpInt <= 31 && secondTmpInt >= 0 && secondTmpInt <= 12){
                    return true
                }
            }
        }
        return false
    }

    override func viewDidAppear(_ animated: Bool) {
        nameTextfield.text! = ""
        birthdayTextfield.text! = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
