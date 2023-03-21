//
//  ViewController.swift
//  FKContest_7
//
//  Created by Arthur Narimanov on 3/20/23.
//

import UIKit

class ViewController: UIViewController {

    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .systemGray
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle = .white
        return scroll
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "1_table"))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.maxY - view.safeAreaInsets.top
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 1000)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        var width = view.frame.width + y * 2
        width = max(width, view.frame.width)
        imageView.frame = CGRect(x: min(0, -y), y: min(0, -y), width: width, height: width)
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.maxY - view.safeAreaInsets.top + y
    }
}

