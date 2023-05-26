//
//  HomeView.swift
//  SwiftCoinTutorial
//
//  Created by ray on 5/17/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                //top mover view
                TopMoversView(viewModel: viewModel)
                Divider()
                //all coin movers
                AllCoinsView(viewModel: viewModel)
                
            }.navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
