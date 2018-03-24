//
//  TestRequest.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2018/01/22.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import RxSwift
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class TestRequest: NSObject {
    
    let testRequestPath = "http://192.168.100.102:3000/test.json"
    
    // まだGETでつくってないんですけどｗｗざんていで
    func get() -> Observable<TestObject> {
        return Observable.create { (observer: AnyObserver<TestObject>) in
            
            Alamofire.request("http://192.168.100.102:3000/test.json").responseObject() { (response:
                DataResponse<TestObject>) in
                switch response.result {
                case .success(let testObject):
                    // データ取得成功
                    observer.on(.next(testObject))
                    observer.onCompleted()
                    
                case .failure(let error):
                    // データ取得失敗
                    observer.onError(error)
                }
                }
                return Disposables.create()
            }
        }
    }


//            Alamofire.request(testRequestPath).response(completionHandler: )
//            .responseArray()
//            { (response: DataResponse<[TestObject]>) in
//            switch response.result {
//            case .success(let testObject):
//                // データ取得成功
//                print("testObject: \(testObject)")
//            case .failure(let errorObject):
//                // データ取得エラー
//                print("errorObject: \(errorObject)")
//                break
//            }
//        }
