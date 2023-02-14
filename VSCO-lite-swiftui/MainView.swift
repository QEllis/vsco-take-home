import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            NavigationLink(destination: EmptyView()) {
            }
            .navigationTitle("VSCO Lite")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
