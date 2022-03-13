//
//  DateExtensions.swift
//  BirthdayKeeper
//
//  Created by Tahir Uzelli on 13.03.2022.
//

import Foundation
import UIKit
extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}

        return localDate
    }
}
