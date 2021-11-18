import SwiftUI

struct ByCategoryView: View {
    var body: some View {
        Text("By Category")
    }
}




struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ByCategoryView()
            .environmentObject(ModelDataByCat())
    }
}
