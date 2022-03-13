//
//  AlertDialog.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 12.03.2022.
//

import Foundation
import UIKit

func alertDialog(title : String , message: String )-> UIAlertController{
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: {(UIAlertAction) in
        print("ok")
    })
    alert.addAction(okButton)
    return alert
}

func alertDialogWith2Options(title : String , message: String , myFunction : () )-> UIAlertController{
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: {(UIAlertAction) in
//        myFunction
        print("OK")
    })
    let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel,handler: {(UIAlertAction) in
        print("cancel")
    })
    alert.addAction(okButton)
    alert.addAction(cancelButton)
    return alert
}
