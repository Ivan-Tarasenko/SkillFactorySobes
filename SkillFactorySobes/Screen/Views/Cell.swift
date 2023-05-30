//
//  Cell.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class Cell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    private let characterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addedSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setImage(url: String) {
        let url = URL(string: url)
        characterImage.kf.setImage(with: url) { result in
            switch result {
            case .failure:
                self.characterImage.image = UIImage(named: "logoApp")
            case .success:
                break
            }
        }
    }
    
    private func addedSubview() {
        addSubview(nameLabel)
        addSubview(characterImage)
        
        characterImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(70)
            make.leading.equalTo(10)
            make.centerY.equalTo(self)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(characterImage.snp_trailingMargin).offset(20)
            make.trailing.equalTo(self).offset(-10)
            make.centerY.equalTo(self)
        }
    }
}
