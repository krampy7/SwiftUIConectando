import SwiftUI

// Estructura de la NavBar
struct TabbarView: View {
    
    @State private var selectionIndex = 1
    @EnvironmentObject var settings: UserSettings
    
    
    var body: some View {
        
        let accentColor = Color(
                    UIColor {
                        $0.userInterfaceStyle == .dark ? .white : .black
                    }
                )
        
        TabView(selection: $selectionIndex) {
            
            // INFORMACION VISTA
            // Se crea una navigationView que se divide en 3 partes
            NavigationView {
                ActivitiesContentView(activtiesData: Activities(data: ActivitiesMockStore.activityData, items: ActivitiesMockStore.activities))
            }
            // Cada apartado posee una imagen del sistema asi como su propio texto
            .tag(0)
            .tabItem {
                //Image("activity-1")
                Image(systemName: "book")
                    .resizable()
                Text("Información")
            }
            
            // URGENTE VISTA
            NavigationView {
                ActivitiesCartView(ShoppingCartItemsData: ActivitiesCart(data: ActivitiesMockStore.shoppingCartData))
            }
            .tag(1)
            .tabItem {
                Image(systemName: "exclamationmark.bubble")
                Text("Urgente")
            }
            
            
            // COMUNICACION VISTA
            NavigationView {
                AccountView()
            }
            .tag(2)
            .tabItem {
                //Image("profile-glyph-icon")
                Image(systemName: "mic")
                Text("Dilo!")
            }
        }
        .onAppear {
            selectionIndex = 1
        }
        .accentColor(accentColor)
    }
    
    
}
