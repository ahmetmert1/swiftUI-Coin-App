//
//  detaySayfa.swift
//  seminerKriptoApp
//
//  Created by Ahmet Mert ÖZ on 6.06.2022.
//

import SwiftUI

struct detaySayfa: View {
    
    let ekranBoyutGenislik = UIScreen.main.bounds.width
    let ekranBoyutUzunluk = UIScreen.main.bounds.height
    let apiUrl : String = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    @State var anaModel : Json4Swift_Base?

    
    
    var body: some View {

        VStack{
            Image("bitcoin")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: ekranBoyutGenislik * 0.5, height: ekranBoyutGenislik * 0.5, alignment: .center)
                .padding()
        
            Text("")
                .padding()
            
            HStack{
                VStack{
                    
                    Text("Bitcoin Değeri :")
                        .padding()
                    
                }
                VStack{
                    
                    Text("$  " + (anaModel?.bpi?.uSD?.rate ?? "Değer Alınamadı"))
                        .padding()
                    
                    Text("€  " + (anaModel?.bpi?.eUR?.rate ?? "Değer Alınamadı"))
                        .padding()
                    
                    Text("£  " + (anaModel?.bpi?.gBP?.rate ?? "Değer Alınamadı"))
                        .padding()
                    
                    
                
                    
                }
                
                

            }
            
        }.onAppear(perform: verileriGetir)
    
        
    }
    
    func verileriGetir(){
        
        let url = URL(string: apiUrl)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data else{return}
            
            if let decodedData = try?
                JSONDecoder()
                .decode(Json4Swift_Base.self, from: data){
                
                DispatchQueue.main.async {
                    self.anaModel = decodedData
                }
                
            }
        }.resume()
        
    }
    
    
}

struct detaySayfa_Previews: PreviewProvider {
    static var previews: some View {
        detaySayfa()
    }
}
