//
//  ContentView.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject public var userData = UserData()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Welcome")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)

                        
                    Image("koko main")
                        .resizable()
                        .cornerRadius(50)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        //.padding(.all)
                   
                    Spacer()
                    VStack {
                        NavigationLink(destination: QuestionsView(userData: userData)){
                            Text("Start")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
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
