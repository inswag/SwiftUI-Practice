//
//  PageViewController.swift
//  Landmarks
//
//  Created by Insu Park on 2023/06/08.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {

    var pages: [Page]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        return pageViewController
    }
    
    // @Required UIViewControllerRepresentable
//    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
//        pageViewController.setViewControllers(
//                    [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
//    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        uiViewController.setVi
        guard let pageViewController = uiViewController as? UIPageViewController else { return }
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
        
    }
    
    
}
