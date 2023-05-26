//
//  TopMoversItemView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 5/17/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack {
            //Image
            KFImage(URL(string: coin.image)).resizable().frame(width: 32, height: 32).foregroundColor(.orange).padding(.bottom, 8)
            HStack{
                Text(coin.symbol.uppercased()).font(.caption).foregroundColor(Color.theme.primaryTextColor)
                Text(coin.currentPrice.toCurrency()).font(.caption).foregroundColor(.gray)
            }
            Text("\(coin.priceChangePercentage24H.toPercentString())").font(.title2).foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }.frame(width: 140, height: 140).background(Color.theme.itemBackgroundColor).overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 4)
        )
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        let coin = Coin(
//            id: "example_id",
//            symbol: "BTC",
//            name: "Bitcoin",
//            image: "bitcoin.png",
//            currentPrice: 50000.0,
//            marketCap: 1000000000.0,
//            marketCapRank: 1,
//            fullyDilutedValuation: nil,
//            totalVolume: nil,
//            high24H: nil,
//            low24H: nil,
//            priceChange24H: 23,
//            priceChangePercentage24H: nil,
//            marketCapChange24H: nil,
//            marketCapChangePercentage24H: nil,
//            circulatingSupply: nil,
//            totalSupply: nil,
//            maxSupply: nil,
//            ath: nil,
//            athChangePercentage: nil,
//            athDate: nil,
//            atl: nil,
//            atlChangePercentage: nil,
//            atlDate: nil,
//            lastUpdated: nil,
//            sparklineIn7D: nil,
//            priceChangePercentage24HInCurrency: 0.0
//        )
//
//        return TopMoversItemView(coin: coin)
//    }
//}
