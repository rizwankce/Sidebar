//
//  CanvasView.swift
//  SideBar
//
//  Created by Rizwan on 19/04/21.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @State var toolPicker = PKToolPicker()

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
        showToolPicker()
        #if targetEnvironment(simulator)
        canvasView.drawingPolicy = .anyInput
        #endif
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {

    }

    func showToolPicker() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
}
