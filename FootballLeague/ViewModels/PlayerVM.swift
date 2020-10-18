//
//  PlayerVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import Foundation
struct PlayerVM {
    var player: Player
    
    var id: Int {
        return player.id ?? 0
    }
    var shirtNumber: String? {
        return player.shirtNumber == nil ? "-" : "\(player.shirtNumber!)"
    }
    var name: String {
        return player.name ?? ""
    }
    var position: String {
        return player.position ?? ""
    }
    var dateOfBirth: String {
        guard let date = player.dateOfBirth else { return ""}
        return convertDate(date, from: "yyyy-MM-dd'T'HH:mm:ssZ", to: "dd MMM yyyy") ?? ""
    }
    var countryOfBirth: String {
        return player.countryOfBirth ?? ""
    }
    var nationality: String {
        return player.nationality ?? ""
    }
    var role: String {
        return player.role ?? ""
    }
    
    func convertDate(_ date: String, from oldFormat: String, to newFormat: String) -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = oldFormat
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = newFormat
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
            //print(dateFormatterPrint.string(from: date))
        } else {
            return nil
            //print("There was an error decoding the string")
        }
    }
}
