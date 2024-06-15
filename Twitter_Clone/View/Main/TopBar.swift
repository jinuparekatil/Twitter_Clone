//
//  TopBar.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct TopBar: View {
    @Binding var x: CGFloat
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    withAnimation {
                        
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundStyle(Color("bg"))
                })
                Spacer(minLength: 0)
                
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .frame(width: 50,height: 50)
                Spacer(minLength: 0)
            }
            .padding()
            
            Rectangle()
                .frame(width: width,height: 1)
                .foregroundStyle(.gray
                    .opacity(0.3))
            
        }
        .background(Color.white)
    }
}

#Preview {
    TopBar(x: .constant(0))
}
