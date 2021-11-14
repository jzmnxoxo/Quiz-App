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
        [OverallData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: 8, value: 0, category: "Chinese"),
         OverallData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 15, value: 0, category: "Biology"),
         OverallData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 32, value: 0, category: "English"),
         OverallData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 45, value: 0, category: "Maths")]
    
    //    init() {
    //        calc()
    //    }
    func calc(){
        var value : CGFloat = 0
        
        for i in 0..<overallData.count {
            value += overallData[i].percent
            overallData[i].value = value
        }
    }
}

struct PieOverall : View {
    @ObservedObject var charDataObj = OverallDataContainer()
    @State var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            //MARK:- Pie Slices
            ZStack {
                ForEach(0..<charDataObj.overallData.count) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : charDataObj.overallData[index-1].value/100,
                              to: charDataObj.overallData[index].value/100)
                        .stroke(charDataObj.overallData[index].color,lineWidth: 100)
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        .animation(.spring())
                }
            }.frame(width: 100, height: 200)
            .onAppear() {
                self.charDataObj.calc()
            }
            
            ForEach(0..<charDataObj.overallData.count) { index in
                           HStack {
                               Text((charDataObj.overallData[index].category)+" "+String(format: "%.2f", Double(charDataObj.overallData[index].percent))+"%")
                                   .onTapGesture {
                                       indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                                   }
                                   .font(indexOfTappedSlice == index ? .headline : .subheadline)
                               RoundedRectangle(cornerRadius: 3)
                                   .fill(charDataObj.overallData[index].color)
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
        PieOverall()
    }
}

struct OverallView_Previews: PreviewProvider {
    static var previews: some View {
        OverallView()
    }
}
