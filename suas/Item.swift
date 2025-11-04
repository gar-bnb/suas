//
//  Item.swift
//  suas
//
//  Created by Gareth Boyle on 04/11/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
