//
//  Day.swift
//  SwiftUI-Weather
//
//  Created by Sooni Mohammed on 2020-11-08.
//

import Foundation

struct Day: Identifiable {
    var id = UUID()
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

var days = [
    Day(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74),
    Day(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88),
    Day(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55),
    Day(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60),
    Day(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
]

