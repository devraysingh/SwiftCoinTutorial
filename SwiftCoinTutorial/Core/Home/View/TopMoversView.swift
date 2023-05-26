//
//  TopMoversView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 5/17/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers").font(.headline).padding(.bottom, 8)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            CoinDetailsView()
                        } label: {
                            TopMoversItemView(coin: coin)
                        }
                    }
                }
            }
        }.padding()
    }
}

//struct TopMoversView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversView()
//    }
//}
