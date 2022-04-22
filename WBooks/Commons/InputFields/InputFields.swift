//
//  InputFieldsView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/04/2022.
//

import Foundation
import UIKit

@IBDesignable
internal class InputFields: UITextField {
    let border = CALayer()

    @IBInspectable var borderColor: UIColor = UIColor.gray {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var borderColorRed: UIColor = UIColor.red {
        didSet {
            setup()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet {
            setup()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    func setup() {
        border.borderColor = borderColor.cgColor
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect( x: 0, y: self.frame.size.height - borderWidth,
                               width: self.frame.size.width, height: self.frame.size.height )
    }

    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return editingRect(forBounds: bounds)
    }

    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return editingRect(forBounds: bounds)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: 5)
    }
}
