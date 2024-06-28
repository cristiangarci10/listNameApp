//
//  AsyncImageView.swift
//  listNameApp
//
//  Created by Cristian Garcia on 28/6/24.
//

import SwiftUI

struct AsyncImageView: View {
    
    var image : String
    var width : CGFloat
    var height : CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    
            } else if phase.error != nil {
                Color.red // Indicates an error.
                    .frame(width: width, height: height)
                   
            } else {
                Color.gray // Acts as a placeholder.
                    .frame(width: width, height: height)
                   
            }
        }
        .clipped()
        .cornerRadius(10)
    }
}

