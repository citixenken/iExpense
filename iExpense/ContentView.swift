//
//  ContentView.swift
//  iExpense
//
//  Created by Ken Muyesu on 26/12/2021.
//

import SwiftUI

//allows data to be shared across multiple views
class User: ObservableObject {
    @Published var firstName = "eliud"
    @Published var lastName = "kipchoge"
}

struct secondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    
    @State private var showingSheet = false
    //@StateObject var user = User()
    
    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            TextField("First Name", text: $user.firstName)
//            TextField("Last Name", text: $user.lastName)
//
//        }
        
        Button ("Show sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            secondView(name: "@citixenken")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
