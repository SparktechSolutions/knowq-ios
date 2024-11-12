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
        VStack(alignment: .leading, spacing: 0, content: {
            
            upcomingAppointmentsSection
            
            watchlistSection
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    }
    
    var upcomingAppointmentsTitleFragment: some View {
        HStack(spacing: 12) {
            Text("Upcoming Appointments")
                .font(.title2)
                .bold()
                .lineLimit(1)
            
            Spacer()
            
            Button {
                print("Add to watchlist clicked")
            } label: {
                HStack(spacing: 8) {
                    Text("See All")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color.red)
                }
            }
        }
        .padding(.all, 16)
    }
    
    var upcomingAppointmentTile: some View {
        HStack(spacing: 12) {
            VStack(alignment: .center, spacing: 4) {
                Text("29")
                    .font(.largeTitle)
                    .bold()
                Text("Nov")
                    .font(.body)
                    .bold()
            }
            .foregroundColor(.white)
            .padding(.all, 12)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("11:30 AM, Sunday")
                    .font(.caption)
                    .padding(.bottom, 4)
                Text("Dr. Rahul Ravichander")
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                Text("Heart Surgeon")
                    .font(.body)
                    .lineLimit(1)
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .frame(width: UIScreen.screenWidth * 0.8)
        .background(Image("curvy_graphics").opacity(0.6))
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
    
    var upcomingAppointmentsSection: some View {
        VStack(alignment: .leading, spacing: 0){
            upcomingAppointmentsTitleFragment
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<3, id: \.self) { index in
                        upcomingAppointmentTile.padding(.leading, index == 0 ? 16 : 0)
                            .padding(.trailing, index == 9 ? 16 : 0)
                    }
                }
            }
            .padding(.bottom, 16)
        }
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
            
            Button {
                print("Add to watchlist clicked")
            } label: {
                HStack(spacing: 8) {
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
            .actionSheet(isPresented: $viewModel.showActionSheet, content: {
                ActionSheet(
                    title: Text("Dr. Rammoorthy"),
                    message: Text("Book a consultation or view doctor details."),
                    buttons: [
                        .default(Text("Book consultation")) {
                            //TODO: Book Doctor consultation
                        },
                        
                        .default(Text("View Doctor")
                            .fontWeight(.bold)) {
                            //TODO: open doctor profile
                        },
                        
                        .destructive(Text("Remove")) {
                            //TODO: Remove doctor from Watchlist
                        },
                        .cancel(Text("Cancel"))
                    ])
            })
            
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
            }
        }
    }
}


#Preview {
    WatchlistView()
}
