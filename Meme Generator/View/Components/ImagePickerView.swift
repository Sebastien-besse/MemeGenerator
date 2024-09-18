//
//  ImagePickerView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 18/09/2024.
//

import SwiftUI

struct ImagePickerView: View {
    
    @Binding var selectedMeme : String?
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(memes, id: \.self){meme in
                    Button(action: {
                      
                            selectedMeme = meme
                        
                        
                    }, label: {
                            Image(meme)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay{
                                if  selectedMeme == meme{
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.white)
                                        .offset(x: 30, y: -30)
                                }
                            }
                      
                    })
                        
                }
            }

        }
    }
}

#Preview {
    ImagePickerView(selectedMeme: .constant("memes-bébé"))
}
