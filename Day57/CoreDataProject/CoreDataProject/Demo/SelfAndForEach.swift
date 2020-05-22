//
//  SelfAndForEach.swift
//  CoreDataProject
//
//  Created by Victor Rolando Sanchez Jara on 5/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SelfAndForEach: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
//        List {
//            ForEach([2, 4, 6, 8, 10], id: \.self) {
//                Text("\($0) is even")
//            }
//        }
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct SelfAndForEach_Previews: PreviewProvider {
    static var previews: some View {
        SelfAndForEach()
    }
}


struct Student: Hashable {
    let name: String
}
