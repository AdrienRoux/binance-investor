//
//  ContentView.swift
//  binance-investor
//
//  Created by Adri on 26/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userKey = UserDefaults.standard.string(forKey: "userKey") ?? ""
    @State private var userSecret = UserDefaults.standard.string(forKey: "userSecret") ?? ""

    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                if (userKey == "" || userSecret == ""){
                    NavigationLink("Enter Credentials", destination: ProfileView(userKey: $userKey, userSecret: $userSecret))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.yellow)
                        .cornerRadius(10.0)
                } else {
                    VStack(spacing: 30) {
                        Text("Logged in !")
                        Text("Api Key : " + UserDefaults.standard.string(forKey: "userKey")!)
                        Text("Api Secret : " + UserDefaults.standard.string(forKey: "userSecret")!)
                    }
                }
            }
            .multilineTextAlignment(.center)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: ProfileView(userKey: $userKey, userSecret: $userSecret)) {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .accessibilityLabel("User profile")
                        .padding()
                    
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
