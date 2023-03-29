//
//  TutorialView.swift
//  SwiftUIStarterKitApp
//
//  Created by Adrian Cano on 28/03/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack {
                    Text("¿Eres sensisble a colores más allá de la escala de grises?")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center)
                                .padding(.bottom, 20)
                    
                    HStack(spacing: 20) {
                        
                        
                        Button("Sí") {
                            print(self.settings.grayColor)
                            self.settings.grayColor = true
                            print(self.settings.grayColor)
                            readyStart()
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.gray)
                                    .cornerRadius(10)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(minWidth: 120)
                                    .cornerRadius(10)
                        Button("No") {
                            readyStart()
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(colorScheme == .dark ? Color.white.opacity(0.2) : Color.black)
                                    .cornerRadius(10)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(minWidth: 120)
                    }
                }
                .padding()
    }
    
    func readyStart() {
            let tabbarView = TabbarView()
            let hostingController = UIHostingController(rootView: tabbarView.environmentObject(settings))
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = hostingController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}


