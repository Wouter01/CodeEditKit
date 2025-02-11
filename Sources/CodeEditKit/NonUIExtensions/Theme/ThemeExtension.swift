//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import SequenceBuilder

public protocol ThemeExtension {
    associatedtype ThemesBody: Sequence where ThemesBody.Element: ThemeItem

    @SequenceBuilder
    var themes: ThemesBody { get }
}

extension ThemeExtension {
    var availableExtensions: [ExtensionKind] {
        themes.map { ExtensionKind.theme(themeID: $0.id) }
    }

    func getTheme(with id: String) -> GeneralThemeItem? {
        guard let theme = themes.first(where: { $0.id == id }) else { return nil }
        return GeneralThemeItem(theme)
    }
}

public struct GeneralThemeItem: ThemeItem, Codable {
    public var id: String
    public var label: String
    public var description: String
    @CodableColorArray public var colors: [NSColor]

    public init(id: String, label: String, description: String = "Generic Theme", colors: [NSColor]) {
        self.id = id
        self.label = label
        self.description = description
        self.colors = colors
    }

    init(_ theme: any ThemeItem) {
        self.init(id: theme.id, label: theme.label, description: theme.description, colors: theme.colors)
    }
}
