//
//  DetailController.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit
import SnapKit

final class DetailController: UIViewController {
    
    var allCharacters: [Characters] = []
    var cellIndex = Int()
    
    private let characterImage = CustomImageView(frame: .zero)
    
    private let nameLabel = Customlabel()
    private let statusLabel = Customlabel()
    private let speciesLabel = Customlabel()
    private let genderLabel = Customlabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setCharacterImage()
        setNameLabel()
        setStatusLabel()
        setSpeciesLabel()
        setGenderLabel()
        
        createAccesibilityIdentifier()
    }
}

// MARK: - Private methods
private extension DetailController {
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func setCharacterImage() {
        view.addSubview(characterImage)
        
        let url = URL(string: allCharacters[cellIndex].image)
        characterImage.kf.setImage(with: url)
        
        characterImage.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(250)
            make.centerX.equalTo(view)
            make.top.equalTo(150)
        }
    }
    
    func setNameLabel() {
        view.addSubview(nameLabel)
        
        let name = allCharacters[cellIndex].name
        nameLabel.text = "Name: \(name)"
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp_bottomMargin).offset(50)
            make.leading.equalTo(view).offset(40)
        }
    }
    
    func setStatusLabel() {
        view.addSubview(statusLabel)
        
        let status = allCharacters[cellIndex].status
        
        statusLabel.text = "Status: \(status)"
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(50)
            make.leading.equalTo(view).offset(40)
        }
    }
    
    func setSpeciesLabel() {
        view.addSubview(speciesLabel)
    
        let species = allCharacters[cellIndex].species
        speciesLabel.text = "Species: \(species)"
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp_bottomMargin).offset(50)
            make.leading.equalTo(view).offset(40)
        }
    }
    
    func setGenderLabel() {
        view.addSubview(genderLabel)
        
        let gender = allCharacters[cellIndex].gender
        genderLabel.text = "Gender: \(gender)"
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp_bottomMargin).offset(50)
            make.leading.equalTo(view).offset(40)
        }
    }
}

// MARK: - AccessibilityIdentifier
private extension DetailController {
    
    func createAccesibilityIdentifier() {
        characterImage.accessibilityIdentifier = "character_Image"
        nameLabel.accessibilityIdentifier = "name_Label"
        statusLabel.accessibilityIdentifier = "status_Label"
        speciesLabel.accessibilityIdentifier = "species_Label"
        genderLabel.accessibilityIdentifier = "gender_Label"
    }
}
