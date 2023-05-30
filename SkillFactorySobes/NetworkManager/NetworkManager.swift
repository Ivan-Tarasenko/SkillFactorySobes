//
//  NetworkManager.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import Foundation
import Moya

enum RickEnum {
    enum rick: TargetType {
        
        case rickUrl
        
        var baseURL: URL {
            guard let url = URL(string: "https://rickandmortyapi.com/api") else { fatalError() }
            return url
            
        }
        
        var path: String {
            switch self {
            case .rickUrl:
                return "/character"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Moya.Task {
            switch self {
            case .rickUrl:
                return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String: String]? {
            return nil
        }
        
    }
}
