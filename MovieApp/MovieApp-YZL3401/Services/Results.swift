//
//  Results.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 21.01.2024.
//

import Foundation

enum Results<Value>{
    case success(Value)
    case error(Error)
}
