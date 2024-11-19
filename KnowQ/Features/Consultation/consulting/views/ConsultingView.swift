//
//  ConsultingView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import SwiftUI

struct ConsultingView: View {
    @ObservedObject var viewModel = ConsultingViewModel()
    var body: some View {
        Group {
            if viewModel.isConsultationStarted {
                InConsultationView()
                    .environmentObject(viewModel)
            } else {
                StartConsultationView()
                    .environmentObject(viewModel)
            }
        }
        .applyNavigationModifier(title: "Consultation", contentAlignment: .center, hasDivider: false)
    }
}

#Preview {
    ConsultingView()
}
