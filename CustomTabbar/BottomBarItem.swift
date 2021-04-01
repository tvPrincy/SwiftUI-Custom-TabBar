//
//  BottomBarItem.swift
//  CustomTabbar
//
//  Created by Kevin Baldha on 01/04/21.
//

import SwiftUI

public struct BottomBarItem {
    public let icon: String
    public let title: String
    public let color: Color
    
    public init(icon: String,
                title: String,
                color: Color) {
        self.icon = icon
        self.title = title
        self.color = color
    }
}
