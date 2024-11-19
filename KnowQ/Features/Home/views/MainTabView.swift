//
//  MainTabView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: .zero) {
                header
                
                tabBarView
            }
        }
    }
    
    
}

#Preview {
    MainTabView()
}
