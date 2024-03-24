import SwiftUI
//  ContentView.swift
//  Pause&Paws
//
//  Created by Akshara Kollu on 3/24/24.
//

struct ContentView: View {
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State var selectedMonth = 0
    @State var selectedDate = Date()
    var body: some View {
        NavigationStack{
            VStack {
                Image("dog") // Use the image named "dog" from your assets
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
                Text("Pause & Paws")
                    .font(.title)
                    .bold()
                Rectangle()
                    .frame(height: 1)
                    .bold()
                VStack(spacing:20){
                    Text("Select a Day!")
                        .font(.title2)
                        .bold()
                    HStack{
                        Spacer()
                        Button{
                            withAnimation {
                                selectedMonth -= 1
                            }
                        } label:{
                            Image(systemName: "lessthan.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 22)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(selectedDate.monthAndYear())
                            .font(.title2)
                        Spacer()
                        Button{
                            withAnimation {
                                selectedMonth += 1
                            }
                        } label:{
                            Image(systemName: "greaterthan.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 22)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    
                    HStack{
                        ForEach(days, id:\.self){day in Text(day)
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                        ForEach(fetchDates()) { value in
                            NavigationLink(destination: DayView(currentDate: value.date)) {
                                ZStack {
                                    if value.day != -1 {
                                        Text("\(value.day)")
                                            .foregroundColor(value.day % 2 != 0 ? .green : .black)
                                            .fontWeight(value.day % 2 != 0 ? .bold : .none)
                                            .background(
                                                ZStack(alignment:.bottom) {
                                                    Circle()
                                                        .frame(width: 48, height: 48)
                                                        .foregroundColor(value.day % 2 != 0 ? .green.opacity(0.1) : .clear)
                                                    if Calendar.current.isDate(value.date, inSameDayAs: Date()) {
                                                        Circle()
                                                            .frame(width:8, height:8)
                                                            .foregroundColor(value.day % 2 != 0 ? .green : .gray)
                                                    }
                                                }
                                            )
                                    } else {
                                        Text("")
                                    }
                                }
                                .frame(width: 32, height: 32)
                                .disabled(value.day % 2 == 0) // Disable NavigationLink if the day is even
                            }
                        }
                    }

                }
                .padding()
            }
        }
        .frame(maxHeight:.infinity,alignment: .top)
            .onChange(of: selectedMonth) { _ in
                selectedDate = fetchSelectedMonth()
            }
        }
    
    func fetchDates() -> [CalendarDate]{
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        
        var dates = currentMonth.datesOfMonth().map({CalendarDate(day:calendar.component(.day, from:$0), date: $0)})
        
        let firstDayOfWeek = calendar.component(.weekday, from:dates.first?.date ?? Date())
        
        for _ in 0..<firstDayOfWeek - 1 {
            dates.insert(CalendarDate(day:-1, date:Date()), at: 0)
        }
        return dates
    }
    func fetchSelectedMonth() -> Date{
        let calendar = Calendar.current
        let month = calendar.date(byAdding: .month, value: selectedMonth, to:Date())
        return month!
    }
}

struct CalendarDate: Identifiable{
    let id=UUID()
    let day: Int
    var date: Date
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

