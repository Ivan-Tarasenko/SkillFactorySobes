//
//  CustomLabel.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit

final class Customlabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        textColor = .darkText
        numberOfLines = 0
        font = .systemFont(ofSize: 20)
    }
}
