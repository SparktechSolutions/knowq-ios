//
//  PrimaryNavigationBar.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import SwiftUI

enum NavigationIconType: String {
    
    case back = "chevron.left"
    case close = "xmark"
}

struct PrimaryNavigationBar<ToolBar>: View where ToolBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let title: String
    private let subtitle: String
    private let navigationIconType: NavigationIconType
    private let hasDivider: Bool
    private var toolBar: (() -> ToolBar)
    
    init(
        title: String = "",
        subtitle: String = "",
        navigationIconType: NavigationIconType = .back,
        hasDivider: Bool = false,
        @ViewBuilder toolBar: @escaping () -> ToolBar = { EmptyView() }) {
            self.title = title
            self.subtitle = subtitle
            self.navigationIconType = navigationIconType
            self.toolBar = toolBar
            self.hasDivider = hasDivider
    }
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 8) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: navigationIconType.rawValue)
                        .font(.title3)
                        .bold()
                }
                
                
                if !title.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.title2)
                            .bold()
                            .lineLimit(1)
                        if !subtitle.isEmpty {
                            Text(title)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                    }
                }
                
                Spacer()
                
                toolBar()
            }
            .foregroundColor(.white)
            .padding(.all, 16)
            .padding(.vertical, subtitle.isEmpty ? 8 : .zero)
            .background(Color.black)
            
            if hasDivider { Divider() }
        }
    }
}

#Preview {
    PrimaryNavigationBar(title: "Test Title", subtitle: "This is a subtitle", navigationIconType: .back) {
        Image(systemName: "xmark")
    }
}
