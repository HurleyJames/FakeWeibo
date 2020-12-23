//
//  HomeView.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/14.
//

import SwiftUI

struct HomeView: View {
    
    @State var leftPercent: CGFloat = 0
    
    // 构造方法
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height), leftPercent: self.$leftPercent) {
                    HStack(spacing: 0) {
                        PostListView(category: .recommend)
                            .frame(width: UIScreen.main.bounds.width)
                        PostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页", displayMode: .inline)
        }
        
        //        NavigationView {
        //            HScrollViewController(pageWidth: UIScreen.main.bounds.width, contentSize: CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height), leftPercent: self.$leftPercent) {
        //                HStack(spacing: 3) {
        //                    PostListView(category: .recommend)
        //                        .frame(width: UIScreen.main.bounds.width)
        //                    PostListView(category: .hot)
        //                        .frame(width: UIScreen.main.bounds.width)
        //                }
        //            }
        //            .edgesIgnoringSafeArea(.bottom)
        //            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
        //            .navigationBarTitle("首页", displayMode: .inline)
        //        }
        
        //        NavigationView {
        //
        //            ScrollView(.horizontal, showsIndicators: false) {
        //                HStack(spacing: 0) {
        //                    PostListView(category: .recommend)
        //                        .frame(width: UIScreen.main.bounds.width)
        //                    PostListView(category: .hot)
        //                        .frame(width: UIScreen.main.bounds.width)
        //                }
        //            }
        //            .edgesIgnoringSafeArea(.bottom)
        //            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
        //            .navigationBarTitle("首页", displayMode: .inline)
        //        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
