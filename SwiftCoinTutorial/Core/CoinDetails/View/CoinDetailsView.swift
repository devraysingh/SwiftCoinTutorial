//
//  CoinDetailsView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 5/17/23.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    
    init (coin: Coin){
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            //chart
            ChartView(viewModel: viewModel).frame(height: 250).padding(.vertical).shadow(color: viewModel.chartLineColor, radius: 10).shadow(color: viewModel.chartLineColor.opacity(0.5), radius: 10)
            

            CoinDetailsSectionView(model: viewModel.overviewSectionModel).padding(.vertical)
            CoinDetailsSectionView(model: viewModel.additionalDetailsSectionModel).padding(.vertical)
//
        }.navigationTitle(viewModel.coinName).padding()
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
