import SwiftUI

struct ContentView: View {
    var body: some View {
        SwiftUI.Text(Text.hello_world.string)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
