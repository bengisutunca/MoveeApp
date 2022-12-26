//
//  Formatter.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import Foundation

extension String {
    func toDate(releaseDate: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: releaseDate) else { return "" }
        
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
    
    func toRuntime(runtime: Int) -> String? {
        let hours = runtime / 60
        let minutes = runtime % 60
        return "\(hours) \(Localization.hours) \(String(format: "%02d", minutes)) \(Localization.minutes)"
    }
}
