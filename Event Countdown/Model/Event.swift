//
//  Event.swift
//  Event Countdown
//
//  Created by Youda Zhou on 18/6/24.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable, Hashable{
    
    let id: UUID
    var title: String
    var date: Date
    var textColor: Color
    
    init(id: UUID = UUID(), title: String, date: Date, textColor: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
}
