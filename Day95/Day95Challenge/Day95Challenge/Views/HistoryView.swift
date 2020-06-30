//
//  HistoryView.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/30/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    // MARK: Properties
     @FetchRequest(entity: DiceThrow.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \DiceThrow.dateThrown, ascending: false)]) var diceThrows: FetchedResults<DiceThrow>
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm ZZZZZ"
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(diceThrows, id: \.self) { diceThrow in
                    HStack(alignment: .bottom) {
                        VStack {
                            Text("Value: \(diceThrow.value)")
                                .font(.body)
                            Text("Dice Type: \(diceThrow.diceType)")
                                .font(.caption)
                        }
                        Spacer()
                        Text("Date Thrown: \(diceThrow.dateThrown, formatter: Self.taskDateFormat)")
                        .font(.caption)
                    }
                    
                }
            }
            .navigationBarTitle("History")
        }
        
    }
    // MARK: Methods
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
