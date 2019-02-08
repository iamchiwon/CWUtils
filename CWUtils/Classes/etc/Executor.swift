//
//  Executor.swift
//  CWUtils
//
//  Created by iamchiwon on 09/02/2019.
//

import Foundation
import Then

func executeMainAsync(_ job: @escaping () -> Void) {
    DispatchQueue.main.async {
        job()
    }
}

func execute(after: TimeInterval, job: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
        job()
    }
}

func execute(daily forKey: String, job: @escaping () -> Void) {
    UserDefaults.standard.do { it in
        let lastDay = it.string(forKey: forKey)
        let today = Date().shortDate()
        if lastDay == nil || lastDay! != today {
            it.set(today, forKey: forKey)
            job()
        }
    }
}

func execute(once forKey: String, job: @escaping () -> Void) {
    UserDefaults.standard.do { it in
        let lastDay = it.string(forKey: forKey)
        if lastDay == nil {
            it.set("executed", forKey: forKey)
            job()
        }
    }
}

func resetExecuted(once forKey: String) {
    UserDefaults.standard.do { it in
        it.set(nil, forKey: forKey)
    }
}
