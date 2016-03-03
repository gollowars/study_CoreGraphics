//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let width = 200
let height = 200
let size = CGSize(width: width, height: height)
let view = UIView(frame: CGRect(origin: CGPointZero, size: size))
view.backgroundColor = UIColor.clearColor()


UIGraphicsBeginImageContextWithOptions(size, true, 0)


let barWidth: CGFloat = 15
let radius:Double = Double(width/2)-Double(barWidth/2)
let center = CGPoint(x: width/2,y: height/2)
let anglePer = 0.5
let lastAngle = Int(floor(360*anglePer))
let barColor = UIColor(red: 0.1, green: 0.3, blue: 1.0, alpha: 1.0)


let ctx = UIGraphicsGetCurrentContext()
CGContextSaveGState(ctx)
CGContextTranslateCTM(ctx, center.x, center.y)
CGContextRotateCTM(ctx, CGFloat(M_PI/180.0*180.0))


let path = UIBezierPath()
barColor.setStroke()
path.lineWidth = barWidth

for(var i = 0; i <= lastAngle;i++){
  let angle: Double = Double(i)
	let radian = M_PI/180*angle

  let x = cos(radian)*radius
  let y = sin(radian)*radius

	let point = CGPoint(x: x,y: y)

  if i == 0 {
		path.moveToPoint(point)
  }else {
		path.addLineToPoint(point)
  }
}

path.stroke()

CGContextRestoreGState(ctx);



view.layer.contents = UIGraphicsGetImageFromCurrentImageContext().CGImage

UIGraphicsEndImageContext()

XCPlaygroundPage.currentPage.liveView = view
