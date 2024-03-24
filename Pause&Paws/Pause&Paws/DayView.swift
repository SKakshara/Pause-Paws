//
//  DayView.swift
//  Pause&Paws
//
//  Created by Akshara Kollu on 3/24/24.
//

import SwiftUI

struct DayView: View {
    
    @State var date = [ Date(),
        Calendar.current.date(byAdding: .hour, value: 1, to: Date())!,
              Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                         Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                                     Calendar.current.date(byAdding: .hour, value: 4, to: Date())]
    @State var selectedDate: Date?
    
    var currentDate:Date
    
    var body: some View {
        ScrollView{
            VStack{
                Text("March 24th 2024")
                Divider()
                    .padding(.vertical)
                Text("Select A Time")
                    .font(.largeTitle)
                    .bold()
                    
                Text("Duration: 1 Hour")
                
                
                ForEach(date, id: \.self) { date in
                    HStack{
                        if let unwrappedDate = date {
                            Button(action: {
                                // Action for the button
                                withAnimation{
                                    selectedDate = date
                                }
                            }) {
                                Text(unwrappedDate.timeFromDate())
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(selectedDate==date ? .white: .black)
                                    .background{
                                        ZStack{
                                            if(selectedDate==date){
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.green)
                                            } else{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke()
                                            }
                                        }
                                    }
                            }
                            
                            if(selectedDate==date){
                                NavigationLink{
                                   BookingView()
                                } label: {
                                    Text("Next")
                                        .bold()
                                        .padding()
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .background{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.brown)
                                        }
                                }
                            }
                    }
                        
                    }
                   
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .principal) { // Align the navigation title to the center
                Text("Sunday").font(.headline)
            }
        }
    }
}

struct DayView_Preview: PreviewProvider {
    static var previews: some View{
        NavigationStack{
            DayView(currentDate: Date())
        }
    }
}
 
