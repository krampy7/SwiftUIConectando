//
//  PlaceDetailView.swift
//  SwiftUIStarterKitApp
//
//  Created by Adrian on 11/08/2019.
//  
//

import SwiftUI
import Combine

class SelectedPoint: ObservableObject {
    @Published var selectedIndex: Int = 0
}

struct PlaceDetailView : View {
    @Binding var isShowing: Bool
    @Binding var placeItem: ActivitiesPlaces?
    let defaultPoint = ActivitiesFamousPoints(id: 0, pointName: "Default", pointImage: "Default PlaceHolder", pointDescription: "Default Description PlaceHolder")
    
    @ObservedObject var selectedPoint = SelectedPoint()
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                Image(self.placeItem?.famousPointsArray[self.selectedPoint.selectedIndex].pointImage ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: g.size.width, height: g.size.height)
                    .opacity(0.3)
                    .background(Color.black)
                    .modifier(GrayModifier(shouldGray: self.settings.grayColor))
                    //.aspectRatio(contentMode: .fit)
                    .onDisappear {
                        self.isShowing = false
                }
                
                VStack(alignment: .leading) {
                    Text(self.placeItem?.activityPlace ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .padding(.top, 34)
                        .padding(.leading, 30)
                    HStack{
                        Spacer()
                    }
                    
                    Spacer()
                    
                    PlacesDetail(placeItems: self.placeItem?.famousPointsArray[self.selectedPoint.selectedIndex] ?? self.defaultPoint)
                        .padding(.bottom, 50)
                    
                    ZStack {
                        BlurView(style: .light)
                            .frame(width: g.size.width, height: 130)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.placeItem?.famousPointsArray ?? [], id: \.id) { item in
                                    PlacesCircleView(placeItems: item, selectedPoint: self.selectedPoint)
                                }
                            }.frame(width: g.size.width, height: 130)
                                .modifier(GrayModifier(shouldGray: self.settings.grayColor))
                                    
                        }
                    }.padding(.bottom, 50)
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PlacesCircleView: View {
    var placeItems: ActivitiesFamousPoints
    @ObservedObject var selectedPoint: SelectedPoint
    
    var body: some View {
        GeometryReader { g in
            Button(action: {
                self.selectedPoint.selectedIndex = self.placeItems.id
            }) {
                ZStack {
                    Image(self.placeItems.pointImage).renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .background(Color.red)
                        .clipShape(Circle())
                    
                    
                    if (self.selectedPoint.selectedIndex == self.placeItems.id) {
                           Text("✓")
                                .font(.system(size: 30, weight: .bold, design: Font.Design.default))
                                .foregroundColor(Color.white)
                    }
                }
            }
        }
    }
}

struct PlacesDetail: View {
    var placeItems: ActivitiesFamousPoints
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeItems.pointName)
                .foregroundColor(Color.white)
                .font(.system(size: 24, weight: .bold, design: .default))
                .padding(.leading, 30)
            
            Text(placeItems.pointDescription)
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .regular, design: .default))
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }
    }
}
