//
//  ViewModel.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/21/24.
//

import Foundation
import RxSwift

class MainViewModel {
    var busObservables = BehaviorSubject<[BusCell]>(value: [])
    var bbusInfo = BehaviorSubject<[BusCell]>(value: [])
    
    init() {
        var busItems = [
            BusCell(busStop: "둔전초등학교", busNumber: "541", busLocation: "3번째 전"),
            BusCell(busStop: "둔전초등학교", busNumber: "5623", busLocation: "7번째 전"),
            BusCell(busStop: "둔전초등학교", busNumber: "11-5", busLocation: "4번째 전"),
            BusCell(busStop: "둔전초등학교", busNumber: "15", busLocation: "8번째 전"),
        ]
        
        busObservables.onNext(busItems)
    }
    
    
}
