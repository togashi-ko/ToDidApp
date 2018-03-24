//
//  RxDemoViewController.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2017/11/24.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var testButton: UIButton!

    var viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingObject()
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func settingObject() {
        listTableView.delegate = self
        listTableView.dataSource = self
        
    }
    
    func bind() {
        viewModel.myActionList.asObservable()
            .skip(1) //初回bind時はシカト
            .subscribe( onNext: { _ in
                self.listTableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func tapTestButton(_ sender: Any) {
        viewModel.testRequest()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myActionList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StaffCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! StaffCell
        let staff: StaffObject = viewModel.myActionList.value[indexPath.row]
        cell.configure(object: staff)
        return cell
    }
}
