//
//  UIImage+Extensions.swift
//  NetflixClone
//
//  Created by Yiğithan Sönmez on 1.12.2023.
//

import UIKit

extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}
