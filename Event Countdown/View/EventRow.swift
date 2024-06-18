//
//  EventRow.swift
//  Event Countdown
//
//  Created by Youda Zhou on 18/6/24.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    @State private var dateString: String
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(event: Event) {
        self.event = event
        self.dateString = RelativeDateTimeFormatter().string(for: event.date) ?? ""
    }
    
    var body: some View {
        VStack {
            Text(event.title)
                .foregroundColor(event.textColor)
                .frame(width: .infinity)
            Text(dateString).onReceive(timer, perform: { input in
                self.dateString = RelativeDateTimeFormatter().string(for: event.date) ?? ""
            }).frame(width: .infinity)
        }
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    List {
        EventRow(event: Event(title: "Este es el titulo", date: Date(), textColor: .red))
    }
}
