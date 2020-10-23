//
//  FDNetworking.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import Foundation
import Moya

enum FDRequestAPI: TargetType {
    case menu, banner

    var baseURL: URL {
        return URL(string: String.fd_BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .menu:
            return String.fd_path_menu
        case .banner:
            return String.fd_path_banner
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .banner:
            return self.mockData(fileName: "banner")
        case .menu:
            return self.mockData(fileName: "menu")
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [String.fd_contentType: String.fd_applicationJson]
    }
    
    private func mockData(fileName: String) -> Data{
        @objc class TestClass: NSObject{}
        let bundle = Bundle(for: TestClass.self)
        guard let path = bundle.path(forResource: fileName, ofType: "json") else { return Data() }
        return (try? Data(contentsOf: URL(fileURLWithPath: path))) ?? Data()
    }
}


