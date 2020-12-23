//
//  WeiboDemoApp.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/13.
//

import SwiftUI

@main
struct WeiboDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(UserData())
        }
    }
}
