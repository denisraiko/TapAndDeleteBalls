//
//  ViewController.swift
//  TapAndDeleteBalls
//
//  Created by Denis Raiko on 31.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let side = 50
    private var balls = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        recognizer()
    }
    
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        let tap = sender.location(in: view)
        createBall(location: tap)
    }
    
    private func createBall(location: CGPoint) {
        let ball = UIView()
        ball.frame = CGRect(x: Int(location.x) - side / 2, y: Int(location.y) - side / 2, width: side, height: side)
        ball.layer.cornerRadius = ball.frame.width / 2
        ball.backgroundColor = .magenta
        view.addSubview(ball)
        
        for existingBalls in balls {
            if ball.frame.intersects(existingBalls.frame) {
                existingBalls.removeFromSuperview()
                balls.removeAll(where: {$0 == existingBalls})
            }
        }
        balls.append(ball)
        view.addSubview(ball)
    }
    
    private func recognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
}
