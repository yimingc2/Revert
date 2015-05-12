//
//  Copyright (c) 2015 Itty Bitty Apps. All rights reserved.
//

import UIKit

final class CATextLayerCell: CollectionViewCell {
  @IBOutlet weak var textLayerView: CATextLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureTextLayer(self.textLayerView.textLayer)
  }
  
  private class func configureTextLayer(textLayer: CATextLayer) {
    textLayer.string = "I am a quite long CATextLayer string."
    textLayer.fontSize = 20.0
    textLayer.foregroundColor = UIColor.lightGrayColor().CGColor
    textLayer.alignmentMode = kCAAlignmentCenter
    textLayer.truncationMode = kCATruncationMiddle
    textLayer.wrapped = true
  }
}

final class CAEmitterLayerCell: CollectionViewCell {
  @IBOutlet weak var emitterLayerView: CAEmitterLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureEmitterLayer(self.emitterLayerView.emitterLayer)
  }
  
  private class func configureEmitterLayer(emitterLayer: CAEmitterLayer) {
    emitterLayer.emitterPosition = CGPoint(x: emitterLayer.bounds.midX, y: emitterLayer.bounds.midY)
    emitterLayer.emitterZPosition = 5.0
    emitterLayer.emitterSize = CGSize(width: 1.0, height: 1.0)
    emitterLayer.emitterShape = kCAEmitterLayerSphere
    emitterLayer.emitterDepth = 1.9
    emitterLayer.emitterShape = kCAEmitterLayerPoint
    emitterLayer.emitterMode = kCAEmitterLayerPoints
    emitterLayer.renderMode = kCAEmitterLayerAdditive
    emitterLayer.emitterCells = [self.emitterCell]
  }
  
  private static var emitterCell: CAEmitterCell {
    let emitterCell = CAEmitterCell()
    emitterCell.scale = 0.05
    emitterCell.scaleRange = 0.02
    emitterCell.emissionRange = CGFloat(2 * M_PI)
    emitterCell.lifetime = 10
    emitterCell.birthRate = 5
    emitterCell.velocity = 50
    emitterCell.velocityRange = 20
    emitterCell.yAcceleration = 250
    emitterCell.contents = UIImage(named: "spritekit_reveal")!.CGImage
    return emitterCell
  }
}

final class CAShapeLayerCell: CollectionViewCell {
  @IBOutlet weak var shapeLayerView: CAShapeLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureShapeLayer(self.shapeLayerView.shapeLayer)
  }
  
  private class func configureShapeLayer(shapeLayer: CAShapeLayer) {
    let minLength = min(shapeLayer.frame.height, shapeLayer.frame.width)
    let origin = CGPointMake((shapeLayer.bounds.width - minLength) / 2, 0)
    let rect = CGRect(origin: origin, size: CGSize(width: minLength, height: minLength))
    shapeLayer.path = UIBezierPath(ovalInRect: rect).CGPath
    shapeLayer.fillColor = UIColor.revertOrangeColor().CGColor
    shapeLayer.strokeColor = UIColor.revertLightBlackColor().CGColor
    shapeLayer.strokeStart = 0.0
    shapeLayer.strokeEnd = 1.0
    shapeLayer.fillRule = kCAFillRuleEvenOdd
    shapeLayer.lineWidth = 2.0
    shapeLayer.miterLimit = 5.0
    shapeLayer.lineCap = kCALineCapRound
    shapeLayer.lineJoin = kCALineCapRound
    shapeLayer.lineDashPhase = 1.0
    shapeLayer.lineDashPattern = [1, 3, 4, 2]
  }
}

final class CAScrollLayerCell: CollectionViewCell {
  @IBOutlet weak var scrollLayerView: CAScrollLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureScrollLayer(self.scrollLayerView.scrollLayer)
  }
  
  private class func configureScrollLayer(scrollLayer: CAScrollLayer) {
    scrollLayer.scrollMode = kCAScrollHorizontally
    scrollLayer.backgroundColor = UIColor.revertDarkblueColor().CGColor
    scrollLayer.cornerRadius = 5.0
  }
}

