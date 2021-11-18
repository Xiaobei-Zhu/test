//
//  LandMarkApp.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/6.
//

import SwiftUI

@main
struct LandMarkApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
