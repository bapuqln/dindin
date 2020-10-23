//
//  FDNeworkService.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//
import Moya
import ObjectMapper
import Foundation

public class FDNetworkingService {
    private static let sharedInstance: FDNetworkingService = {
        return FDNetworkingService()
    }()

    private init() { }

    public class func shared() -> FDNetworkingService {
       return sharedInstance
    }
    
    public struct RequestResult {
        var success: Bool
        var errorInfo: String?
        var responseData: Any?
        
//        public init() {
//            self.success = false
//            self.errorInfo = nil
//            self.responseData = nil
//        }
        
        public init(_ errorInfo: String) {
            self.success = false
            self.errorInfo = errorInfo
        }
        
        public init(_ response: Any) {
            self.success = true
            self.responseData = response
        }
    }
    
    public typealias completionClosure = (_ result: RequestResult) -> Void
    
    var provider = MoyaProvider<FDRequestAPI>(stubClosure: MoyaProvider<FDRequestAPI>.immediatelyStub)
    
    private func requestApi(_ api: FDRequestAPI, completion: @escaping completionClosure) {
        self.provider.request(api) { (reqResult) in
            switch reqResult {
            case .success(let resp):
                completion(RequestResult(resp.data))
            case .failure(let error):
                completion(RequestResult(error.localizedDescription))
            }
        }
    }
    
    public func fetchMenu(completion: @escaping completionClosure) {
        self.requestApi(.menu) { (response) in
            
            guard let data = response.responseData as? Data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any],
                  let menuEntity: FDMenuResponseEntity = Mapper<FDMenuResponseEntity>().map(JSON: json) else {
                completion(RequestResult("error occur"))
                return
            }
            
            completion(RequestResult(menuEntity))
        }
    }
    
    public func fetchBanner(completion: @escaping completionClosure) {
        self.requestApi(.banner) { (response) in
            
            guard let data = response.responseData as? Data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any],
                  let banner = Mapper<FDBannerResponseEntity>().map(JSON: json) else {
                completion(RequestResult("error occur"))
                return
            }
            
            completion(RequestResult(banner))
        }
    }
}
