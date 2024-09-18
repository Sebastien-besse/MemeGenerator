//
//  MemeEditorView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 16/09/2024.
//

import SwiftUI

struct MemeEditorView: View {
    
    @State var isText = true
    @State var shadow = true
    @State var position = 150.0
    @State var color = Color.white
    @State var selectedImage = "memes-bébé"
    @State var text = "Un Texte"
    
    var body: some View {
        List{
            Image(selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay{
                    Text(isText ? text : "")
                        .padding(8)
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .foregroundStyle(color)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.5), radius: shadow ? 10 : 0)
                        .position(x: 150, y: position)
                }
                .padding(.horizontal)
            
            ImagePickerView(selectedImage: $selectedImage)
            
            TextEditorView(isText: $isText, shadow: $shadow, position: $position, color: $color, text: $text)
            
        }
        .listStyle(.inset)
        .padding()
    }
}

#Preview {
    MemeEditorView()
}
