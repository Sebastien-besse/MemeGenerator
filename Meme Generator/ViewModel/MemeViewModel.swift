//
//  MemeViewModel.swift
//  Meme Generator
//
//  Created by Sebastien Besse on 16/09/2024.
//

import Foundation

class MemeViewModel{
    
    @Published var meme = Meme(caption: "", image: "")

    func addMeme(meme: Meme){
        self.meme = meme
    }
    
}


