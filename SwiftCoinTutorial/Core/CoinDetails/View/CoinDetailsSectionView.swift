//
//  CoinDetailsSectionView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 7/18/23.
//

import SwiftUI

struct CoinDetailsSectionView: View {
    let model: CoinDetailSectionModel
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Text(model.title).font(.title).bold().frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(model.stats){ stat in
                    StatisticView(model: stat)
                }
            }
        }
    }
}

struct CoinDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSectionView(model: dev.sectionModel)
    }
}
