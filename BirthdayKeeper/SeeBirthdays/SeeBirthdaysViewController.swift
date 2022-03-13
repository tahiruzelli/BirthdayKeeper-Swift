//
//  SeeBirthdaysViewController.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 11.03.2022.
//

import UIKit

class SeeBirthdaysViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        birthdayArray?.count ?? 0
    }
    
    @IBOutlet weak var birthdayTableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let birthdayData : Dictionary<String, String> = birthdayArray![indexPath.row] as! Dictionary<String, String>
        cell.textLabel?.text = birthdayData["name"]! + " " + birthdayData["birthday"]!
        
        return cell
    }
    
    var birthdayArray : Array<Any>? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayArray = UserDefaults.standard.object(forKey: userDefaultBirthdayKey) as? Array<Any>
        birthdayArray =  sortArray()
        birthdayTableView.delegate = self
        birthdayTableView.dataSource = self

        
            
    }
    func createTmpArray() ->Array<Dictionary<String,Any>>{
        var tmpArray : Array<Dictionary<String,Any>>? = []
        for birthday in birthdayArray! as! Array<Dictionary<String, String>>{
            let name = birthday["name"] ?? ""
            var tmpDay = String(birthday["birthday"]!.components(separatedBy: "/")[0])
            let tmpMounth = String(birthday["birthday"]!.components(separatedBy: "/")[1])
            if(tmpDay.count == 1){
                tmpDay = "0\(tmpDay)"
            }
            let tmpBirthday = tmpMounth + tmpDay
            let tmpIntBirthday = Int(tmpBirthday) ?? 0
            let tmpDictionary : Dictionary<String, Any> = [
                "name": name,
                "birthday" : tmpIntBirthday,
            ]
            tmpArray?.append(tmpDictionary)
      
        
        }
        return tmpArray ?? []
    }
    func fixArraySyntax(sortedBadSyntaxArray : Array<Dictionary<String,Any>>) -> Array<Dictionary<String,String>> {
        var sortedArray : Array<Dictionary<String,String>>? = []
        for element in sortedBadSyntaxArray{
            let name : String = element["name"] as? String ?? ""
            var mounth : String = ""
            var day : String = ""
            let tmpIntBirthday : Int = element["birthday"] as? Int ?? 0
            let tmpBirthday : String = String(tmpIntBirthday)
            let tmpBirthdayArray : Array<String> = tmpBirthday
                .components(separatedBy: "0")
            if(tmpBirthdayArray.count == 0){// day is >= 10
                if(tmpBirthday.count == 4){ // born in 10 - 11 - 12
                    mounth = Array(arrayLiteral: tmpBirthday)[0] + Array(arrayLiteral: tmpBirthday)[1]
                    day = Array(arrayLiteral: tmpBirthday)[2] + Array(arrayLiteral: tmpBirthday)[3]
                }else if(tmpBirthday.count == 3){// born before october
                    mounth = Array(arrayLiteral: tmpBirthday)[0]
                    day = Array(arrayLiteral: tmpBirthday)[1] + Array(arrayLiteral: tmpBirthday)[2]
                }
            }
            else{
                day = tmpBirthdayArray.last!
                mounth = tmpBirthdayArray.first!
            }
            let birthday = day + "/" + mounth
            let newElement : Dictionary<String, String> = [
                "name" : name,
                "birthday" : birthday
            ]
            sortedArray?.append(newElement)
        }
        return sortedArray ?? []
    }
    func sortArray() -> Array<Any>{
        var tmpArray : Array<Dictionary<String,Any>>? = []
        tmpArray = createTmpArray()
        let sortedBadSyntaxArray = tmpArray!.sorted{dictSort(dict1: $0, dict2: $1)}
        var sortedArray : Array<Dictionary<String,String>>? = []
        sortedArray = fixArraySyntax(sortedBadSyntaxArray: sortedBadSyntaxArray)
        return sortedArray ?? []
    }

    func dictSort(dict1: [String: Any], dict2: [String: Any]) -> Bool {
        guard let i0 = dict1["birthday"] as? Int,
              let i1 = dict2["birthday"] as? Int else {return false}

        return i0 > i1
    }
}
