//
//  ViewController.swift
//  GraphicView
//
//  Created by Yoshizumi Ashikawa on 2016/03/03.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var arc: ArcView!
	let maxArcAngle = 180.0
  let duration = 1.0
  let fps = 60.0


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()


    arc = ArcView(color: UIColor.blueColor(), lineWidth: 30, angle: CGFloat(M_PI/180.0*20.0))
    arc.rotate = 0
    arc.opposite = true

    arc.frame = CGRectMake(0, 0, 500, 500)
    arc.center = view.center

    view.addSubview(arc)


  let updateTime = 1.0/fps
	let angleInc = CGFloat(maxArcAngle/(duration/updateTime)) * CGFloat(M_PI/180)

    NSTimer.schedule(repeatInterval: updateTime){ timer in
      if self.arc.endAngle > CGFloat(self.maxArcAngle*M_PI/180) {
				self.arc.endAngle = 0.0
      }
			self.arc.endAngle = self.arc.endAngle + angleInc
      self.arc.setNeedsDisplay()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

