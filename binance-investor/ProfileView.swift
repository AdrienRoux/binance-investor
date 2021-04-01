//
//  ProfileView.swift
//  binance-investor
//
//  Created by Adri on 30/03/2021.
//

import SwiftUI


struct ProfileView: View {
    
    @Binding var userKey: String
    @Binding var userSecret: String
    
    @State var typing = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            if (userKey == "" || typing){
                HStack {
                    Text("Api Secret : ")
                    TextField("Api Key", text: $userKey, onEditingChanged: {
                        self.typing = $0
                    }, onCommit: {
                        UserDefaults.standard.setValue(userKey, forKey: "userKey")
                        UserDefaults.standard.setValue(userSecret, forKey: "userKey")
                    })
                    .disableAutocorrection(true)
                }
            } else {
                HStack {
                    Text("Api Key : ")
                    Spacer()
                    Text(userKey)
                    Spacer()
                }
            }
            
            
            
            if (userSecret == "" || typing){
                HStack{
                    Text("Api Secret : ")
                    TextField("Api Secret", text: $userSecret, onEditingChanged: {
                        self.typing = $0
                    }, onCommit: {
                        UserDefaults.standard.setValue(userKey, forKey: "userKey")
                        UserDefaults.standard.setValue(userSecret, forKey: "userSecret")
                    })
                    .disableAutocorrection(true)
                }
            } else {
                HStack {
                    Text("Api Secret : ")
                    Spacer()
                    Text(userSecret)
                    Spacer()
                }
            }
            
            if (!typing || (userKey == "" || userSecret == "")){
                Button(action: {
                    typing = true
                }, label: {
                    Text("Change")
                })
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .border(Color.white, width: 5)
                .cornerRadius(10.0)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .navigationBarTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userKey: Binding<String>.constant("TEST_afffbzyufbeyudsfnuigdshfioqhniugsdhfbifqiugdiqsfdobfgi"), userSecret: Binding<String>.constant("TEST_oifeiubdsigboqgçusbghuqiysvbfh!dguiyfhpueiqdugiHQDS"))
            .preferredColorScheme(.dark)
    }
}
