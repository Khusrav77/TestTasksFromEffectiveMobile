//
//  CustomSearch.swift
//  TestTasksFromEffectiveMobile
//
//  Created by Khusrav Safiev on 11/15/24.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var placeholder: String = "Placholder"
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
                    .padding(.leading, 10)
                
                TextField(placeholder, text: $text)
                    
                
                Image(systemName: "mic.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
                    .padding(.trailing, 10)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.background.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .listRowBackground(Color.clear)
            
        }
        .padding(.horizontal)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    CustomSearchBar(text: .constant("Search"))
}
