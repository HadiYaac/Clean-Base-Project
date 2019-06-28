//
//  APIClient.swift
//  Base-Project
//
//  Created by Hadi on 7/5/18.
//  Copyright © 2018 Tedmob. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift
import SessionManager

class  APIClient {
    
    static let shared = APIClient()
    var sessionManager: SessionManager {
        return SessionManager()
    }
    
    private let provider : MoyaProvider<BaseProjectService>
    
    init(){
        provider = MoyaProvider<BaseProjectService>()
    }


    func setOneSignalToken(withToken token : String) -> Single<Void>{
        return self.provider.rx.request(.setOneSignalUserPush(token: token))
            .mapObject(User.self)
            .map {self.sessionManager.currentUser = $0}
            .map {return Void()}
    }
    
}

