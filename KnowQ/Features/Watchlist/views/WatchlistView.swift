//
//  WatchlistView.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import SwiftUI

struct WatchlistView: View {
    @ObservedObject var viewModel = WatchlistViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero, content: {
            
            upcomingAppointmentsSection
            
            watchlistSection
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    }
    
    var emptyStateFragment: some View {
        VStack(alignment: .center, spacing: 12) {
            Image("doctor")
            Text("Add doctors to your watchlist\nto know the status at their clinic.")
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    var watchlistTitleFragment: some View {
        HStack(spacing: 12) {
            Text("My Watchlist")
                .font(.title2)
                .bold()
            Spacer()
            
            NavigationLink {
                DoctorSearchView()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "plus")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color.red)
                    Text("Add")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color.red)
                }
            }
        }
        .padding(.all, 16)
    }
    
    var watchlistDoctorTile: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {
                Image("doctor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dr. Rammoorthy")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Text("MBBS, MD Dentist")
                        .fontWeight(.medium)
                        .lineLimit(1)
                    Text("People's Dental Clinic")
                        .font(.callout)
                        .foregroundColor(.black.opacity(0.7))
                        .lineLimit(1)
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.orange)
                        Text("4.5")
                            .font(.callout)
                            .bold()
                        Circle()
                            .frame(width: 6)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 12)
                        Text("120 Reviews")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
                Spacer()
                Button(action: {
                    viewModel.showActionSheet = true
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                })
            }
            .actionSheet(
                isPresented: $viewModel.showActionSheet,
                content: { watchlistItemActionSheet })
            
            Text("You don't have any appointment today.")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text("Your token number is 8")
                .fontWeight(.semibold)
                .foregroundColor(.orange)
            
            Divider()
            
            
            Text("Consultations haven't started.")
                .fontWeight(.semibold)
                .foregroundColor(.red)
            
            HStack(spacing: 12) {
                Text("Current Token:")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                Spacer()
                Text("5/10")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
            }
            
            
        }
        .padding(.all, 16)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
    }
    
    var watchlistSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            watchlistTitleFragment
            
            //            emptyStateFragment
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<10, id: \.self) { index in
                        watchlistDoctorTile
                    }
                }
                .padding(.bottom, 80)
            }
        }
    }
    
    var watchlistItemActionSheet: ActionSheet {
        ActionSheet(
            title: Text("Dr. Rammoorthy"),
            message: Text("Book a consultation or view doctor details."),
            buttons: [
                .default(Text("Book consultation")) {
                    //TODO: Book Doctor consultation
                },
            
                .default(Text("View doctor details")
                    .fontWeight(.bold)) {
                        //TODO: open doctor profile
                    },
                
                .destructive(Text("Remove")) {
                    //TODO: Remove doctor from Watchlist
                },
                .cancel(Text("Cancel"))
            ])
    }
}


#Preview {
    WatchlistView()
}
