//
//  BusInfoViewModel.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/24/24.
//

import Foundation
import RxSwift

final class BusInfoViewModel {
    private let disposeBag = DisposeBag()
    private let busInfo = PublishSubject<BusCell>()
    
    var busInfoOb: Observable<BusCell> {
        busInfo.asObservable()
    }
}
