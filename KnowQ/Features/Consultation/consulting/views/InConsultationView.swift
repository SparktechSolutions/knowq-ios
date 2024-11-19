//
//  InConsultationView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 18/11/24.
//

import SwiftUI

struct InConsultationView: View {
    @EnvironmentObject var viewModel: ConsultingViewModel
        
    var body: some View {
        let skippedTokenGridMinSize = UIScreen.screenWidth/7.5
        let skippedTokenGridMaxSize = UIScreen.screenWidth/7.5
        let skippedTokenColumns = Array(repeating: GridItem(.fixed(skippedTokenGridMaxSize)), count: 6)
        
        return VStack(spacing: 16) {
            HStack(spacing: 8) {
                Text("ALLOTED TOKENS:")
                    .font(.title2)
                    .bold()
                Text("199")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.top, 32)
            
            Button {
                //TODO: Token
            } label: {
                Text("+ ADD TOKEN")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("CURRENT ATTENDING\nTOKEN")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("\(viewModel.currentAttendingTokenNumber)")
                .font(Font.system(size: 96))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.bottom, 24)
            
            HStack(spacing: 16) {
                Button {
                    viewModel.skipTokenNumber()
                } label: {
                    Text("SKIP")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        .background(.white)
                        .foregroundColor(.black)
                }
                
                Button {
                    viewModel.markCurrentTokenNumberConsultationCompleted()
                } label: {
                    Text("DONE")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.black)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            Text("SKIPPED TOKENS")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            LazyVGrid(columns: skippedTokenColumns) {
                ForEach(0..<12) { index in
                    if index < viewModel.skippedTokenNumbers.count {
                        Button {
                            if index < viewModel.skippedTokenNumbers.count {
                                viewModel.attendSkippedTokenNUmber(tokenNumber: viewModel.skippedTokenNumbers[index])
                            }
                        } label: {
                            Text("\(viewModel.skippedTokenNumbers[index])")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(viewModel.skippedTokenNumbers[index] != viewModel.currentAttendingTokenNumber
                                             ? .white
                                             : .white.opacity(0.4))
                            .frame(width: skippedTokenGridMaxSize, height: skippedTokenGridMaxSize, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(viewModel.skippedTokenNumbers[index] != viewModel.currentAttendingTokenNumber
                                                     ? .white
                                                     : .white.opacity(0.4)))
                        }
                        .disabled(viewModel.skippedTokenNumbers[index] == viewModel.currentAttendingTokenNumber)
                    
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2)
                            .frame(width: skippedTokenGridMaxSize, height: skippedTokenGridMaxSize, alignment: .center)
                            .foregroundColor(.white.opacity(0.4))
                    }

                    
                }
            }
            .padding(.horizontal, 20)
            
            Button {
                viewModel.isConsultationStarted = false
            } label: {
                Text("END CONSULTATION")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    .background(.red)
                    .foregroundColor(.white)
            }
            .padding()

        }
        .background(Color.cyan)
    }
}

#Preview {
    InConsultationView()
        .environmentObject(ConsultingViewModel())
}
