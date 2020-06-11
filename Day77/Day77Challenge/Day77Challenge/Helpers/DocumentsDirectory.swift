//
//  DocumentsDirectory.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
