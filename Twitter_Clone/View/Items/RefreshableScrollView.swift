//
//  RefreshableScrollView.swift
//  Twitter_Clone
//
//  Created by Jinu on 04/07/2024.
//

import SwiftUI

struct RefreshableScrollView<Content: View>: UIViewRepresentable {
    var content: Content
    var onRefresh: (UIRefreshControl) -> ()
    var refreshControl = UIRefreshControl()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let uiScrollView = UIScrollView()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull Me")
        refreshControl.tintColor = UIColor(red: 0.114, green: 0.631, blue: 0.949, alpha: 1)
        refreshControl.addTarget(context.coordinator, action: #selector(context.coordinator.onRefresh), for: .valueChanged)
        setupView(uiScrollView: uiScrollView)
        uiScrollView.refreshControl = refreshControl
        
        return uiScrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        setupView(uiScrollView: uiView)
    }
    
    func setupView(uiScrollView: UIScrollView) {
        
        let hostView = UIHostingController(rootView: content.frame(maxHeight: .infinity,alignment: .top))
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: uiScrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: uiScrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: uiScrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: uiScrollView.trailingAnchor),
            
            hostView.view.widthAnchor.constraint(equalTo: uiScrollView.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: uiScrollView.heightAnchor,constant: 1)
        ]
        
        uiScrollView.subviews.last?.removeFromSuperview()
        uiScrollView.addSubview(hostView.view)
        uiScrollView.addConstraints(constraints)
    }
    
    class Coordinator: NSObject {
        var parent: RefreshableScrollView
        init(parent: RefreshableScrollView) {
            self.parent = parent
        }
        
        @objc func onRefresh() {
            parent.onRefresh(parent.refreshControl)
        }
    }
}
