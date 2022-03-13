//
//  LaunchUrl.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 13.03.2022.
//

import Foundation
import UIKit

func launchUrl(url : String){
    if let url = URL(string: url) {
        UIApplication.shared.open(url)
    }
}
