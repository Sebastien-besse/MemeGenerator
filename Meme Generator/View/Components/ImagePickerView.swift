//
//  ImagePickerView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 18/09/2024.
//

import SwiftUI

struct ImagePickerView: View {
    
    @Binding var selectedImage : String
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(memes.indices){meme in
                    Button(action: {
    
                        selectedImage = memes[meme]
                        
                    }, label: {
                            Image(memes[meme])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay{
                                if  selectedImage == memes[meme]{
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
    ImagePickerView(selectedImage: .constant("memes-bébé"))
}
