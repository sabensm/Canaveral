//
//  ContentView.swift
//  Canaveral
//
//  Created by Mike Sabens on 3/4/20.
//  Copyright © 2020 Slip3 Studios. All rights reserved.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct ContentView: View {
    @State var missionName : String
    @State var missionTime : String
    @State var launchSite : String
    
    func loadData() {
        guard let url = URL(string: "https://api.spacexdata.com/v3/launches/next") else {
            print("Invald URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            //Handle results of networking task
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Launch.self, from: data) {
                    //We have good data, so go back to the main thread to update the UI
                    DispatchQueue.main.async {
                        self.missionName = decodedResponse.missionName
                        self.missionTime = decodedResponse.launchDateUtc
                        self.launchSite = decodedResponse.launchSite.siteName
                    }
                    //Everything is good if we get here, so we can safely exit
                    return
                }
            }
            //Failed
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image("RocketLaunch")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(Rectangle().opacity(0.65
                        ))
                    VStack {
                        VStack {
                            Text("Next Launch In")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("24 Days, 9 Hours, 32 Minutes")
                                .font(.title)
                                .foregroundColor(.white)
                        }.padding(.bottom, 20)
                        VStack {
                            Text("CRS-20")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("THIS IS A PLACEHOLDER - Real Data Fetch Coming Soon")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }
                .navigationBarTitle("Canaveral", displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = UIColor(red: 48 / 255, green: 49 / 255, blue: 52 / 255, alpha: 1.0)
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
            }
        .onAppear(perform: loadData)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(missionName: "Hi", missionTime: "Hi", launchSite: "Hi")
    }
}

