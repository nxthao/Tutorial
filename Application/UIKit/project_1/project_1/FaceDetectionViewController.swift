//
//  ViewController.swift
//  project_1
//
//  Created by Thao Nguyen on 19/02/2021.
//

import UIKit
import Vision
import AVFoundation

class FaceDetectionViewController: UIViewController {

    // MARK: - Outlet properties
    @IBOutlet var faceView: FaceView!
    
    var maxX: CGFloat = 0.0
    var midY: CGFloat = 0.0
    var maxY: CGFloat = 0.0
    
    // MARK: - Properties
    // Create request handler to take a serial image.
    var sequenceHandler = VNSequenceRequestHandler()
    
    // Create a object to manage the capture activity from input device to capture output.
    let session = AVCaptureSession()
    // Create a object to display the video when it is captured(quay)
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    // This object is to manage the excution of concurrent (đồng thời) tasks on main thread.
    let dataOutputQueue = DispatchQueue(label: "Video data queue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCaptureSession()
    
        maxX = view.bounds.maxX
        midY = view.bounds.midY
        maxY = view.bounds.maxY
        
        session.startRunning()
        
        
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - Video Processing methods
extension FaceDetectionViewController{
    func configureCaptureSession(){
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            fatalError("No front video camera available")
        }
        
        // Connect the camera to the capture session input
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            session.addInput(cameraInput)
            
        } catch {
            fatalError(error.localizedDescription)
        }
        
        // Create the video data output
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        // Add the video output to the capture session
        session.addOutput(videoOutput)
        
        let videoConnection = videoOutput.connection(with: .video)
        videoConnection?.videoOrientation = .portrait
        
        // Configure the preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
extension FaceDetectionViewController : AVCaptureVideoDataOutputSampleBufferDelegate{
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        let detectFaceRequest = VNDetectFaceLandmarksRequest(completionHandler: detectedFace)
        
        do {
            try sequenceHandler.perform([detectFaceRequest], on: imageBuffer, orientation: .leftMirrored)
        } catch{
            print(error.localizedDescription)
        }
    }
}

extension FaceDetectionViewController {
    func convert(rect: CGRect) -> CGRect{
        // convert a normalized origin to the preview layer’s coordinate system
        let origin = previewLayer.layerPointConverted(fromCaptureDevicePoint: rect.origin)
        
        // convert the normalized size to the preview layer’s coordinate system
        let size = previewLayer.layerPointConverted(fromCaptureDevicePoint: rect.size.cgPoint)
        
        // Create a CGRect using the new origin and size
        // CGRect: A structure that contains the location and dimensions of a rectangle
        return CGRect(origin: origin, size: size.cgSize)
    }

    func detectedFace(request: VNRequest, error: Error?){
        guard
            let results = request.results as? [VNFaceObservation],
            let result = results.first else {
            faceView.clear()
            return
        }
        let box = result.boundingBox
        faceView.boundingBox = convert(rect: box)
        
        DispatchQueue.main.async {
            self.faceView.setNeedsDisplay()
        }
    }
    
}

