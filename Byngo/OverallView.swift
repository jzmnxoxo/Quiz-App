import SwiftUI

struct OverallData {
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat
    var category : String
    
}

class OverallDataContainer : ObservableObject {
    @Published var overallData =
        [OverallData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: 7, value: 0, category: "Chinese"),
         OverallData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 18, value: 0, category: "Biology"),
         OverallData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 22, value: 0, category: "English"),
         OverallData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 53, value: 0, category: "Maths")]
    
    func calc(){
        var value : CGFloat = 0
        
        for i in 0..<overallData.count {
            value += overallData[i].percent
            overallData[i].value = value
        }
    }
}

struct DonutChart : View {
    @ObservedObject var overallDataObj = OverallDataContainer()
    @State var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<overallDataObj.overallData.count) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : overallDataObj.overallData[index-1].value/100,
                              to: overallDataObj.overallData[index].value/100)
                        .stroke(overallDataObj.overallData[index].color,lineWidth: 50)
                        .onTapGesture {
                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                        }
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        .animation(.spring())
                }
                if indexOfTappedSlice != -1 {
//                    Text(overallDataObj.overallData[indexOfTappedSlice].category)
                    Text(String(format: "%.2f", Double(overallDataObj.overallData[indexOfTappedSlice].percent))+"%")
                        .font(.title)
                        .bold()
                }
            }
            .frame(width: 200, height: 250)
            .padding()
            .onAppear() {
                self.overallDataObj.calc()
            }
            ForEach(0..<overallDataObj.overallData.count) { index in
                           HStack {
                               Text(overallDataObj.overallData[index].category)
//                               Text(String(format: "%.2f", Double(overallDataObj.overallData[index].percent))+"%")
                                   .onTapGesture {
                                       indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                                   }
                                   .font(indexOfTappedSlice == index ? .headline : .subheadline)
                               RoundedRectangle(cornerRadius: 8)
                                   .fill(overallDataObj.overallData[index].color)
                                   .frame(width: 15, height: 15)
                           }
                       }
                       .padding(8)
                       .frame(width: 300, alignment: .trailing)
            

        }
    }
}



struct OverallView: View {
    var body: some View {
        DonutChart()
    }
}

struct OverallView_Previews: PreviewProvider {
    static var previews: some View {
        OverallView()
    }
}
