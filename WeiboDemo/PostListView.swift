//
//  PostListView.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/13.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    
    @EnvironmentObject var userData: UserData
    
    //    var postList: PostList {
    //        switch category {
    //        case .recommend:
    //            return loadPostListData(fileName: "PostListData_recommend_1.json")
    //        case .hot:
    //            return loadPostListData(fileName: "PostListData_hot_1.json")
    //        }
    //    }
    
    var body: some View {
        // 每一次取出一个元素
        List {
            ForEach(userData.postList(for: category).list) { post in
                // ZStack垂直与屏幕方向的排列
                ZStack {
                    PostCell(post: post)
                    NavigationLink(
                        destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            // 默认显示推荐栏
            PostListView(category: .recommend)
                .navigationTitle("Title")
                .navigationBarHidden(true)
        }
        .environmentObject(UserData())
    }
}
