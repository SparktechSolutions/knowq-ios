//
//  MainTabView+Header.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import SwiftUI

extension MainTabView {
    var header: some View {
        HStack(spacing: 20) {
            NavigationLink {
                ProfileView()
            } label: {
                headerUserInfoFragment
            }
            
            Spacer()
            
            toolBar
        }
        .padding(16)
    }
    
    var headerUserInfoFragment: some View {
        HStack(spacing: 8) {
            Image("doctor")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .background(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("Hi,")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    Text("Dr. Rajan")
                        .font(.title3)
                        .bold()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .lineLimit(1)
                }
                HStack(spacing: 4) {
                    Text("Today")
                        .font(.body)
                        .foregroundColor(.gray)
                    Text("01 Nov 2024")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
            }
        }
    }
    
    var toolBar: some View {
        HStack(spacing: 16) {
            NavigationLink {
                DoctorSearchView()
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            NavigationLink {
                NotificationsView()
            } label: {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.red)
                        .offset(x: -2, y: 2)
                }
            }
            
        }
    }
}

#Preview {
    MainTabView().header
}
