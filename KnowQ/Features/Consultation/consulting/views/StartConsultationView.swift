//
//  StartConsultationView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 18/11/24.
//

import SwiftUI

struct StartConsultationView: View {
    @EnvironmentObject var viewModel: ConsultingViewModel

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                Text("ALLOTED TOKENS:")
                    .font(.title2)
                    .bold()
                Text("199")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding(.top, 32)
            
            HStack(spacing: 8) {
                Button {
                    //TODO: Token
                } label: {
                    Text("+ ADD")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                
                Button {
                    //TODO: Token
                } label: {
                    Text("RESET")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.red.opacity(0.7))
                        .padding(.horizontal, 16)
                        .contentShape(Rectangle())
                }
            }
            
            Spacer()
                .frame(height: 32)
            

            
            Button {
                //TODO: start consultation
                viewModel.isConsultationStarted = true
            } label: {
                Image(systemName: "play.circle.fill")
                    .font(Font.system(size: UIScreen.screenHeight * 0.15))
                    .foregroundColor(.black)
            }
            
            Text("Start consultation")
                .font(.title2)
                .padding(.horizontal, 16)
            
            
        }
    }
}

#Preview {
    StartConsultationView()
}
