//
//  Item.swift
//  medicare
//
//  Created by Anubhav Mishra on 05/07/25.
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
