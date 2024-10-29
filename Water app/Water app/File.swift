//
//  File.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//
import SwiftUI
import UserNotifications

struct SummaryView: View {
    @ObservedObject var userData: UserData
    @State private var remindToDrinkWater = false
    @State private var redirectToMainView = false
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Summary")
                .font(.largeTitle)
                .padding()

            Text("Name: \(userData.name)")
            Text("Age: \(userData.age)")
            Text("Weight: \(userData.weight) lbs")
            Text("Recommended Water Intake: \(String(format: "%.2f", userData.waterIntake)) ounces/day")
            Text("Would you like this app to send you reminders to drink water?")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            HStack {
                Button(action: {
                    checkNotificationAuthorization()
                }) {
                    Text("Yes")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    remindToDrinkWater = false
                    clearNotifications()
                    redirectToMainView = true
                }) {
                    Text("No")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            NavigationLink(destination:ContentView(userData: userData)){
                Text("Go back to home")
                    .font(.title)
                
            }
            


        }
        .padding()
        .navigationTitle("Summary")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Notifications Disabled"),
                message: Text("Please enable notifications in settings to receive water reminders."),
                primaryButton: .default(Text("Settings")) {
                    openSettings()
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func checkNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .authorized {
                    self.remindToDrinkWater = true
                    self.scheduleNotifications()
                    self.redirectToMainView = true
                } else {
                    self.showAlert = true
                }
            }
        }
    }

    private func scheduleNotifications() {
        let center = UNUserNotificationCenter.current()
        
        // Define the notification content
        let content = UNMutableNotificationContent()
        content.title = "クオッカワラビー "
        content.body = "水を飲め!/ Drink Water!"
        content.sound = UNNotificationSound.default
        
        // Schedule notifications at 9 am, 1 pm, 6 pm, and 9 pm
        let notificationTimes: [Int] = [8, 11, 14, 17, 20] // 9 am, 1 pm, 6 pm, 9 pm
        
        for hour in notificationTimes {
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
    }

    private func clearNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }

    private func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { success in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(userData: UserData())
    }
}
