//
//  UserData.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/14.
//

import Combine

class UserData: ObservableObject {
    // 用了@Published，当属性发生变化，用到它的View才会发生更新
    @Published var recommendPostList: PostList = loadPostListData(fileName: "PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData(fileName: "PostListData_hot_1.json")
    
    // id: index
    private var recommendPostDic: [Int: Int] = [:]
    // id: index
    private var hotPostDic: [Int: Int] = [:]
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
}

enum PostListCategory {
    // 推荐种类
    case recommend
    // 热门种类
    case hot
}

extension UserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend:
            return recommendPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDic[id] {
            return recommendPostList.list[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    // 更新微博
    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommendPostList.list[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}
