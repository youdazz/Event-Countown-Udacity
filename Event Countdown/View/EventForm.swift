//
//  EventForm.swift
//  Event Countdown
//
//  Created by Youda Zhou on 18/6/24.
//

import SwiftUI

enum Mode {
    case add
    case edit(Event)
    
    func getTitle() -> String {
        switch self {
        case .add:
            return "Add event"
        case .edit(let event):
            return "Edit \(event.title)"
        }
    }
}

struct EventForm: View {
    
    @State var title: String = ""
    @State var date: Date = Date()
    @State var color: Color = .black
    
    var mode: Mode
    var onSave: (Event) -> Void
    var event: Event?
    @Environment(\.presentationMode) var presentationMode
    
    init(mode: Mode, onSave: @escaping (Event) -> Void) {
        switch mode {
        case .add:
            break
        case .edit(let event):
            self.event = event
            title = event.title
            date = event.date
            color = event.textColor
        }
        
        self.mode = mode
        self.onSave = onSave
    }
    
    var body: some View {
        Form{
            Section {
                TextField("Title", text: $title)
                    .foregroundColor(color)
                DatePicker("Date", selection: $date)
                ColorPicker("Text color", selection: $color)
            }
        }.toolbar(content: {
            Button("create", systemImage: "checkmark") {
                if validateInput() {
                    let id: UUID = event?.id ?? UUID()
                    onSave(.init(id: id, title: title, date: date, textColor: color))
                    presentationMode.wrappedValue.dismiss()
                }
            }
        })
        .navigationTitle(mode.getTitle())
    }
    
    func validateInput() -> Bool{
        return !title.isEmpty
    }
}

#Preview {
    NavigationStack {
        EventForm(mode: .add) {
            event in
        }
    }
    
}
