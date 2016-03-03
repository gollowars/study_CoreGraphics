//
//  GraphicView.swift
//  GraphicView
//
//  Created by Yoshizumi Ashikawa on 2016/03/03.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import Foundation
import UIKit

class ArcView: UIView {

  var arcColor: UIColor!
  var arcWidth: CGFloat!
  var endAngle: CGFloat!
  var rotate = 180.0
  var opposite = false

  static let defaultColor = UIColor(red: 0.3, green: 0.3, blue: 1.0, alpha: 1.0)
	static let defaultWidth: CGFloat = 20

  override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = UIColor.clearColor()
			arcColor = ArcView.defaultColor
      arcWidth = ArcView.defaultWidth
      endAngle = CGFloat(M_PI/180.0*0)
  }

  convenience init(color: UIColor = ArcView.defaultColor,lineWidth:CGFloat = ArcView.defaultWidth, angle:CGFloat = 0) {
    self.init(frame: CGRectMake(0, 0, 0, 0))
    arcColor = color
		arcWidth = lineWidth
    endAngle = angle
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()

		let radius = max(bounds.width/2-arcWidth/2,bounds.height/2-arcWidth/2)
    let startAngle: CGFloat = 0
    let nextAngle = endAngle
    let center = CGPointMake(bounds.width/2, bounds.height/2)


    CGContextSaveGState(context)
    CGContextTranslateCTM(context, center.x, center.y)
    CGContextRotateCTM(context, CGFloat(M_PI/180.0*rotate))
    if opposite == true{CGContextScaleCTM(context, -1.0, 1.0)}


    let path = UIBezierPath()
    path.addArcWithCenter(CGPointZero, radius: radius, startAngle: startAngle, endAngle: nextAngle, clockwise: true)
		path.lineWidth = arcWidth
		arcColor.setStroke()
    path.stroke()

    CGContextRestoreGState(context)
  }
}