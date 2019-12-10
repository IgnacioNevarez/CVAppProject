//
//  UIImageView+Extension.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(cornerRadius: CGFloat = 10){
        self.layoutIfNeeded()
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.contentMode = .scaleAspectFill
    }
    
    func loadImageFromURL(urlImage: URL, completion: @escaping () -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: urlImage) else { return }
            if let imageFromURL = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = imageFromURL
                    completion()
                }
            }
        }
    }
}

