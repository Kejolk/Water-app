//
//  question.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//
import SwiftUI

struct QuestionsView: View {
    @ObservedObject var userData: UserData
    @State private var weightInput: String = ""
    //@State private var navigateToSummary = false
   // @State var weight: Int = 0

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Name", text: $userData.name)
                TextField("Age", text: $userData.age)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Weight")) {
                TextField("Your weight", text: $weightInput)
                    .keyboardType(.numberPad)
               
            }
            NavigationStack{
               // NavigationView{
                    VStack{
                        Button(""){
                            if let number = Int(weightInput) {
                                userData.weight = number
                            } else {
                                userData.weight = 0
                            }
                        }
                        
                        
                        //                    Button(action: {
                        //                        if let weight = Int(weightInput) {
                        //                            userData.weight = weight
                        //                            navigateToSummary = true
                        //                        } else {
                        //                            userData.weight = 0
                        //                        }
                        //                    }) {
                        NavigationLink(destination: SummaryView(userData: userData)){
                            Text("Submit")
                                                        .frame(maxWidth: .infinity)
                                                        .padding()
                                                        .background(Color.green)
                                                        .foregroundColor(.white)
                                                        .cornerRadius(10)
                        }
                        
                        // }
                    }
                //}
            }
//            .background(
//                NavigationLink(
//                    destination: SummaryView(userData: userData),
//                    isActive: $navigateToSummary,
//                    label: { EmptyView() }
//                )
//                .hidden()
//                NavigationLink("Work Folder") {
//                    FolderDetail(id: workFolder.id)
//                }
//            NavigationLink {
//                FolderDetail(id: workFolder.id)
//            } label: {
//                Label("Work Folder", systemImage: "folder")
//            }
//            )
        }
//        .navigationTitle("Questions")
//        .onAppear {
//            weightInput = "\(userData.weight)"
        }
    }


struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(userData: UserData())
    }
}
