//
//  Connectivity.swift
//  DotaHeroes
//
//  Created by Agus Cahyono on 06/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
