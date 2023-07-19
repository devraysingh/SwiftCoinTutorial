//
//  ChatData.swift
//  SwiftCoinTutorial
//
//  Created by ray on 7/18/23.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
