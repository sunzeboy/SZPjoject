//
//  NetworkService.swift
//  NetworkService
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

fileprivate func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

fileprivate let requestClosure = { (endpoint: Endpoint,
    closure: MoyaProvider<SZNetworkService>.RequestResultClosure) -> Void in
    var urlRequest = try? endpoint.urlRequest()
    if var urlRequest = urlRequest {
        urlRequest.timeoutInterval = Bundle.main.timeoutInterval
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}


fileprivate let endpoint = { (target: SZNetworkService) -> Endpoint in
    return Endpoint(url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                    sampleResponseClosure: { () -> EndpointSampleResponse in
                        return EndpointSampleResponse.networkResponse(200, target.sampleData)
    },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers)
}

fileprivate let networkProgressPlugin = NetworkActivityPlugin { (change,target) -> () in
    switch(change){
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

fileprivate let networkPrintPlugin = NetworkLoggerPlugin(verbose: true,
                                                         responseDataFormatter:JSONResponseDataFormatter)


public let apiProvider = MoyaProvider<SZNetworkService>(endpointClosure: endpoint,
                                                 requestClosure: requestClosure,
                                                 stubClosure: MoyaProvider.neverStub,
                                                 callbackQueue: nil,
                                                 manager: MoyaProvider<SZNetworkService>.defaultAlamofireManager(),
                                                 plugins: [networkProgressPlugin,networkPrintPlugin],
                                                 trackInflights: false)



public enum SZNetworkService {
    case login(userid: String, passwd: String)
}

extension SZNetworkService: TargetType {
    public var baseURL: URL {
        return URL(string: Bundle.main.apiBaseURL)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return Bundle.main.apiLogin
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(userid: let userid, passwd: let passwd):
            return .requestParameters(parameters: ["userid": userid, "passwd": passwd], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
}
