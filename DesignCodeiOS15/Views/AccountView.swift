//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by zw on 2022/3/8.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "Cannada")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @ObservedObject var coinModel = CoinModel()
    
    func fetchAddress() async {
        do{
            let url = URL(string: "https://random-data-api.com/api/address/random_address")!
            let(data,_) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
            print(String(decoding: data, as: UTF8.self))
        } catch {
            //show error
            address = Address(id: 1, country: "Error fetching")
        }

    }
    
    var body: some View {
        NavigationView{
            List
            {
                profile
                
                menu
                
                Section{
                    Toggle(isOn: $isLiteMode){
                        Label("List Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                    }
                }
                .accentColor(.primary)
                
                links
                
                coins

                Button{
                    isLogged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
            }
            .task {
                await fetchAddress()
                await coinModel.fetchCoins()
            }
            .refreshable {
                await fetchAddress()
                await coinModel.fetchCoins()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button{dismiss()} label: {
                Text("Done").bold()
            })
        }
    }
    
    var profile: some View
    {
        VStack(spacing :8){
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue,.blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
//                    Image(systemName: "hexagon")
//                                .symbolVariant(.fill)
//                                .foregroundColor(.blue)
//                                .font(.system(size: 200))
                                 HexagonView()
                                .offset(x: -50 , y: -100))
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6 )
                )
            Text("Meng To")
                .font(.title.weight(.semibold))
            HStack{
                Image(systemName: "location")
                    .imageScale(.large)
                Text(address.country)
                    .foregroundColor(.secondary)
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View
    {
        Section
        {
            NavigationLink(destination: HomeView())
            {
                Label("Setting", systemImage: "gear")
            }
            NavigationLink{ Text("Billing")} label: {
                Label("Billing",systemImage: "creditcard")
            }
            NavigationLink{HomeView()} label:{
                Label("Help", systemImage: "questionmark")
            }
            
            
            
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View{
        Section {
            if  !isDeleted {
                Link(destination: URL(string: "https://apple.com")!){
                    HStack
                    {
                        Label("Websit",systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                    
                }
                .swipeActions (edge: .leading, allowsFullSwipe: true){
                    Button(action: { isDeleted = true})
                    {
                        Label("Delete",systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
            }
            }
            Link(destination: URL(string: "https://youtube.com")!){
                HStack
                {
                    Label("YouTube",systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
                
            }
            .swipeActions{
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var coins: some View {
        Section(header: Text("Coins")){
            ForEach(coinModel.coins){coin in
                HStack {
                    AsyncImage(url: URL(string: coin.logo)){image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.coin_name)
                        Text(coin.acronym)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                
            }
        }
    }
    
    var pinButton: some View
    {
        Button{ isPinned.toggle()} label: {
            if isPinned{
                Label("Unpin", systemImage: "pin.slash")
            }else
            {
            Label("Pin",systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray :.yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
