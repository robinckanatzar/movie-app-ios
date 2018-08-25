//
//  ClientHTTPProtocol.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation
import Marshal
import Alamofire

protocol ClientHTTPProtocol {
    func makeRequest(on path: String, httpMethod: HTTPMethod, parameters: Parameters?,
                     encoding: ParameterEncoding?, headers: HTTPHeaders?, completion: @escaping (ServiceResult<Bool>) -> Void)
    // Firebase
    func makeRequestFirebase(on path: String, httpMethod: HTTPMethod, parameters: Parameters?,
                             encoding: ParameterEncoding?, completion: @escaping (ServiceResult<Bool>) -> Void)
    
    func makeRequest<Result: Unmarshaling>(on path: String, httpMethod: HTTPMethod, parameters: Parameters?,
                                           encoding: ParameterEncoding?, headers: HTTPHeaders?,
                                           completion: @escaping (ServiceResult<Result>) -> Void)
    func makeRequest<Result: Unmarshaling>(on path: String, httpMethod: HTTPMethod, parameters: Parameters?,
                                           encoding: ParameterEncoding?, headers: HTTPHeaders?,
                                           completion: @escaping (ServiceResult<[Result]>) -> Void)
    func upload<Result: Unmarshaling>(on path: String, httpMethod: HTTPMethod, imageDataDict: [String: Data?], parameters: Parameters?,
                                      encoding: ParameterEncoding?, headers: HTTPHeaders?,
                                      completion: @escaping (ServiceResult<Result>) -> Void)
}

extension ClientHTTPProtocol {
    
    func makeRequest(on path: String,
                     httpMethod: HTTPMethod = .get,
                     parameters: Parameters? = nil,
                     encoding: ParameterEncoding? = nil,
                     headers: HTTPHeaders? = nil,
                     completion: @escaping (ServiceResult<Bool>) -> Void) {
        makeRequest(on: path, httpMethod: httpMethod, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
    
    func makeRequest<Result: Unmarshaling>(on path: String,
                                           httpMethod: HTTPMethod = .get,
                                           parameters: Parameters? = nil,
                                           encoding: ParameterEncoding? = nil,
                                           headers: HTTPHeaders? = nil,
                                           completion: @escaping (ServiceResult<Result>) -> Void) {
        makeRequest(on: path, httpMethod: httpMethod, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
    
    func makeRequest<Result: Unmarshaling>(on path: String,
                                           httpMethod: HTTPMethod = .get,
                                           parameters: Parameters? = nil,
                                           encoding: ParameterEncoding? = nil,
                                           headers: HTTPHeaders? = nil,
                                           completion: @escaping (ServiceResult<[Result]>) -> Void) {
        makeRequest(on: path, httpMethod: httpMethod, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
}

