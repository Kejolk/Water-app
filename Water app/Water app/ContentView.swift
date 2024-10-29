//
//  ContentView.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @StateObject public var userData = UserData()
    var body: some View {
        NavigationStack{
            ZStack{
                let navy = Color(red: 0, green: 0.1, blue: 0.4)
                navy
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    let ivory = Color(red: 1, green: 1, blue: 1)
                    Text("Welcome to 水")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(ivory)

                        
                    Image("koko main")
                        .resizable()
                        .cornerRadius(50)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .padding(.top, 30)
                        
                        //.padding(.all)
                   
                    Spacer()
                    VStack {
                        NavigationLink(destination: QuestionsView(userData: userData)){
                            Text("Start")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(width: 100, height: 100)
                                .background(Color(red: 0.1, green: 0.1, blue: 0.4))
                                .foregroundColor(ivory)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                                
                            
                            
                            
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.semibold)
//                                .padding(.vertical, 15)
//                                .padding(.horizontal, 40)
//                                .background (
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [Color.blue, Color.purple, Color.blue]),
//                                        startPoint: .leading,
//                                        endPoint: .trailing
//
//
//                                    )
//                                )
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
                        }
//                                    NavigationLink("Start", value: Route.questions)
//                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
//                                        .padding()
//                                        .background(Color.blue)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
                                }
//                    .navigationDestination(for: Route.self) { route in
//                        switch route {
//                        case .questions:
//                            QuestionsView(userData: userData)
//                        case .summary:
//                            SummaryView(userData: userData)
//                        }
//                    }
                                
                    
                    Spacer()
                    Spacer()
                    
                    
                }
                
            }
            
                        
        }
        
        
    }
        
    }

//enum Route: Hashable {
//    case questions
//    case summary
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
