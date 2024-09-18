//
//  MemeEditorView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 16/09/2024.
//

import SwiftUI
import PhotosUI

struct MemeEditorView: View {
    
    @State var isText = false
    @State var shadow = false
    @State var position = 150.0
    @State var color = Color.white
    @State var selectedMeme : String?
    
    @State var selectedPhoto: PhotosPickerItem? = nil
    @State var selectedImage: Image? = nil
    
    @State var text = "Un Texte"

    
    var body: some View {
        List{
            VStack{
                
                if let selectedImage{
                    selectedImage
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
                }else if let selectedMeme{
                    Image(selectedMeme)
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
                }else{
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.secondary.opacity(0.3))
                        .fontWeight(.light)
                    
                }
         
                Divider()
                
                ImagePickerView(selectedMeme: $selectedMeme)
                
                TextEditorView(isText: $isText, shadow: $shadow, position: $position, color: $color, text: $text)
                    .listRowSeparator(.hidden)
              
                PhotoPickerView(selectedPhoto: $selectedPhoto, selectedImage: $selectedImage)
                    
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .padding()
    }
}

#Preview {
    MemeEditorView()
}
