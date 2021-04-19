//
//  ScratchPadView.swift
//  SideBar
//
//  Created by Rizwan on 19/04/21.
//

import SwiftUI
import PencilKit

struct ScratchPadView: View {
    @State private var canvasView = PKCanvasView()
    @Environment(\.undoManager) private var undoManager
    
    var body: some View {
        ZStack {
            CanvasView(canvasView: $canvasView)
                .padding(20.0)
                .background(Color.gray)
                .navigationBarTitle(Text("ScratchPad"), displayMode: .inline)
        }
        .navigationBarItems(
            trailing: HStack {
                Button(action: undo) {
                    Image(systemName: "arrow.uturn.right")
                }
                Button(action: redo) {
                    Image(systemName: "arrow.uturn.left")
                }
                Button(action: clear) {
                    Image(systemName: "trash")
                }
            })
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitleDisplayMode(.large)
    }
    
    func clear() {
        canvasView.drawing = PKDrawing()
    }
    
    func undo() {
        undoManager?.undo()
    }
    
    func redo() {
        undoManager?.redo()
    }
}

struct ScratchPadView_Previews: PreviewProvider {
    static var previews: some View {
        ScratchPadView()
    }
}
