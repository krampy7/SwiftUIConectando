// Se importan las librerias necesarias
import SwiftUI
import Combine

// Item de las actividades
struct ActivitiesItem {
    var id: Int
    var activityName: String
    var activityNameLabel: String
    var activityImage: String
    var selectedActivity: Bool
}

// Lugares de las actividades
struct ActivitiesPlaces {
    var id: Int
    var activityPlace: String
    var activityPlaceImage: String
    var famousPointsArray: [ActivitiesFamousPoints]
   
}

// Recurso de los elementos
struct ActivityResource {
    var id: Int
    var resourceName: String
    var resourceDescription: String
    var resources : [ActivityResourcesItem]
}

// El recurso de los elementos
struct ActivityResourcesItem {
    var id: Int
    var resourceName: String
    var resourceImage: String
    var resourceDescription: String
}

// La informacion de las actividades
struct ActivitiesData {
    var id: Int
    var activitiesPlaces: [ActivitiesPlaces]
    var activityResources: [ActivityResource]
}

// Puntos destacables
struct ActivitiesFamousPoints {
    var id: Int
    var pointName: String
    var pointImage: String
    var pointDescription: String
}

// Observable para poder estar mutando elementos en la app
class Activities: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var activitiesCollection : [ActivitiesData] {
       willSet {
            objectWillChange.send()
        }
    }
    
    var activities: [ActivitiesItem] {
        willSet {
                   objectWillChange.send()
               }
    }
    
    init(data: [ActivitiesData], items: [ActivitiesItem] ) {
        self.activitiesCollection = data
        self.activities = items
    }
}

class ActivitySelected: ObservableObject {
    @Published var index: Int = 0
}

struct ActivitiesContentView: View {
    @ObservedObject var activtiesData : Activities
    @ObservedObject var selectedActivity = ActivitySelected()
    @State var isShowing: Bool = false
    @State var placeItemSelected: ActivitiesPlaces? = nil
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
        GeometryReader { g in
            ScrollView{
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 10){
                                ForEach(self.activtiesData.activities, id: \.id) { item in
                                    ShopPromotionBannerView(activtiesItems: item, selectedActivity: self.selectedActivity)
                                            .frame(width: 120, height: 60)
                                            .modifier(GrayModifier(shouldGray: self.settings.grayColor))
                                            
                                }
                            }.padding(.leading, 30)
                            .padding(.trailing, 30)
                            .padding(.bottom, 10)
                        }
                        .padding(.top, 20)
                        
                        Text("\(self.activtiesData.activities[self.selectedActivity.index].activityNameLabel)")
                            .font(.system(size: 20))
                            .padding(.leading, 30)
                            .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                    HStack (spacing: 10) {
                                        ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activitiesPlaces, id: \.id) { item in
                                            Button(action: {
                                                self.placeItemSelected = item
                                                self.isShowing = true
                                            }) {
                                                ShopBestSellerViews(activityPlaces: item)
                                                                    .frame(width: 155, height: 225)
                                                                    .modifier(GrayModifier(shouldGray: self.settings.grayColor))
                                            }
                                        }
                                        
                                }.padding(.leading, 30)
                                 .padding(.trailing, 30)
                                 .padding(.bottom, 10)
                                
                        }
                        
                        
                        
                        VStack (spacing: 20) {
                            ForEach(self.activtiesData.activitiesCollection[self.selectedActivity.index].activityResources, id: \.id) { item in
                                ShopNewProductViews(activityResources: item)
                                         .frame(width: g.size.width - 60, height: g.size.width - 60)
                                         .modifier(GrayModifier(shouldGray: self.settings.grayColor))
                            }
                        }.padding(.leading, 30)
                        
                        
                    }
                    .navigationBarTitle("Información")
                    /*
                    .navigationBarItems(trailing:
                    Button(action: {
                        self.settings.loggedIn = false
                    }) {
                        Text("Log ")
                    })
                    */
            }.sheet(isPresented: self.$isShowing) { PlaceDetailView(isShowing: self.$isShowing, placeItem: self.$placeItemSelected)}
        }
    }
}

struct ShopBestSellerViews: View {
    
    var activityPlaces: ActivitiesPlaces
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
            ZStack{
                Image("\(activityPlaces.activityPlaceImage)").renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 225)
                        .background(Color.black)
                        .cornerRadius(10)
                        .opacity(0.8)
                        .aspectRatio(contentMode: .fill)
               
                VStack (alignment: .leading) {
                    Spacer()
                    
                    Text(activityPlaces.activityPlace)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .bold, design: Font.Design.default))
                        .padding(.bottom, 24)
                }
                    
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.white)
          
    }
}

struct ShopPromotionBannerView: View {
    var activtiesItems: ActivitiesItem
    @ObservedObject var selectedActivity: ActivitySelected
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
        Button(action: {
            self.selectedActivity.index = self.activtiesItems.id
            
        }) {
            GeometryReader { g in
                   ZStack{
                    Image("\(self.activtiesItems.activityImage)").renderingMode(.original)
                       .resizable()
                       .opacity(0.8)
                       .aspectRatio(contentMode: .fill)
                       .background(Color.black)
                    
                    
                    if (self.selectedActivity.index == self.activtiesItems.id) {
                           Text("✓ \(self.activtiesItems.activityName)")
                                    .font(.system(size: 14, weight: .bold, design: Font.Design.default))
                                    .foregroundColor(Color.white)
                    } else {
                             Text(self.activtiesItems.activityName)
                                    .font(.system(size: 14, weight: .bold, design: Font.Design.default))
                                     .foregroundColor(Color.white)
                    }
                               
                   }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                   .cornerRadius(15)
               }
        }
    }
}

struct ShopNewProductViews: View {
    var activityResources: ActivityResource
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                VStack (alignment: .leading){
                    Text(self.activityResources.resourceName)
                        .padding(.top, 18)
                        .padding(.leading, 18)
                        .font(.system(size: 20, weight: .bold, design: Font.Design.default))
                        .foregroundColor(Color.black)
                    Text(self.activityResources.resourceDescription)
                        .padding(.leading, 18)
                        .padding(.trailing, 18)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                    
                        
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 10) {
                            
                            ForEach(self.activityResources.resources, id: \.id) { item in
                                ActivityResourceItems(resourceItems: item)
                                                    .frame(width: 150, height: 200)
                            }
                            
                        }.padding(.leading, 18)
                        .padding(.trailing, 18)
                            .padding(.top, 25)
                    }
                    
                     Spacer()
                }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .cornerRadius(10)
                
            }
        }
    }

struct ActivityResourceItems: View {
    var resourceItems: ActivityResourcesItem
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        GeometryReader { g in
            ZStack{
                Image("\(self.resourceItems.resourceImage)")
                .resizable()
                .opacity(0.8)
                .aspectRatio(contentMode: .fill)
                .background(Color.black)
                VStack(alignment: .center) {

                    Text(self.resourceItems.resourceName)
                        .font(.system(size: 16, weight: .bold, design: Font.Design.default))
                        .frame(width: 150)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                        
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(10)
        }
    }
}
