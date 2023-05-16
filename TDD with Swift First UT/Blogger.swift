//
//  Blogger.swift
//  TDD with Swift First UT
//
//  Created by Vasanth Kumar on 16/05/23.
//

import Foundation

struct Blogger {
    func makeHeadline(from input: String) -> String {
        return input.capitalized
    }
    
    func reverseString(from input: String) -> String {
        return String(input.reversed())
    }
}
