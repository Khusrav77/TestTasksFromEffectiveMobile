////
////  TextArea.swift
////  TestTasksFromEffectiveMobile
////
////  Created by Khusrav Safiev on 11/16/24.
////

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    var placeholder: String = "Enter your text here..."
    var font: Font = .body
    var maxHeight: CGFloat = 150
    
    init(text: Binding<String>, placeholder: String, font: Font = .body, maxHeight: CGFloat = 150) {
        self._text = text
        self.placeholder = placeholder
        self.font = font
        self.maxHeight = maxHeight
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.top, 12)
                    .font(font)
            }
            
    
            TextEditor(text: $text)
                .padding(4)
                .font(font)
                .background(Color.clear) 
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

