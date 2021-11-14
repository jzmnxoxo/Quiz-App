//
//  SecureInputView.swift
//  Byngo
//
//  Created by Jzmn on 14/11/2021.
//

import SwiftUI
    
struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
        //@Observable
    private var title: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    
    static var previews: some View {
        SecureInputView("Password", text: userSettings.password)
    }
}
