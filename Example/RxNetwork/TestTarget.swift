//
//  TestTarget.swift
//  SwiftNetwork
//
//  Created by GorXion on 2018/4/17.
//  Copyright © 2018年 gaoX. All rights reserved.
//

import Moya

enum TestTarget {
    case test(count: Int)
}

extension TestTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://139.196.176.51:82/")!
    }
    
    var path: String {
        return "m/banner"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .test(let count):
            return .requestParameters(parameters: ["token": "", "body": ["count": count], "sign": ""], encoding: JSONEncoding.default)
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var headers: [String: String]? {
        return nil
    }
}
