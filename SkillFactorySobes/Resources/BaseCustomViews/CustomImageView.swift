//
//  CustomImageView.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit

final class CustomImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentMode = .scaleAspectFit
        layer.cornerRadius = 15
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkText.cgColor
        clipsToBounds = true
    }
}
