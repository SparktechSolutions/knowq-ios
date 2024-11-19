//
//  Navigation+ViewModifier.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import SwiftUI

struct NavigationViewModifier<ToolBar>: ViewModifier where ToolBar: View {
    private let title: String
    private let subtitle: String
    private let navigationIconType: NavigationIconType
    private let toolBar: (() -> ToolBar)
    private let contentAlignment: Alignment
    private let hasDivider: Bool

    init(
        title: String,
        subtitle: String,
        navigationIconType: NavigationIconType,
        contentAlignment: Alignment,
        hasDivider: Bool,
        @ViewBuilder toolBar: @escaping () -> ToolBar
    ) {
        self.title = title
        self.subtitle = subtitle
        self.navigationIconType = navigationIconType
        self.toolBar = toolBar
        self.contentAlignment = contentAlignment
        self.hasDivider = hasDivider
    }
    
    func body(content: Content) -> some View {
        VStack(spacing: .zero) {
            PrimaryNavigationBar(
                title: title,
                subtitle: subtitle,
                navigationIconType: navigationIconType,
                hasDivider: hasDivider,
                toolBar: toolBar)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

extension View {
    func applyNavigationModifier<ToolBar>(
        title: String = "",
        subtitle: String = "",
        navigationIconType: NavigationIconType = .back,
        contentAlignment: Alignment = .center,
        hasDivider: Bool = false,
        @ViewBuilder toolBar: @escaping () -> ToolBar = { EmptyView() }) -> some View where ToolBar: View{
            self.modifier(
                NavigationViewModifier(
                    title: title,
                    subtitle: subtitle,
                    navigationIconType: navigationIconType,
                    contentAlignment: contentAlignment,
                    hasDivider: hasDivider,
                    toolBar: toolBar))
        }
}

#Preview {
    Text("Hello, world!")
        .applyNavigationModifier(title: "Profile")
}
