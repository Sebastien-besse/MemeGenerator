//
//  PhotoPickerView.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 18/09/2024.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {

    @Binding var selectedPhoto: PhotosPickerItem?
    @Binding var selectedImage: Image?


    var body: some View {
        VStack {
            
            PhotosPicker(
                selection: $selectedPhoto,
                matching: .images
            
            ) {
                Label("Import Image", systemImage: "square.and.arrow.down")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .onChange(of: selectedPhoto) {  newValue in
                Task{
                    if let newValue{
                        if let imageData = try? await newValue.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: imageData) {
                            selectedImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }

        }
    }
}



#Preview {
    PhotoPickerView(selectedPhoto: .constant(nil), selectedImage: .constant(nil))
}
