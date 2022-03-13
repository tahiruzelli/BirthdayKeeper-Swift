//
//  HomePageViewController.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 11.03.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBAction func checkButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var checkButton: UIButton!
    @IBAction func addButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cakeImage: UIImageView!
    var birthdayArray : Array<Dictionary<String,String>>? = []
    override func viewDidLoad() {
        super.viewDidLoad()
  
        cakeImage.alpha = 0.5
        addButton.contentHorizontalAlignment = .center
        checkButton.contentHorizontalAlignment = .center
        birthdayArray =  UserDefaults.standard.object(forKey: userDefaultBirthdayKey) as? Array<Dictionary<String, String>> ?? []
        checkTodaysBirthdays()
        
        

        
    }
    func checkTodaysBirthdays(){
        let currentTime = Date().localDate()
        let currentDay : String = currentTime.description.components(separatedBy: " ").first!.components(separatedBy: "-")[2]
        var currentMounth : String = currentTime.description.components(separatedBy: " ").first!.components(separatedBy: "-")[1]
        if(currentMounth.count == 1){
            currentMounth = "0\(currentMounth)"
        }
        for birthday in birthdayArray ?? [] {
            let birthdayDay : String = (birthday["birthday"]?.components(separatedBy: "/").first!)!
            var birthdayMounth : String = (birthday["birthday"]?.components(separatedBy: "/").last!)!
            if(birthdayMounth.count == 1){
                birthdayMounth = "0\(birthdayMounth)"
            }
            if(currentDay == birthdayDay && currentMounth == birthdayMounth){
                let alert = UIAlertController(title: "Yuupi!", message: "Happy birthday to \(birthday["name"]!)\n Would you like to look at our gifts?", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: {(UIAlertAction) in
                    launchUrl(url: giftStoreUrl)
                })
                let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel,handler: {(UIAlertAction) in
                    print("cancel")
                })
                alert.addAction(okButton)
                alert.addAction(cancelButton)
                self.present(alert, animated: true, completion: nil)
            }

            
        }
    }
}
