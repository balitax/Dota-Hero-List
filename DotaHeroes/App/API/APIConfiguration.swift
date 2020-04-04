//
//  APIConfiguration.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var baseURL: URL { get }
    var headers: [String : String]? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var multipartFormData: (MultipartFormData) -> Void { get }
    var parameterEncoding: ParameterEncoding { get }
}

enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case xApiKey = "x-api-key"
}

enum ContentType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
}

enum UploadState {
    case uploading(progress: Int)
    case success(url: String)
}

enum DownloadState {
    case downloading(progress: Int)
    case success(url: String)
}
