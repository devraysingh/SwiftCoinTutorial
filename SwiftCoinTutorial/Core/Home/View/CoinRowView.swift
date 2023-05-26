//
//  CoinRowView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 5/17/23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack{
            Text("\(coin.marketCapRank ?? 1)").font(.caption).foregroundColor(.gray)
            KFImage(URL(string: coin.image)).resizable().scaledToFit().frame(width: 32, height: 32).foregroundColor(.orange)
            VStack(alignment: .leading, spacing: 4){
                Text("\(coin.name)").font(.subheadline).fontWeight(.semibold).padding(.leading, 4).foregroundColor(Color.theme.primaryTextColor)
                Text("\(coin.symbol.uppercased())").font(.caption).padding(.leading, 6).foregroundColor(Color.theme.primaryTextColor)
            }.padding(.leading, 6)
            
            Spacer()
            
            VStack(alignment:.leading, spacing: 4) {
                Text("\(coin.currentPrice.toCurrency())").font(.subheadline).fontWeight(.semibold).padding(.leading, 4).foregroundColor(Color.theme.primaryTextColor)
                Text("\(coin.priceChangePercentage24HInCurrency.toPercentString())").font(.caption).padding(.leading, 6).foregroundColor(coin.priceChangePercentage24HInCurrency > 0 ? .green : .red)
            }.padding(.leading, 2)
        }.padding(.horizontal).padding(.vertical, 2)
    }
}
