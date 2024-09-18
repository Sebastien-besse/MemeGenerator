//
//  TextEditorView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 16/09/2024.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var isText : Bool
    @Binding var shadow : Bool
    @Binding var position : Double
    @Binding var color : Color
    @Binding var text : String

    var body: some View {
        
        VStack{
            Toggle(isOn: $isText, label: {
                Text("Texte")
                    .fontWeight(.bold)
            })
            
            if isText{
                TextField(text: $text) {
                    Text("texte")
                }
                .padding(6)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray , lineWidth: 0.4)
                )
                Toggle(isOn: $shadow, label: {
                    Text("Ombre")
                       
                })
                HStack{
                    Text("Position")
                    Slider(value: $position, in: 10...290, label: {
                        Text("Position")
                            
                    })
                }
             
                ColorPicker(selection: $color, label: {
                    Text("Couleur")
                        
                })
            }
            
            
        }
        .padding()

    }
}

#Preview {
    TextEditorView(isText: .constant(true), shadow: .constant(true), position: .constant(150.0), color: .constant(.white), text: .constant("Un texte"))
}
