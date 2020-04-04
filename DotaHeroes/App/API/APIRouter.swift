//
//  APIRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Alamofire

enum APIRouter: APIConfiguration {
    case list
    
    var baseURL: URL {
        switch self {
        case .list:
            guard let url = URL(string: Constant.baseURL) else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
    }
    
    var headers: [String : String]? {
        return [
            HTTPHeaderField.contentType.rawValue: ContentType.form.rawValue,
            HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue,
        ]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    
    var path: String {
        switch self {
        case .list:
            return "herostats"
        }
    }
    
    var parameters: Parameters? {
        return [
            "api_key": Constant.apiKey
        ]
    }
    
    var multipartFormData: (MultipartFormData) -> Void {
        switch self {
        default:
            return { multipartFormData in
            }
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        headers?.forEach({ (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
        print("URL ", urlRequest.url?.absoluteString ?? "")
        return try parameterEncoding.encode(urlRequest, with: parameters)
    }
    
}