final class CATiledLayerCell: CollectionViewCell {
  @IBOutlet weak var tiledLayerView: CATiledLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureTiledLayer(self.tiledLayerView.tiledLayer)
  }
  
  private class func configureTiledLayer(tiledLayer: CATiledLayer) {
    tiledLayer.levelsOfDetail = 10
    tiledLayer.levelsOfDetailBias = 10
    tiledLayer.tileSize = tiledLayer.bounds.size
    tiledLayer.cornerRadius = 5.0
    tiledLayer.borderWidth = 1.0
    tiledLayer.borderColor = UIColor.revertLightBlackColor().CGColor
  }
}

final class CAGradientLayerCell: CollectionViewCell {
  @IBOutlet weak var gradientLayerView: CAGradientLayerView!

  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureGradientLayer(self.gradientLayerView.gradientLayer)
  }
  
  private class func configureGradientLayer(gradientLayer: CAGradientLayer) {
    gradientLayer.type = kCAGradientLayerAxial
    gradientLayer.locations = [0.0, 0.16, 0.31, 0.43, 0.5, 0.57, 0.69, 0.69, 0.69, 0.83, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer.cornerRadius = 5.0
    gradientLayer.colors = [
      UIColor(red: 0.003, green: 0.043, blue: 0.341, alpha: 1.0).CGColor,
      UIColor(red: 0.333, green: 0.000, blue: 0.533, alpha: 1.0).CGColor,
      UIColor(red: 0.611, green: 0.305, blue: 0.572, alpha: 1.0).CGColor,
      UIColor(red: 0.894, green: 0.611, blue: 0.611, alpha: 1.0).CGColor,
      UIColor(red: 1.000, green: 0.733, blue: 0.619, alpha: 1.0).CGColor,
      UIColor(red: 1.000, green: 0.866, blue: 0.517, alpha: 1.0).CGColor,
      UIColor.whiteColor().CGColor,
      UIColor(red: 0.894, green: 1.000, blue: 0.996, alpha: 1.0).CGColor,
      UIColor(red: 0.784, green: 1.000, blue: 0.996, alpha: 1.0).CGColor,
      UIColor(red: 0.223, green: 0.694, blue: 0.894, alpha: 1.0).CGColor,
      UIColor(red: 0.011, green: 0.360, blue: 0.576, alpha: 1.0).CGColor
    ]
  }
}

final class CAReplicatorLayerCell: CollectionViewCell {
  @IBOutlet weak var replicatorLayerView: CAReplicatorLayerView!

  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureReplicatorLayer(self.replicatorLayerView.replicatorLayer)
  }
  
  private class func configureReplicatorLayer(replicatorLayer: CAReplicatorLayer) {
    let circleWidth: CGFloat = 20.0
    let circlePadding: CGFloat = 10.0
    let circleRect = CGRect(x: circlePadding / 2.0, y: replicatorLayer.bounds.midY - circleWidth / 2.0, width: circleWidth, height: circleWidth)
    let circleLayer = CAShapeLayer()
    
    circleLayer.path = UIBezierPath(ovalInRect: circleRect).CGPath
    circleLayer.fillColor = UIColor.revertOrangeColor().CGColor
    
    replicatorLayer.instanceCount = 5
    replicatorLayer.preservesDepth = true
    replicatorLayer.instanceDelay = 1.0
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(circleWidth + circlePadding / 2.0, 0.0, 0.0)
    replicatorLayer.instanceColor = UIColor.redColor().CGColor
    replicatorLayer.instanceRedOffset = 0.2
    replicatorLayer.instanceGreenOffset = 0.3
    replicatorLayer.instanceBlueOffset = 0.1
    replicatorLayer.instanceAlphaOffset = 0.2
    replicatorLayer.addSublayer(circleLayer)
  }
}

final class CAEAGLLayerCell: CollectionViewCell {
  @IBOutlet weak var aegLayerView: CAEAGLLayerView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.dynamicType.configureAeglLayer(self.aegLayerView.aeglLayer)
  }
  
  private class func configureAeglLayer(aeglLayer: CAEAGLLayer) {
    aeglLayer.cornerRadius = 5.0
    aeglLayer.borderWidth = 1.0
    aeglLayer.borderColor = UIColor.revertLightBlackColor().CGColor
  }
}
