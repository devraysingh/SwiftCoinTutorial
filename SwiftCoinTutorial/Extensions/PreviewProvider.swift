//
//  PreviewProvider.swift
//  SwiftCoinTutorial
//
//  Created by ray on 7/18/23.
//

import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let stat1 = StatisticModel(title: "Current Price", value: "$21, 543.00", percentageChange: 1.23)
    let stat2 = StatisticModel(title: "Market Capitalization", value: "413.15Bn", percentageChange: 1.67)
    let stat3 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stat4 = StatisticModel(title: "Volume", value: "35.99Bn", percentageChange: nil)
    
    
    var sectionModel: CoinDetailSectionModel {
        return CoinDetailSectionModel(title: "Overview", stats: [stat1, stat2, stat3, stat4])
    }
    
    let coin = Coin(
        id: "bitcoin",
        symbol: "BTC",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        marketCapRank: 1,
        currentPrice: 35123.45,
        priceChange24H: -1234.56,
        priceChangePercentage24H: -3.5,
        marketCap: 6159876543.21,
        fullyDilutedValuation: nil,
        totalVolume: 98765432.1,
        high24H: 36278.91,
        low24H: 34879.12,
        marketCapChange24H: -789012345.67,
        marketCapChangePercentage24H: -2.5,
        circulatingSupply: 18765432.1,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 64829.59,
        athChangePercentage: -45.0,
        athDate: "2021-04-14T11:54:38.000Z",
        atl: 3100.0,
        atlChangePercentage: 1034.5,
        atlDate: "2020-03-13T02:22:02.000Z",
        lastUpdated: "2023-07-18T12:30:00.000Z",
        sparklineIn7D: SparklineIn7D(
            price: [
                34922.12, 35401.45, 35225.67, 34992.34, 35567.89,
                35678.91, 35567.34, 35821.09, 35890.67, 35690.23,
                35321.12, 35555.78, 35111.23, 35201.45, 35123.45
            ]
        ),
        priceChangePercentage24HInCurrency: -1.2
    )

}
