//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public enum ExtensionKind: Codable, Hashable, CustomStringConvertible {
    case sidebarItem(sceneID: String, icon: String)
    case toolbarItem(sceneID: String, placement: CEToolbarItemPlacement)
    case action(actionID: String)
    case theme(themeID: String)
    case settings

    public var description: String {
        switch self {
        case .sidebarItem(let sceneID, _):
            return "Sidebar with ID \(sceneID)"
        case .toolbarItem(let sceneID, let placement):
            return "Toolbar Item with ID \(sceneID)"
        case .action(let actionID):
            return "Action with ID \(actionID)"
        case .theme(let themeID):
            return "Theme with ID \(themeID)"
        case .settings:
            return "Settings"
        }
    }
}


