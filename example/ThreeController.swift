//
//  ThreeController.swift
//  example
//
//  Created by Hà on 23/06/2023.
//

import UIKit

class ThreeController: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickBack(_ sender: Any) {
        if let navigationController = self.navigationController {
            let stack = navigationController.viewControllers.count
            if stack > 1 {
                self.navigationController!.popViewController(animated: true)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}


@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 2.0
    @IBInspectable var bottomInset: CGFloat = 2.0
    @IBInspectable var leftInset: CGFloat = 2.0
    @IBInspectable var rightInset: CGFloat = 2.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
