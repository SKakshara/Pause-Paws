import SwiftUI

struct BookingView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var notes = ""
    @State private var age = ""
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 20){
                Spacer()
                Spacer()
                HStack{
                    Image(systemName: "clock")
                    
                    Text("1 Hour")
                }
                HStack{
                    Image(systemName: "dog")
                    
                    Text("Spending Time With A Furry Companion!!!")
                }
                HStack{
                    Image(systemName: "calendar")
                    
                    Text("12:45PM - 1:45PM, Sunday, March 24th, 2024")
                }
            }
            .padding()
            Divider()
            VStack(alignment: .leading, spacing: 16){
                Text("Enter Details")
                    .font(.title)
                    .bold()
                Text("Name:")
                TextField("", text: $name) // Corrected TextField syntax
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                Text("E-mail:")
                TextField("", text: $email) // Corrected TextField syntax
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                
                Text("Age: ")
                TextField("", text: $age) // Corrected TextField syntax
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                
                
                Text("Please Share Anything Else:")
                TextField("", text: $notes) // Corrected TextField syntax
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke())
                    .multilineTextAlignment(.leading) // Align text to leading edge
                    .frame(minHeight: 100) // Set a minimum height for the TextField

                NavigationLink{
                    ConfirmationView()
                } label: {
                    Text("Schedule Event!!!")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.green))
                }

                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("Pause & Paws Session")
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
