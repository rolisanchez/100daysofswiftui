//
//  ConditionalSavingContext.swift
//  CoreDataProject
//
//  Created by Victor Rolando Sanchez Jara on 5/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ConditionalSavingContext: View {
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        Button(action: {
            // So, rather than call save() directly we should always wrap it in a check first, like this:
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }) {
            Text("Save")
        }
    }
    
}

struct ConditionalSavingContext_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSavingContext()
    }
}
