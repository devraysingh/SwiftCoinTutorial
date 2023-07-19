//
//  StatisticModel.swift
//  SwiftCoinTutorial
//
//  Created by ray on 7/18/23.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
