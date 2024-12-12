import SwiftUI

struct DataSellbackView: View {
    @ObservedObject var interactionModel: InteractionModel
    @State private var pointsEarned: Int = 0

    var body: some View {
        VStack {
            Text("Sell Your Data")
                .font(.largeTitle)
                .padding()
            
            List {
                Section(header: Text("Your Demographic Data").font(.headline)) {
                    HStack {
                        Text("Likes")
                        Spacer()
                        Text("\(interactionModel.likes)")
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        Text("Shares")
                        Spacer()
                        Text("\(interactionModel.shares)")
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        Text("Follows")
                        Spacer()
                        Text("\(interactionModel.follows)")
                            .foregroundColor(.blue)
                    }
                }
                
                Section {
                    Button(action: sellData) {
                        Text("Sell Data")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
        .padding()
    }

    private func sellData() {
        // Here you can implement logic for selling data
        print("Data sold for \(pointsEarned) points!")
    }
}

struct DataSellbackView_Previews: PreviewProvider {
    static var previews: some View {
        DataSellbackView(interactionModel: InteractionModel())
    }
}
