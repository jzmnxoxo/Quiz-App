//
//  CommentView.swift
//  Byngo
//
//  Created by Jzmn on 18/11/2021.
//

import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    let name: String
    let content: String
}

// A view that shows the data for one Restaurant.
struct CommentRow: View {
    var comment: Comment

    var body: some View {
        HStack{
            Image(systemName: "text.bubble")
                //.resizable()
                //.frame(width: 50, height: 50, alignment: .leading)
            Text("\(comment.name)"+": "+"\(comment.content)")
        }
 
    }
}

// Create three restaurants, then show them in a list.
struct CommentView: View {
    let comments = [
        Comment(name: "Yo mama",content: "dude this is too easy"),
        Comment(name: "Kermit",content: "this is so hard life is meaningless"),
        Comment(name: "Sweeney", content: "IM INVINCIBLE")
    ]

    var body: some View {
        List(comments) { comment in
            CommentRow(comment: comment)
        }
    }
}
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
