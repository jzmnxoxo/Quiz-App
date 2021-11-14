import SwiftUI

struct ByCatData {
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat
    var category : String
    
}

class ByCatDataContainer : ObservableObject {
    @Published var byCatData =
        [ByCatData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: 8, value: 0),
         ByCatData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 15, value: 0),
         ByCatData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 32, value: 0),
         ByCatData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 45, value: 0)]
    
    //    init() {
    //        calc()
    //    }
    func calc(){
        var value : CGFloat = 0
        
        for i in 0..<byCatData.count {
            value += byCatData[i].percent
            byCatData[i].value = value
        }
    }
}

struct DonutChart : View {
    @ObservedObject var byCatDataObj = ByCatDataContainer()
    @State var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<byCatDataObj.byCatData.count) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : byCatDataObj.byCatData[index-1].value/100,
                              to: byCatDataObj.byCatData[index].value/100)
                        .stroke(byCatDataObj.byCatData[index].color,lineWidth: 50)
                        .onTapGesture {
                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                        }
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        .animation(.spring())
                }
                if indexOfTappedSlice != -1 {
                    Text(String(format: "%.2f", Double(byCatDataObj.byCatData[indexOfTappedSlice].percent))+"%")
                        .font(.title)
                }
            }
            .frame(width: 200, height: 250)
            .padding()
            .onAppear() {
                self.byCatDataObj.calc()
            }
            ForEach(0..<byCatDataObj.byCatData.count) { index in
                           HStack {
                               Text(String(format: "%.2f", Double(byCatDataObj.byCatData[index].percent))+"%")
                                   .onTapGesture {
                                       indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                                   }
                                   .font(indexOfTappedSlice == index ? .headline : .subheadline)
                               RoundedRectangle(cornerRadius: 8)
                                   .fill(byCatDataObj.byCatData[index].color)
                                   .frame(width: 15, height: 15)
                           }
                       }
                       .padding(8)
                       .frame(width: 300, alignment: .trailing)

        }
    }
}

struct ByCategoryView: View {
    var body: some View {
        ScrollView{
            VStack{
                DonutChart()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ByCategoryView()
    }
}
