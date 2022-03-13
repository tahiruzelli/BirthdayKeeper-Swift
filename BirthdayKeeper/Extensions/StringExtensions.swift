//
//  StringExtensions.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 12.03.2022.
//

import Foundation
import UIKit
extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
