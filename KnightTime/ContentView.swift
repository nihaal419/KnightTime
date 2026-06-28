//
//  ContentView.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            ScrollView {
                Text("Schedule")
                
                Text("This Week")
                    .font(.caption)
                
                HStack {
                    VStack {
                        Text("Monday")
                        Text("Full Day 1")
                    }
                    
                    Spacer()
                    
                    Text("12")
                }
            }
        } detail: {
            ScrollView {
                HStack {
                    VStack {
                        Text("Monday")
                            .font(.title)
                        Text("June 29 - Full Day - Group A")
                    }
                }
            }
            .navigationTitle("Test")
        }

        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
