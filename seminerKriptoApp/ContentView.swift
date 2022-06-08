//
//  ContentView.swift
//  seminerKriptoApp
//
//  Created by Ahmet Mert ÖZ on 6.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let ekranBoyutu = UIScreen.main.bounds
        NavigationView{
        VStack{
            Image("logos")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: ekranBoyutu.width * 0.8, height: ekranBoyutu.height * 0.4, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black))
                .shadow(radius: 5)
            
            Text("Bitcoin Değerini Görmek İçin")
                .padding()
                .font(.headline)
            
            NavigationLink {
                detaySayfa()
            } label: {
                Text("TIKLA")
                    .foregroundColor(.white)
            }
            .padding()
            .background(.orange)
            .clipShape(Capsule())

            


            
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
