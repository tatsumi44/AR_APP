//
//  ViewController.swift
//  AR_Object
//
//  Created by tatsumi kentaro on 2018/05/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
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
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
//        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "earth.jpg")
//        box.materials = [material]
//        let boxNode = SCNNode(geometry: box)
//        boxNode.position = SCNVector3(0,1,-1)

//        scene.rootNode.addChildNode(boxNode)
        // Set the scene to the view
        
        let sphere = SCNSphere(radius: 0.1)
        sphere.materials = [material]
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(0,0,-1)
        sphereNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 4)))
        scene.rootNode.addChildNode(sphereNode)
        
        let sphere1 = SCNSphere(radius: 0.05)
        let material1 = SCNMaterial()
        material1.diffuse.contents = UIImage(named: "moon.jpg")
        sphere1.materials = [material1]
        let sphere1Node = SCNNode(geometry: sphere1)
        sphere1Node.position = SCNVector3(0.01,0,-1)
        sphere1Node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 4)))
        sphereNode.addChildNode(sphere1Node)
        
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
