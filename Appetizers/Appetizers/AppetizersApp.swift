//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sooni Mohammed on 2020-11-13.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
