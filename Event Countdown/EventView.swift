//
//  ContentView.swift
//  Event Countdown
//
//  Created by Youda Zhou on 18/6/24.
//

import SwiftUI

struct EventView: View {
    @State var events: [Event] = []
    
    var body: some View {
        NavigationStack{
            List(events, id: \.self) { event in
                NavigationLink(value: event) {
                    EventRow(event: event)
                        .swipeActions{
                            Button("Delete") {
                                if let idx = events.firstIndex(of: event) {
                                    events.remove(at: idx)
                                }
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationDestination(for: Event.self, destination: { event in
                EventForm(mode: .edit(event)) { event in
                    if let idx = events.firstIndex(where: { ev in
                        ev.id == event.id
                    }) {
                        events[idx] = event
                    }
                }
            })
            .navigationTitle("Events")
            .toolbar(content: {
                NavigationLink {
                    EventForm(mode: .add) { event in
                        events.append(event)
                    }
                } label: {
                    Image(systemName: "plus")
                }
            })
        }
    }
}

#Preview {
    EventView()
}
