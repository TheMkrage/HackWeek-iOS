//
//  ViewController.swift
//  ARKit-Demo
//
//  Created by Matthew Krager on 10/29/18.
//  Copyright © 2018 Matthew Krager. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // make shape of node
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        // make meterial
        let material = SCNMaterial()
        material.diffuse.contents = UIImage.init(named: "pokestop")
        
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(0.5, 0.0, 0)
        
        scene.rootNode.addChildNode(node)
        
        // TODO: Add more nodes!
        
        // Set the scene to the view
        self.sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
}
