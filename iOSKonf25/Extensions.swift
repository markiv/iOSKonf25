//
//  Extensions.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 04.05.2025.
//

import Foundation
import SwiftUI

extension String {
    static let loremIpsum = """
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem \
    aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \
    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores \
    eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, \
    consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam \
    quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, \
    nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \
    quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
    """.split(separator: " ")

    init(placeholder length: Int) {
        self = Self.loremIpsum.dropFirst(length % 10).prefix(length).joined(separator: " ")
        self = prefix(1).capitalized + dropFirst()
        if last?.isPunctuation == false {
            append(".")
        }
    }
}

extension Text {
    init(placeholder length: Int) {
        self.init(String(placeholder: length))
    }
}

extension Decodable {
    init(json filename: String, in bundle: Bundle = .main) {
        let url = bundle.url(forResource: filename, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        self = try! JSONDecoder().decode(Self.self, from: data)
    }
}
