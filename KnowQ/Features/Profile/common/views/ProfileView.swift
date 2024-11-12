//
//  ProfileView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                
                Rectangle()
                    .foregroundColor(.black)
                    .overlay(Image("curvy_graphics")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .opacity(0.7))
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 120, alignment: .top)
                Image("doctor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .offset(y: 45)
            }
            .padding(.bottom, 48)
            
            Text("Dr. Rajan Zacharia")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("MBBS, MD")
            Text("Pediatric Pshycology")
            Text("Experience: 12+ years")

        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ProfileView()
}
