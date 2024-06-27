//
//  RandomDataGenerator.swift
//  listNameApp
//
//  Created by Cristian Garcia on 27/6/24.
//

import Foundation

struct RandomDataGenerator {
    
    static func randomLocation() -> String {
        let ubiaciones = ["Madrid", "Barcelona", "Valencia", "Sevilla", "Zaragoza", "Málaga", "Murcia", "Palma", "Bilbao", "Alicante"]
        return ubiaciones.randomElement() ?? ""
    }
    
    static func randomPhoneNumber() -> String {
           let prefijos = ["610", "620", "630", "640", "650", "660", "670", "680", "690"]
           let numero = String(format: "%06d", Int.random(in: 0...999999))
           return "\(prefijos.randomElement() ?? "000")\(numero)"
       }
    
    static func randomBirthDate() -> String {
            let año = Int.random(in: 1970...2004)
            let mes = Int.random(in: 1...12)
            let dia: Int
            switch mes {
            case 2:
                dia = Int.random(in: 1...(año % 4 == 0 ? 29 : 28))
            case 4, 6, 9, 11:
                dia = Int.random(in: 1...30)
            default:
                dia = Int.random(in: 1...31)
            }
            let dateComponents = DateComponents(year: año, month: mes, day: dia)
            let calendar = Calendar.current
            let date = calendar.date(from: dateComponents) ?? Date()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
}
