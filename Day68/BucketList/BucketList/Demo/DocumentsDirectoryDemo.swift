//
//  DocumentsDirectoryDemo.swift
//  BucketList
//
//  Created by Victor Rolando Sanchez Jara on 6/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct DocumentsDirectoryDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str: String = "Test Message"
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
//                    let input: String = FileManager.default.decodeFile("message.txt")
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
    
    // MARK: Methods
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct DocumentsDirectoryDemo_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsDirectoryDemo()
    }
}

extension FileManager {
    
    func decodeFile<T:Codable>(_ file: String) -> T {
        let url = self.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from FileManager.")
        }

        let decoder = JSONDecoder()

        // Can't decode as String?
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
        
        // Forcing it as string works but is not generic...
//        guard let str = try? String(contentsOf: url) else {
//            fatalError("Could not get string")
//        }
//
//        return str as! T
    }
}
