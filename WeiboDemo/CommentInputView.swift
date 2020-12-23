//
//  CommentInputView.swift
//  WeiboDemo
//
//  Created by 黄鹏远 on 2020/12/23.
//

import SwiftUI

struct CommentInputView: View {
    
    let post: Post
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                print("Cancel")
            }) {
                Text("取消").padding()
            }
            
            Spacer()
            
            Button(action: {
                print("Send")
            }) {
                Text("发送").padding()
            }
        }
        .font(.system(size: 18))
        .foregroundColor(.black)
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserData().recommendPostList.list[0])
    }
}
