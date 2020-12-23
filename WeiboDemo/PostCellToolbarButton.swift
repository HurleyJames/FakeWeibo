//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/13.
//

import SwiftUI

struct PostCellToolbarButton: View {
    
    let image: String
    let text: String
    let color: Color
    // 闭包
    let action: () -> Void
    
    var body: some View {
        // action里执行指令，没有返回
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    // 适应屏幕
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞", color: .red) {
            print("点赞")
        }
    }
}
