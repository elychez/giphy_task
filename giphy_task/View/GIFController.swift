//
//  GIFController.swift
//  giphy_task
//
//  Created by Elcins on 11/01/2023.
//

import SwiftUI
import GiphyUISDK

struct GIFController : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return GIFController.Coordinator(parent: self)
    }
    
    
    @Binding var url : String
    @Binding var present : Bool
    func makeUIViewController(context: Context) -> GiphyViewController {
        
        Giphy.configure(apiKey: "jSAZJugbkKnsrXokJAEYMg6sGvZtrrjS")
        let controller = GiphyViewController()
        // Anything You need...
        controller.mediaTypeConfig = [.emoji,.gifs,.stickers]
        controller.delegate = context.coordinator
        // for full screen...
        GiphyViewController.trayHeightMultiplier = 1.05
        controller.theme = GPHTheme(type: .light)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject,GiphyDelegate{
        func didDismiss(controller: GiphyUISDK.GiphyViewController?) {
            
        }
        
        
        var parent : GIFController
        
        init(parent:GIFController) {
            self.parent = parent
        }
        
        func didMismiss(controller: GiphyViewController?){
            
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            
            // retreving url...
            let url = media.url(rendition: .fixedWidth, fileType: .gif)
            parent.url = url ?? ""
            parent.present.toggle()
        }
    }
}
