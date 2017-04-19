//
//  DKView.swift
//  DesignKit
//
//  Created by Kyle Lee on 4/18/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit

@IBDesignable
open class DKView: UIView {
    
    @IBInspectable public override var cornerRadius: CGFloat { didSet{} }
    @IBInspectable public override var shadowRadius: CGFloat { didSet{} }
    @IBInspectable public override var shadowOpacity: Float { didSet{} }
    @IBInspectable public override var shadowOffset: CGSize { didSet{} }
    @IBInspectable public override var shadowColor: UIColor? { didSet{} }
    
    // FIX THIS CODE TO BE MORE MODULAR
    // From here
    
    open var shapeLayer: CAShapeLayer = CAShapeLayer() { didSet{ configure() } }
    open var strokeLayer: CAShapeLayer = CAShapeLayer() { didSet{ configure() } }
    open var gradientLayer: CAGradientLayer = CAGradientLayer() { didSet{ configure() } }
    
    @IBInspectable
    open var radiusForCorner: CGFloat = 0 { didSet{ configure() } }
    
    @IBInspectable
    open var topLeftCorner: Bool = false { didSet{ configure() } }
    
    @IBInspectable
    open var topRightCorner: Bool = false { didSet{ configure() } }
    
    @IBInspectable
    open var bottomRightCorner: Bool = false { didSet{ configure() } }
    
    @IBInspectable
    open var bottomLeftCorner: Bool = false { didSet{ configure() } }
    
    @IBInspectable
    open var borderWidth: CGFloat = 0 { didSet{ configure() } }
    
    @IBInspectable
    open var borderColor: UIColor? = UIColor.clear { didSet{ configure() } }
    
    @IBInspectable
    open var startPoint: CGPoint = CGPoint(x: 0, y: 0) { didSet{ configure() } }
    
    @IBInspectable
    open var endPoint: CGPoint = CGPoint(x: 1, y: 1) { didSet{ configure() } }
    
    @IBInspectable
    open var color1: UIColor? = UIColor.clear { didSet{ configure() } }
    
    @IBInspectable
    open var color2: UIColor? = UIColor.clear { didSet{ configure() } }
    
    @IBInspectable
    open var color3: UIColor? = UIColor.clear { didSet{ configure() } }
    
    @IBInspectable
    open var color4: UIColor? = UIColor.clear { didSet{ configure() } }
    
    
    public func configure() {
        
        // CORNERS
        var corners: UIRectCorner = []
        if topLeftCorner { corners.insert(.topLeft) }
        if topRightCorner { corners.insert(.topRight) }
        if bottomRightCorner { corners.insert(.bottomRight) }
        if bottomLeftCorner { corners.insert(.bottomLeft) }
        
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radiusForCorner, height: radiusForCorner)).cgPath
        layer.mask = shapeLayer
        
        
        
        // BORDER
        layer.borderWidth = borderWidth
        
        strokeLayer.frame = layer.bounds
        strokeLayer.fillColor = UIColor.clear.cgColor
        strokeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radiusForCorner, height: radiusForCorner)).cgPath
        
        strokeLayer.lineWidth = borderWidth * 2
        
        
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
            strokeLayer.strokeColor = borderColor.cgColor
        } else {
            layer.borderColor = nil
            strokeLayer.strokeColor = nil
        }
        
        layer.addSublayer(strokeLayer)
        
        gradientLayer.frame = bounds
        var colors = [CGColor]()
        if let color = color1, color1 != .clear { colors.append(color.cgColor) }
        if let color = color2, color2 != .clear { colors.append(color.cgColor) }
        if let color = color3, color3 != .clear { colors.append(color.cgColor) }
        if let color = color4, color4 != .clear { colors.append(color.cgColor) }
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.addSublayer(gradientLayer)
        
    }
    
    // To here
    
}
    
    

