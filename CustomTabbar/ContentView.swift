//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Kevin Baldha on 01/04/21.
//

import SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "house", title: "Home", color: .yellow),
    BottomBarItem(icon: "paperplane", title: "Message", color: .pink),
    BottomBarItem(icon: "tag", title: "Store", color: .green),
    BottomBarItem(icon: "person", title: "Profile", color: .blue)
]

struct BasicView: View {
    let item: BottomBarItem
    var detailText: String {
        "\(item.title) Detail"
    }
    
    var destination: some View {
        Text(detailText)
            .navigationBarTitle(Text(detailText))
    }
    
    var navigateButton: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Rectangle()
                    .fill(item.color)
                    .cornerRadius(8)
                    .frame(height: 52)
                    .padding(.horizontal)
                
                Text("Navigate")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
    
    func openTwitter() {
        guard let url = URL(string: "") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
        }
    }
}


struct ContentView: View {
    @State private var selectedIndex: Int = 0
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                //change the navbar color
                Rectangle()
                    .foregroundColor(selectedItem.color)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
                    .navigationBarHidden(false)
                
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}
