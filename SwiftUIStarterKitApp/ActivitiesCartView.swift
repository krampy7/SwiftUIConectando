//
//  ActivitiesCartView.swift
//  SwiftUIStarterKitApp
//
//  Created by Adrian on 03/08/2019.
//  
//

import SwiftUI
import Combine

class ActivitiesCart: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var ActivitiesCartArray : [ActivitiesCartItem] {
       willSet {
            objectWillChange.send()
        }
    }
    
    init(data: [ActivitiesCartItem] ) {
        self.ActivitiesCartArray = data
    }
}

struct ActivitiesCartItem {
    var itemID: String
    var itemName: String
    var itemPrice: Int
    var itemColor: String
    var itemManufacturer: String
    var itemImage: String
}

struct ActivitiesCartView: View {
    
    @ObservedObject var ShoppingCartItemsData : ActivitiesCart
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Divider()
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    HStack {
                        
                        NavigationView{
                        
                            ScrollView{
                        
                                SearchBar(searchText: $searchText, isSearching: $isSearching)
                        
                                ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self){ num in
                                    HStack{
                                        Text("\(num)")
                                        Spacer()
                                    }.padding()
                                    Divider()
                                        .background(Color(.systemGray4))
                                        .padding(.leading)
                                }
                            }
                            .navigationTitle("Urgente")
                        }
                        
                    }
                    //.navigationBarTitle("Urgente")
                    
//                ScrollView (.vertical, showsIndicators: false) {
//                    VStack (alignment: .leading) {
                        //ForEach(self.ShoppingCartItemsData.ActivitiesCartArray, id: \.itemID) { item in
                        //    ShoppingCartCellView(shoppingCartItem: item)
                        //        .frame(width: geometry.size.width - 24, height: 80)
                        //
                        //    }
//                    }
//                }
//                .frame(height: 87 * 4)
//
//                Spacer()
                //ShoppingFinalInfoView(ShoppingCartItemsData: self.ShoppingCartItemsData)
                //Button(action: {
                //    let newelement = ActivitiesCartItem(itemID: String(Int.random(in: 6 ..< 100)), itemName: "DSLR", //itemPrice: 500, itemColor: "Black", itemManufacturer: "Nikon", itemImage: "4")
                //        self.ShoppingCartItemsData.ActivitiesCartArray.append(newelement)
                //    }) {
                //        HStack {
                //        Text("Checkout")
                //    }
                //    .padding()
                //    .frame(width: geometry.size.width - 24, height: 40)
                //    .foregroundColor(Color.white)
                //    .background(Color.blue)
                //    .cornerRadius(5)
                //    }
                //    .padding(.top, 10)
                //    .padding(.bottom, 20)
          
            }
        }
    }
}



//NavigationView{
//
//    ScrollView{
//
//        SearchBar(searchText: $searchText, isSearching: $isSearching)
//
//        ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self){ num in
//            HStack{
//                Text("\(num)")
//                Spacer()
//            }.padding()
//            Divider()
//                .background(Color(.systemGray4))
//                .padding(.leading)
//        }
//    }
//    .navigationTitle("Expresiones")
//}

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack{
            HStack{
                TextField("Search", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
            )
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancelar")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring(), value: true)
            }
            
        }
    }
}

struct ShoppingFinalInfoView: View {
    @ObservedObject var ShoppingCartItemsData : ActivitiesCart
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack (alignment: .leading){
                    Spacer()
                    HStack {
                        Spacer()
                    }
                    Text("Shipping to the United States")
                        .font(.system(size: 12))
                    Text("from $225")
                        .font(.system(size: 12))
                }.frame(width: geometry.size.width / 2 - 12)

                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                    }
                    Text("\(self.ShoppingCartItemsData.ActivitiesCartArray.count) items on")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                    Text("$\(calculateSum(data: self.ShoppingCartItemsData))")
                        .font(.system(.title))
                }.frame(width: geometry.size.width / 2 - 12)
                
            }
            
        }

    }
}

func calculateSum(data: ActivitiesCart) -> Int {
    return data.ActivitiesCartArray.map({$0.itemPrice}).reduce(0, +)
}

struct ShoppingCartCellView: View {
    var shoppingCartItem: ActivitiesCartItem
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack (spacing: 10) {
                    Image("\(self.shoppingCartItem.itemImage)")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 5)
                        .padding(.leading, 5)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Spacer()
                        }
                        Text("\(self.shoppingCartItem.itemName)")
                            .lineLimit(nil)
                            .foregroundColor(.primary)
                        Text("\(self.shoppingCartItem.itemManufacturer)")
                            .foregroundColor(.primary)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                        Text("\(self.shoppingCartItem.itemColor)")
                            .foregroundColor(.primary)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 10)
                    }.frame(width: geometry.size.width - 150)
                     .padding(.top, 8)
                    VStack(alignment: .trailing){
                        //Spacer()
                        HStack {
                            Spacer()
                        }
                        Text("$\(self.shoppingCartItem.itemPrice)")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                            .padding(.trailing, 15)
                           
                          
                    }.padding(.bottom, 10)
                }
            }
            
        }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
        .cornerRadius(10)
       
       
    }
}
