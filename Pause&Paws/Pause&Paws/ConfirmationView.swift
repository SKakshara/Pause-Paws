//
//  ConfirmationView.swift
//  Pause&Paws
//
//  Created by Akshara Kollu on 3/24/24.
//

import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        VStack {
            Image("dog") // Corrected Image capitalization
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Confirmed")
                .font(.title)
                .bold()
                .padding()
            
            Text("You Have Scheduled A Meeting with the Puppy!")
            
            Divider()
                .padding()
            
            VStack(alignment: .leading, spacing: 32){
                HStack {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.brown)
                    
                    Text("Pause and Paws Session!!") // Corrected colon placement
                }
                
                HStack{
                    Image(systemName: "map")
                    
                    Text("Rutgers-NB")
                }
                
                HStack{
                    Image(systemName: "calendar")
                    
                    Text("12:45PM - 1:45PM, Sunday, March 24th, 2024")
                }
            }
           
            Spacer()
            Button{
                
            } label: {
                Text("Done")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                    }
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)

    }
}

#Preview {
    NavigationStack{
        ConfirmationView()
    }
}
