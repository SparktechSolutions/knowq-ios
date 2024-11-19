//
//  WatchlistView+UpcomingAppointments.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import SwiftUI

extension WatchlistView {
    var upcomingAppointmentsTitleFragment: some View {
        HStack(spacing: 12) {
            Text("Upcoming Appointments")
                .font(.title2)
                .bold()
                .lineLimit(1)
            
            Spacer()
            
            NavigationLink {
                UpcomingConsultationsView()
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
        NavigationLink {
            UpcomingConsultationsView()
        } label: {
            
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
    
}
