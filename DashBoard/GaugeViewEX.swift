//
//  GaugeView.swift
//  DashBoard
//
//  Created by ChungTran on 10/4/17.
//  Copyright © 2017 ChungTran. All rights reserved.
//

//import UIKit
//
////TODO: Comment public methods
//
//@IBDesignable class GaugeView: UIView {
//    
//    // MARK: Layers
//    
//    let leftBackgroundLayer: CAShapeLayer! = CAShapeLayer()
//    
//    let rightBackgroundLayer: CAShapeLayer! = CAShapeLayer()
//    
//    let needleLayer: CAShapeLayer! = CAShapeLayer()
//    
//    // MARK: Public vars
//    
//    @IBInspectable var needleColor: UIColor = UIColor.white {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    @IBInspectable var gaugeBackgroundColor: UIColor = UIColor.red {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    var lightBackgroundColor: UIColor {
//        var r: CGFloat = 0
//        var g: CGFloat = 0
//        var b: CGFloat = 0
//        var a: CGFloat = 0
//        gaugeBackgroundColor.getRed(&r, green: &g, blue: &b, alpha: &a)
//        return UIColor(red: r, green: g, blue: b, alpha: a/2.0)
//    }
//    
//    @IBInspectable var levelsNumber: Int = 4 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    @IBInspectable var currentLevel: Int = 1 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    var delegate: GaugeViewDelegate?
//    
//    // MARK: Private vars
//    fileprivate var startAngle: Float = Float(Double.pi*1.1)
//    
//    fileprivate var endAngle: Float = Float(Double.pi*1.9)
//    
//    fileprivate var bgRadius: Float = 0
//    
//    fileprivate var currentAngle: Float = 0 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//    
//    fileprivate var scale: Int = 0
//    
//    // MARK: Init
//    
//    required override public init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setup()
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setup()
//    }
//    
//    fileprivate func setup() {
//        self.layer.addSublayer(self.leftBackgroundLayer)
//        self.layer.addSublayer(self.rightBackgroundLayer)
//        self.layer.addSublayer(self.needleLayer)
//        
//        self.layer.contentsGravity = kCAGravityCenter
//        self.isOpaque = false
//        self.contentMode = UIViewContentMode.redraw
//        
//        let handlePanSelector: Selector = #selector(GaugeView.handlePan(_:))
//        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: handlePanSelector))
//    }
//    
//    // MARK: Drawing
//    
//    override func draw(_ rect: CGRect) {
//        drawBg()
//        drawNeedle()
//    }
//    
//    fileprivate func drawBg() {
//        currentAngle = (endAngle - startAngle) / Float(levelsNumber) * Float(currentLevel) + startAngle
//        let viewCenter = CGPoint(x: self.bounds.origin.x+self.bounds.width/2, y: self.bounds.origin.y+self.bounds.height/2)
//        
//        if (currentAngle > startAngle) {
//            let backgroundPathLeft = UIBezierPath()
//            backgroundPathLeft.move(to: viewCenter)
//            backgroundPathLeft.addArc(withCenter: viewCenter, radius: CGFloat(bounds.width/2), startAngle: CGFloat(startAngle), endAngle: CGFloat(currentAngle), clockwise: true)
//            leftBackgroundLayer.fillColor = gaugeBackgroundColor.cgColor
//            leftBackgroundLayer.strokeColor = UIColor.black.cgColor
//            leftBackgroundLayer.path = backgroundPathLeft.cgPath
//            //            leftBackgroundLayer.filters
//        }
//        
//        let backgroundPathRight = UIBezierPath()
//        backgroundPathRight.move(to: viewCenter)
//        backgroundPathRight.addArc(withCenter: viewCenter, radius: CGFloat(bounds.width/2), startAngle: CGFloat(currentAngle), endAngle: CGFloat(endAngle), clockwise: true)
//        rightBackgroundLayer.fillColor = lightBackgroundColor.cgColor
//        rightBackgroundLayer.strokeColor = UIColor.black.cgColor
//        rightBackgroundLayer.path = backgroundPathRight.cgPath
//        
//        //        let maskLayer: CAShapeLayer = CAShapeLayer()
//        //        let maskPath = UIBezierPath()
//        //        maskPath.moveToPoint(viewCenter)
//        //        maskPath.addArcWithCenter(viewCenter, radius: CGFloat(bounds.width/2 * 0.7), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
//        //        maskLayer.fillColor = UIColor.clearColor().CGColor
//        //        maskLayer.path = maskPath.CGPath
//        //        leftBackgroundLayer.mask = maskLayer
//    }
//    
//    fileprivate func drawNeedle() {
//        let viewCenter = CGPoint(x: self.bounds.origin.x+self.bounds.width/2, y: self.bounds.origin.y+self.bounds.height/2)
//        let needleRadius = CGFloat(bounds.width/2 * 0.2)
//        let topPoint: CGPoint = CGPoint(x: viewCenter.x, y: viewCenter.y - bounds.height/2)
//        let startPoint: CGPoint = CGPoint(x: viewCenter.x + needleRadius, y: viewCenter.y)
//        
////        let distance: CGFloat = CGFloat(bgRadius * 1.1)
////        let starttime: CGFloat = 0.0
////        let endtime: CGFloat = CGFloat(Double.pi)
////        let topSpace: CGFloat = distance / 60.0
////        
////        let topPoint1: CGPoint = CGPoint(x: viewCenter.x - topSpace, y: viewCenter.y - distance + (distance * 0.1))
////        let topPoint2: CGPoint = CGPoint(x: viewCenter.x + topSpace, y: viewCenter.y - distance + (distance * 0.1))
////        let finishPoint: CGPoint = CGPoint(x: viewCenter.x + CGFloat(needleRadius), y: viewCenter.y)
//        
//        let needlePath: UIBezierPath = UIBezierPath()
//        needlePath.move(to: viewCenter)
//        needlePath.addArc(withCenter: viewCenter, radius: needleRadius, startAngle: 0, endAngle: CGFloat(startAngle), clockwise: true)
//        needlePath.addLine(to: topPoint)
//        needlePath.addLine(to: startPoint)
//        
//        var translate: CGAffineTransform = CGAffineTransform(translationX: -1 * (self.bounds.origin.x + viewCenter.x), y: -1 * (self.bounds.origin.y + viewCenter.y))
//        needlePath.apply(translate)
//        let rotate: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(currentAngle + Float(Double.pi)))
//        needlePath.apply(rotate)
//        translate = CGAffineTransform(translationX: (self.bounds.origin.x + viewCenter.x), y: (self.bounds.origin.y + viewCenter.y))
//        needlePath.apply(translate)
//        
//        needleColor.set()
//        needleLayer.fillColor = needleColor.cgColor
//        needleLayer.strokeColor = UIColor.black.cgColor
//        needleLayer.path = needlePath.cgPath
//        
//    }
//    
//    fileprivate func drawLabels() {
//        
//    }
//    
//    // MARK: Pan gesture recognizer
//    
//    func handlePan(_ recognizer: UIPanGestureRecognizer) {
//        
//    }
//}
//
//protocol GaugeViewDelegate {
//    func gaugeView(_ gaugeView: GaugeView, didChangeLevel level:Int)
//}
//
//
//
