//
//  MainViewModel.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2017/12/04.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//
import RxSwift
import RxCocoa

final class MainViewModel: NSObject {

    let myActionList: Variable<[StaffObject]> = Variable([])
    let request = TestRequest()
    let disposeBag = DisposeBag()

    func testRequest() {
        request.get().subscribe(
            onNext: { [unowned self] in
                self.myActionList.value = $0.staffList!
                print("success")

        },
            onError: {error in
            print(error)
        })
            .disposed(by: disposeBag)

    }
}

