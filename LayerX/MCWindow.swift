//
//  MCWindow.swift
//  LayerX
//
//  Created by Michael Chen on 2015/10/27.
//  Copyright © 2015年 Michael Chen. All rights reserved.
//

import Cocoa

class MCWIndow: NSWindow {
	override func awakeFromNib() {
		styleMask = NSBorderlessWindowMask | NSResizableWindowMask
		opaque = false
		backgroundColor = NSColor.clearColor()
		movableByWindowBackground = true
		hasShadow = false
	}

	func fitsWithSize(size: NSSize) {
		var frame = self.frame
		if frame.size.width < size.width || frame.size.height < size.height {
			frame.size = size
			setFrame(frame, display: true)
		}
	}

	func resizeTo(size: NSSize, animated: Bool) {
		var frame = self.frame
		frame.size = size

		if !animated {
			setFrame(frame, display: true)
			return
		}

		let resizeAnimation = [NSViewAnimationTargetKey: self, NSViewAnimationEndFrameKey: NSValue(rect: frame)]
		let animations = NSViewAnimation(viewAnimations: [resizeAnimation])
		animations.animationBlockingMode = .Blocking
		animations.animationCurve = .EaseInOut
		animations.duration = 0.15
		animations.startAnimation()
	}
}
