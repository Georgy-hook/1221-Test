//
//  StoryButton.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//
import UIKit

class StoryButton: UIButton {
    private let buttonSize: CGFloat = 60

    init(image: UIImage?) {
        super.init(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
        imageView?.contentMode = .scaleAspectFill
        layer.borderWidth = 2
        layer.borderColor = UIColor.green.cgColor
        layer.cornerRadius = buttonSize / 2
        clipsToBounds = true
        guard let image = image else {return }
        setImage(image, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


