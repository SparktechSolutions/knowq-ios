//
//  ConsultingViewModel.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 18/11/24.
//

import Foundation

class ConsultingViewModel: ObservableObject {
    @Published var isConsultationStarted: Bool = false
    @Published var currentAttendingTokenNumber: Int = 1
    @Published var skippedTokenNumbers: [Int] = []
    private var sequencialAttendingTokenNumber = 1
    
    func markCurrentTokenNumberConsultationCompleted() {
        if skippedTokenNumbers.contains(currentAttendingTokenNumber) {
            self.skippedTokenNumbers.removeAll(where: { $0 == currentAttendingTokenNumber })
            self.currentAttendingTokenNumber = self.sequencialAttendingTokenNumber
        } else {
            self.incrementSequentialTokenNumber()
        }
    }
    
    func incrementSequentialTokenNumber() {
        self.sequencialAttendingTokenNumber += 1
        self.currentAttendingTokenNumber = self.sequencialAttendingTokenNumber
    }
    
    func skipTokenNumber() {
        if skippedTokenNumbers.contains(currentAttendingTokenNumber) {
            self.skippedTokenNumbers.removeAll(where: { $0 == currentAttendingTokenNumber })
        } else {
            self.sequencialAttendingTokenNumber += 1
        }
        self.skippedTokenNumbers.append(currentAttendingTokenNumber)
        self.currentAttendingTokenNumber = sequencialAttendingTokenNumber
    }
    
    func attendSkippedTokenNUmber(tokenNumber: Int) {
        self.currentAttendingTokenNumber = tokenNumber
    }
    
    func resetTokenNumber() {
        self.sequencialAttendingTokenNumber = 1
        self.currentAttendingTokenNumber = 1
    }
}
