/*
* Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*	*	Redistributions of source code must retain the above copyright notice, this
*		list of conditions and the following disclaimer.
*
*	*	Redistributions in binary form must reproduce the above copyright notice,
*		this list of conditions and the following disclaimer in the documentation
*		and/or other materials provided with the distribution.
*
*	*	Neither the name of Material nor the names of its
*		contributors may be used to endorse or promote products derived from
*		this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

public class Layout {
	/// UIView context.
	internal weak var context: UIView?
	
	init(context: UIView?) {
		self.context = context
	}

	/// Width
	public func width(child: UIView, width: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.width(v, child: child, width: width)
		}
	}
	
	/// Height
	public func height(child: UIView, height: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.height(v, child: child, height: height)
		}
	}
	
	/// Size
	public func size(child: UIView, width: CGFloat = 0, height: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.size(v, child: child, width: width, height: height)
		}
	}
	
	/// Array of UIViews horizontally aligned.
	public func horizontally(children: Array<UIView>, left: CGFloat = 0, right: CGFloat = 0, spacing: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignToParentHorizontally(v, children: children, left: left, right: right, spacing: spacing)
		}
	}
	
	/// Array of UIViews vertically aligned.
	public func vertically(children: Array<UIView>, top: CGFloat = 0, bottom: CGFloat = 0, spacing: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignToParentVertically(v, children: children, top: top, bottom: bottom, spacing: spacing)
		}
	}
	
	/// Horizontally aligned.
	public func horizontally(child: UIView, left: CGFloat = 0, right: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignToParentHorizontally(v, child: child, left: left, right: right)
		}
	}
	
	/// Vertically aligned.
	public func vertically(child: UIView, top: CGFloat = 0, bottom: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignToParentVertically(v, child: child, top: top, bottom: bottom)
		}
	}
	
	/// Layout
	public func align(child: UIView, top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignToParent(v, child: child, top: top, left: left, bottom: bottom, right: right)
		}
	}
	
	/// LayoutFromTopLeft
	public func alignFromTopLeft(child: UIView, top: CGFloat = 0, left: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromTopLeft(v, child: child, top: top, left: left)
		}
	}
	
	/// LayoutFromTopRight
	public func alignFromTopRight(child: UIView, top: CGFloat = 0, right: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromTopRight(v, child: child, top: top, right: right)
		}
	}
	
	/// LayoutFromBottomLeft
	public func alignFromBottomLeft(child: UIView, bottom: CGFloat = 0, left: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromBottomLeft(v, child: child, bottom: bottom, left: left)
		}
	}
	
	/// LayoutFromBottomRight
	public func alignFromBottomRight(child: UIView, bottom: CGFloat = 0, right: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromBottomRight(v, child: child, bottom: bottom, right: right)
		}
	}
	
	/// LayoutFromTop
	public func alignFromTop(child: UIView, top: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromTop(v, child: child, top: top)
		}
	}
	
	/// LayoutFromLeft
	public func alignFromLeft(child: UIView, left: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromLeft(v, child: child, left: left)
		}
	}
	
	/// LayoutFromBottom
	public func alignFromBottom(child: UIView, bottom: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromBottom(v, child: child, bottom: bottom)
		}
	}
	
	/// LayoutFromRight
	public func alignFromRight(child: UIView, right: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.alignFromRight(v, child: child, right: right)
		}
	}
	
	/// Center
	public func center(child: UIView, constantX: CGFloat = 0, constantY: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.center(v, child: child, constantX: constantX, constantY: constantY)
		}
	}
	
	/// CenterHorizontally
	public func centerHorizontally(child: UIView, constant: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.centerHorizontally(v, child: child, constant: constant)
		}
	}
	
	/// CenterVertically
	public func centerVertically(child: UIView, constant: CGFloat = 0) {
		if let v: UIView = context {
			MaterialLayout.centerVertically(v, child: child, constant: constant)
		}
	}
}

/// A memory reference to the LayoutKey instance for UIView extensions.
private var LayoutKey: UInt8 = 0

/// MaterialLayout extension for UIView.
public extension UIView {
	/// Layout reference.
	public private(set) var layout: Layout {
		get {
			return MaterialAssociatedObject(self, key: &LayoutKey) {
				return Layout(context: self)
			}
		}
		set(value) {
			MaterialAssociateObject(self, key: &LayoutKey, value: value)
		}
	}
}
