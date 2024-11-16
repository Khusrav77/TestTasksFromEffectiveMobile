//
//  TextArea.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/16/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 8)
                    .padding(.top, 12)
                
            }
            TextEditor(text: $text)
                .padding(4)
                
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .font(.body)
    }
}


