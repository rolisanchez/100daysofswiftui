//
//  CoreDataDemo.swift
//  Bookworm
//
//  Created by Victor Rolando Sanchez Jara on 5/18/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CoreDataDemo: View {
    // Using Student Entity for Demo, field id (UUID) and name (String)
//    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
//            List {
//                ForEach(students, id: \.id) { student in
//                    Text(student.name ?? "Unknown")
//                }
//            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
//                let student = Student(context: self.moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
//
//                try? self.moc.save()
                
            }
        }
    }
}

struct CoreDataDemo_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataDemo()
    }
}
