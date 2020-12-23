//
//  Post.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/13.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}

// Data Model 实体模型
// Codable表示可编码有可解码，既可以从json转化而来，也可以转化为json
struct Post: Codable, Identifiable {
    let id: Int
    // 头像，图片名称
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    // 是否关注
    var isFollowed: Bool
    
    // 文字
    let text: String
    // 图片数组
    let images: [String]
    
    // 评论数
    var commentCount: Int
    // 点赞数
    var likeCount: Int
    // 是否已点赞
    var isLiked: Bool

}

extension Post {
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
    
    // 计算属性（只读属性）
    var commentCountText: String {
        if commentCount <= 0 {return "评论"}
        // 显示评论数
        if commentCount < 1000 {return "\(commentCount)"}
        // 以13.1k的形式显示评论数
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 {return "点赞"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}

// let postList = loadPostListData(fileName: "PostListData_recommend_1.json")

// 解析json文件数据，返回最终的数据结构list
func loadPostListData(fileName: String) -> PostList {
    // guard保证不为空
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Cannot find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Cannot load \(String(describing: url))")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Cannot parse post list json data")
    }
    return list
}

// 加载图片的函数
func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
