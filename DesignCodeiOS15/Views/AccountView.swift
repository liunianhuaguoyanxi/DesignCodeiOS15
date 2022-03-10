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
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            List
            {
                profile
                
                menu
                
                links


            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button{presentationMode.wrappedValue.dismiss()} label: {
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
                Text("Canda")
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
