//
//  MainTabView+TabBar.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import SwiftUI

extension MainTabView {
    var tabBarView: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                WatchlistView()
                    .tag(0)
                
                ConsultationsHistoryView()
                    .tag(1)
                
                ReportsSummaryView()
                    .tag(2)
                
            }
            tabBar
        }
    }
    
    var tabBar: some View {
        HStack(spacing: 12) {
            ForEach((HomePageTab.allCases), id: \.self){ item in
                Button{
                    selectedTab = item.rawValue
                } label: {
                    customTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                }
            }
        }
        .frame(height: 80)
        .background(.white)
        .ignoresSafeArea()
    }
    
    func customTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 8) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .blue : .gray)
                .frame(width: 20, height: 20)
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(isActive ? .blue : .gray)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 60)
        .background(.white)
        .cornerRadius(12)
    }
}


#Preview {
    MainTabView().tabBar
}
