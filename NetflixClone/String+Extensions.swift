//
//  String+Extensions.swift
//  NetflixClone
//
//  Created by Yiğithan Sönmez on 2.12.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
