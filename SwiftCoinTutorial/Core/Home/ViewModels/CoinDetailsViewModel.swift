//
//  CoinDetailsViewModel.swift
//  SwiftCoinTutorial
//
//  Created by ray on 7/18/23.
//

import Foundation
import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var yAxisValues = [Double]()
    var xAxisValues = [Date]()
    var coinName: String {
        return coin.name
    }
    
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var overviewSectionModel: CoinDetailSectionModel{
        let price = coin.currentPrice.toCurrency()
        let pricePerecentageChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price", value: price, percentageChange: pricePerecentageChange)
        
        let marketCap = coin.marketCap ?? 0
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap.formattedWithAbbreviations(), percentageChange: marketCapPercentChange)
        
        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank", value: "\(rank)", percentageChange: nil)
        
        let volume = coin.totalVolume ?? 0
        let volumeStat = StatisticModel(title: "Volume", value: volume.formattedWithAbbreviations(),percentageChange: nil)
        
        return CoinDetailSectionModel(title: "Overview", stats: [priceStats, marketCapStat, rankStat, volumeStat])

    }
    
    var additionalDetailsSectionModel: CoinDetailSectionModel {
        
        let high = coin.high24H.toCurrency()
        let highStat = StatisticModel(title: "24H High", value: high, percentageChange: nil)
        
        let low = coin.low24H.toCurrency()
        let lowStat = StatisticModel(title: "24H Low", value: low, percentageChange: nil)
        
        let priceChange24H = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change", value: priceChange24H, percentageChange: percentChange24H)
        
        let marketCapChange = coin.priceChangePercentage24H
        let marketCapChangePercent = coin.priceChangePercentage24H
        let marketSate = StatisticModel(title: "24 Market Cap Change", value: "$\(marketCapChange.formattedWithAbbreviations())", percentageChange: marketCapChangePercent)
        
        return CoinDetailSectionModel(title: "Additional Details", stats: [highStat,lowStat, priceChangeStat, marketSate])
    }
                                           
    init(coin: Coin){
        self.coin = coin;
        configureChartData()
    }
    func configureChartData(){
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.yAxisValues = [minPrice, (minPrice + maxPrice)/2, maxPrice]
        self.xAxisValues = [startDate, endDate]
        
        for price in priceData.reversed(){
            let date = endDate.addingTimeInterval(-1*60*60*Double(index))
            let chartDataItem = ChartData(date: date, value: price)
            self.chartData.append(chartDataItem)
            index += 1
        }
        
        
        
    }
}
