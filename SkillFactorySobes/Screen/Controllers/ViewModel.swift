//
//  ViewModel.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import Foundation
import Moya

protocol ViewModelProtocol: AnyObject {
    var onUpdataCharacters: (([Characters]) -> Void)? { get set }
}

final class ViewModel: ViewModelProtocol {
    
    var onUpdataCharacters: (([Characters]) -> Void)?
    
    private let requester = MoyaProvider<RickEnum.rick>()
    
    private var allCharacters: [Characters] = [] {
        didSet {
            onUpdataCharacters?(allCharacters)
        }
    }
    
    init() {
        requestApi()
    }
    
    private func requestApi() {
        requester.request(.rickUrl) { (result) in
            switch result {
            case .success(let response):
                let result = try? JSONSerialization.jsonObject(with: response.data, options: [])
                
                guard let jsonData = result as? [String: Any] else { return }
                
                let characters = RickModel(JSON: jsonData)
                
                if let characters = characters {
                    self.allCharacters = characters.allCharacter
                }

            case .failure(let error):
                print("error \(error)")
                
            }
        }
    }
}

