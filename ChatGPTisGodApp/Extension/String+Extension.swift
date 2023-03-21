//
//  String+Extension.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import Foundation

extension String {
    func removeBefore(target: String) -> String {
        let index = self.searchIndex(target: target)
        return index >= 0 ? String(self.dropFirst(index)): self
    }

    private func searchIndex(target: String) -> Int {
        let index = NSString(string: self).range(of: target).location
        guard index < self.count else { return -1 }
        return index
    }
}
