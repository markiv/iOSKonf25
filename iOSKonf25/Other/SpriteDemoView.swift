//
//  SpriteDemoView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 14.05.2025.
//

import SpriteKit
import SwiftUI

struct SpriteDemoView: View {
    let boxSize = CGSize(width: 60, height: 60)
    static let logoTexture = SKTexture(imageNamed: "ioskonf")
    let scene = SKScene()

    var body: some View {
        GeometryReader { proxy in
            SpriteView(scene: scene) // , debugOptions: [.showsFPS, .showsNodeCount])
                .ignoresSafeArea()
                .onAppear {
                    setupScene(frame: proxy.frame(in: .global))
                }
                .onTapGesture {
                    addSomeBoxes(in: proxy.size)
                }
        }
    }

    func setupScene(frame: CGRect) {
        scene.scaleMode = .resizeFill
        scene.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        scene.physicsWorld.speed = 0.5
        let label = SKLabelNode(text: "iOSKonf25")
        label.fontName = "SF"
        label.physicsBody = SKPhysicsBody(rectangleOf: label.frame.size)
        label.physicsBody?.affectedByGravity = false
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        scene.addChild(label)
    }

    func addSomeBoxes(in size: CGSize) {
        for _ in 0..<5 {
            scene.addChild(makeBox(in: size))
        }
    }

    func makeBox(in size: CGSize) -> SKSpriteNode {
        let box = SKSpriteNode(texture: Self.logoTexture, size: boxSize)
        box.physicsBody = SKPhysicsBody(texture: Self.logoTexture, alphaThreshold: 0.5, size: boxSize)
        box.physicsBody?.restitution = 0.5
        box.position = CGPoint(x: .random(in: 0...size.width), y: size.height)
        return box
    }
}

#Preview {
    SpriteDemoView()
}
