import UIKit

extension UIView {

    var background: UIColor {
        set {
            backgroundColor = newValue
        }
        get {
            return backgroundColor ?? UIColor.clear
        }
    }
    var bg: UIColor {
        set {
            backgroundColor = newValue
        }
        get {
            return backgroundColor ?? UIColor.clear
        }
    }

    func clearView() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }


    class func loadFromXib(_ xibName: String) -> UIView {
        return UINib(nibName: xibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }


    func setEnabled(_ enabled: Bool) {
        isUserInteractionEnabled = enabled
    }

    private static let kRotationAnimationKey = "rotationanimationkey"

    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity

            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }

    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }


    //------------------ Blur Background
    @discardableResult
    func addBlur(_ style: UIBlurEffect.Style = .extraLight, _ alpha: CGFloat = 1) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurBackground = UIVisualEffectView(effect: blurEffect)
        blurBackground.alpha = alpha
        addSubview(blurBackground)

        blurBackground.translatesAutoresizingMaskIntoConstraints = false
        blurBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        backgroundColor = .clear

        return blurBackground
    }

    //------------------ Anim
    func fadeIn(_ duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        isHidden = false
        alpha = 0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }

    func fadeOut(_ duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        isHidden = false
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: { value in
            self.isHidden = true
        })
    }


    func anim(_ type: Anim, _ duration: TimeInterval = 1, _ completion: (() -> Void)? = nil) {
        isHidden = false

        let width = bounds.width
        let height = bounds.height

        var fromX: CGFloat = 0
        var fromY: CGFloat = 0

        var toX: CGFloat = 0
        var toY: CGFloat = 0
        let option = UIView.AnimationOptions.curveEaseIn
        
        switch type {
        case .showFromTop:
            fromX = 0
            fromY = -height
            break
        case .showFromBottom:
            fromX = 0
            fromY = height
            break
        case .showFromLeft:
            fromX = -width
            fromY = 0
            break
        case .showFromRight:
            fromX = width
            fromY = 0
            break
        case .hideToTop:
            toX = 0
            toY = -height
            break
        case .hideToBottom:
            toX = 0
            toY = height
            break
        case .hideToLeft:
            toX = -width
            toY = 0
            break
        case .hideToRight:
            toX = width
            toY = 0
            break
        }
        transform = CGAffineTransform(translationX: fromX, y: fromY)
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [option],
            animations: {
                self.transform = CGAffineTransform(translationX: toX, y: toY)
            }, completion: { value in
                if completion != nil {
                    completion!()
                }
                switch type {
                case .showFromTop:
                    break
                case .showFromBottom:
                    break
                case .showFromLeft:
                    break
                case .showFromRight:
                    break
                case .hideToTop:
                    self.isHidden = true
                    break
                case .hideToBottom:
                    self.isHidden = true
                    break
                case .hideToLeft:
                    self.isHidden = true
                    break
                case .hideToRight:
                    self.isHidden = true
                    break
                }
            })
    }



    //------------------ Border
    enum LinePosition {
        case top
        case bottom
        case left
        case right
    }

    @discardableResult
    func addLine(_ position: LinePosition, _ color: UIColor = .gray, _ pixcel: Int = 1) -> UIView {
        let line = UIView()
        line.background = color
        let size: CGFloat = CGFloat(pixcel) / UIScreen.main.scale

        switch position {
        case .top:
            addView(line, [.left: 0, .top: 0, .right: 0, .height: size])
            break
        case .bottom:
            addView(line, [.left: 0, .bottom: 0, .right: 0, .height: size])
            break
        case .left:
            addView(line, [.left: 0, .bottom: 0, .top: 0, .width: size])
            break
        case .right:
            addView(line, [.right: 0, .bottom: 0, .top: 0, .width: size])
            break
        }
        return line
    }

    @discardableResult
    func addLine(_ position: LinePosition, _ any: Any?, _ color: UIColor = .gray, _ pixcel: Int = 1) -> UIView {
        let line = UIView()
        line.background = color
        let size: CGFloat = CGFloat(pixcel) / UIScreen.main.scale

        switch position {
        case .top:
            addView(line, [.left: 0, .toAboveOf: any, .right: 0, .height: size])
            break
        case .bottom:
            addView(line, [.left: 0, .toBelowOf: any, .right: 0, .height: size])
            break
        case .left:
            addView(line, [.toLeftOf: any, .bottom: 0, .top: 0, .width: size])
            break
        case .right:
            addView(line, [.toRightOf: any, .bottom: 0, .top: 0, .width: size])
            break
        }
        return line
    }



    func setBorder(_ pixcel: Int, _ color: UIColor) {
        self.layer.borderWidth = CGFloat(pixcel) / UIScreen.main.scale
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }

    func setBorderDp(_ dp: CGFloat, _ color: UIColor) {
        self.layer.borderWidth = dp
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }


    var conner: CGFloat {
        set {
            self.layer.cornerRadius = (newValue)
            self.clipsToBounds = true
        }
        get {
            return (self.layer.cornerRadius)
        }
    }

    var circle: Bool {
        set {
            if newValue {
                self.layer.cornerRadius = self.frame.size.width / 2
            } else {
                self.layer.cornerRadius = 0
            }
            self.clipsToBounds = true
        }
        get {
            return self.layer.cornerRadius == self.frame.size.width
        }
    }

    //    func roundCorners(_ corners: UIRectCorner, _ radius: CGFloat) {
    //        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    //        let mask = CAShapeLayer()
    //        mask.path = path.cgPath
    //        self.layer.mask = mask
    //    }

    func roundCorners(_ corners: UIRectCorner, _ radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        let rect = self.bounds
        mask.frame = rect
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    //------------------ LayoutConstraint
    enum MyContraint: Int {
        case left
        case right
        case top
        case bottom

        case width
        case height
        case aspect

        case aspectHeight
        case aspectWidth

        case minHeight
        case maxHeight

        case minWidth
        case maxWidth

        case centerX
        case centerY

        case toBelowOf
        case toAboveOf
        case toRightOf
        case toLeftOf

        case alignParentLeft
        case alignParentRight
        case alignParentTop
        case alignParentBottom

    }

    /*
     scrollView.addView(contentView, [.centerX: 0, .width: screenWidth, .top: 0, .bottom: 0])
     */
    @discardableResult
    func addView(_ subView: UIView) -> Array<NSLayoutConstraint> {
        return addView(subView, nil)
    }

    @discardableResult
    func addView(_ subView: UIView, _ map: [MyContraint: Any?]) -> Array<NSLayoutConstraint> {
        return addView(subView, nil, map)
    }

    @discardableResult
    func addView(_ subView: UIView, _ opt: Any?) -> Array<NSLayoutConstraint> {
        return addView(subView, opt, [.left: 0, .top: 0, .right: 0, .bottom: 0])
    }

    @discardableResult
    func addView(_ subView: UIView, _ opt: Any?, _ map: [MyContraint: Any?]) -> Array<NSLayoutConstraint> {
        //        print("-------------------")
        if opt == nil {
            self.addSubview(subView)
        } else {
            if opt is UIView {
                self.insertSubview(subView, belowSubview: opt as! UIView)
            }
            if opt is Int {
                self.insertSubview(subView, at: opt as! Int)
            }
        }
        var arrConstraint: Array<NSLayoutConstraint> = []
        for (key, value) in map {
            if value == nil {
                continue
            }
            var constraint: NSLayoutConstraint

            let item = subView
            var attribute1: NSLayoutConstraint.Attribute!

            var relatedBy = NSLayoutConstraint.Relation.equal
            var multiplier: CGFloat = 1
            var toItem: UIView? = self
            var attribute2: NSLayoutConstraint.Attribute!

            var constant: CGFloat = 0

            switch key {
            case .left:
                attribute1 = .left
                attribute2 = .left
                break
            case .right:
                attribute1 = .right
                attribute2 = .right
                break
            case .top:
                attribute1 = .top
                attribute2 = .top
                break
            case .bottom:
                attribute1 = .bottom
                attribute2 = .bottom
                break

            case .centerX:
                attribute1 = .centerX
                attribute2 = .centerX
                break
            case .centerY:
                attribute1 = .centerY
                attribute2 = .centerY
                break

            case .width:
                attribute1 = .width
                toItem = nil
                attribute2 = .notAnAttribute
                break
            case .height:
                attribute1 = .height
                toItem = nil
                attribute2 = .notAnAttribute
                break
            case .minHeight:
                attribute1 = .height
                toItem = nil
                attribute2 = .notAnAttribute
                relatedBy = .greaterThanOrEqual
                break
            case .maxHeight:
                attribute1 = .height
                toItem = nil
                attribute2 = .notAnAttribute
                relatedBy = .lessThanOrEqual
                break
            case .minWidth:
                attribute1 = .width
                toItem = nil
                attribute2 = .notAnAttribute
                relatedBy = .greaterThanOrEqual
                break
            case .maxWidth:
                attribute1 = .width
                toItem = nil
                attribute2 = .notAnAttribute
                relatedBy = .lessThanOrEqual
                break
            case .toBelowOf:
                attribute1 = .top
                attribute2 = .bottom
                constant = 0
                break
            case .toAboveOf:
                attribute1 = .bottom
                attribute2 = .top
                constant = 0
                break
            case .toRightOf:
                attribute1 = .left
                attribute2 = .right
                constant = 0
                break
            case .toLeftOf:
                attribute1 = .right
                attribute2 = .left
                constant = 0
                break
            case .aspect:
                attribute1 = .width
                attribute2 = .height
                toItem = subView
                multiplier = (value as! CGFloat)
                constant = 0
                break

            case .aspectWidth:
                attribute1 = .width
                attribute2 = .width
                if value is Array<Any> {
                    let arr = value as! Array<Any>
                    toItem = (arr[0] as! UIView)
                    if arr[1] is CGFloat {
                        multiplier = (arr[1] as! CGFloat)
                    }
                }
                constant = 0
                break
            case .aspectHeight:
                attribute1 = .height
                attribute2 = .height
                if value is Array<Any> {
                    let arr = value as! Array<Any>
                    toItem = (arr[0] as! UIView)
                    if arr[1] is CGFloat {
                        multiplier = (arr[1] as! CGFloat)
                    }
                }
                constant = 0
                break

            case .alignParentLeft:
                attribute1 = .left
                attribute2 = .left
                constant = 0
                break

            case .alignParentRight:
                attribute1 = .right
                attribute2 = .right
                constant = 0
                break

            case .alignParentTop:
                attribute1 = .top
                attribute2 = .top
                constant = 0
                break
            case .alignParentBottom:
                attribute1 = .bottom
                attribute2 = .bottom
                constant = 0
                break
            }

            if value is Int {
                constant = CGFloat(value as! Int)
            }
            if value is CGFloat {
                constant = value as! CGFloat
            }
            if value is Float {
                constant = CGFloat(value as! Float)
            }
            if value is UIView {
                toItem = (value as! UIView)
            }
            if value is Array<Any> {
                let arr = value as! Array<Any>
                toItem = (arr[0] as! UIView)
                if arr[1] is Int {
                    constant = CGFloat(arr[1] as! Int)
                }
                if arr[1] is CGFloat {
                    constant = arr[1] as! CGFloat
                }
            }
            //            print("constant : \(key) - \(constant)")

            constraint = NSLayoutConstraint(
                item: item,
                attribute: attribute1,
                relatedBy: relatedBy,
                toItem: toItem,
                attribute: attribute2,
                multiplier: multiplier,
                constant: constant)

            arrConstraint.append(constraint)
        }

        subView.autoresizesSubviews = false
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(arrConstraint)
        return arrConstraint
    }

    func getConstaint(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return getAllConstraints().filter {
            ($0.firstAttribute == attribute && $0.firstItem as? UIView == self)
                || ($0.secondAttribute == attribute && $0.secondItem as? UIView == self)
        }.first!
    }

    func getAllConstraints() -> [NSLayoutConstraint] {

        // array will contain self and all superviews
        var views = [self]

        // get all superviews
        var view = self
        while let superview = view.superview {
            views.append(superview)
            view = superview
        }

        // transform views to constraints and filter only those
        // constraints that include the view itself
        return views.flatMap({ $0.constraints }).filter { constraint in
            return constraint.firstItem as? UIView == self || constraint.secondItem as? UIView == self
        }
    }


    func gone() {
        isHidden = true
    }

    func visi() {
        isHidden = false
    }

    func invi() {
        isHidden = true
    }


    //------------------ Visiable_Gone
    func setVisibility(_ option: View) {
        switch option {
        case .VISIBLE:
            isHidden = false
            break
        case .INVISIBLE:
            isHidden = true
            break
        case .GONE:
            isHidden = true
//            getConstaint(.height).isActive = false
//            constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
//            self.addConstraint(constraint)
//            constraint.isActive = true
            break
        }
    }

    //------------------ OnClick
    func setOnClickListener(_ void: @escaping () -> Void) {
        initOnClickListener().void = void
    }

    func setOnClickListener(_ listener: OnClickListener) {
        initOnClickListener().listener = listener
    }

    private func initOnClickListener() -> MyTapGestureRecognizer {
        let tap = MyTapGestureRecognizer(target: self, action: #selector(onTap))
        tap.viewClick = self
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
        return tap
    }

    @objc func onTap(tap: MyTapGestureRecognizer) {
        if let listener = tap.listener {
            listener.onClick(tap.viewClick)
        }
        tap.void()
    }

    //------------------ OnLongClick
    func setLongClick(_ callback: @escaping () -> Void) {
        let tap = MyLongPressGestureRecognizer(target: self, action: #selector(onTapLong))
        tap.callback = callback
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }

    @objc func onTapLong(tap: MyLongPressGestureRecognizer) {
        tap.callback()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var listener: OnClickListener?
    var viewClick: UIView!
    var void: () -> Void = {

    }
}

class MyLongPressGestureRecognizer: UILongPressGestureRecognizer {
    var viewClick: UIView!
    var callback: () -> Void = {

    }
}



protocol OnClickListener {
    func onClick(_ view: UIView)
}

enum View {
    case VISIBLE
    case INVISIBLE
    case GONE
}

enum Anim {
    case showFromTop
    case showFromBottom
    case showFromLeft
    case showFromRight

    case hideToTop
    case hideToBottom
    case hideToLeft
    case hideToRight
}

class UICardView: UIView {
    var vBG = UIView()
    var cardConner: CGFloat = 0
    var cardSize: CGFloat = 1 {
        didSet {
            if theShadowLayer != nil {
                theShadowLayer!.shadowRadius = cardSize
            }
        }
    }
//    var cardColor: UIColor = UIColor.black.alpha(0.33)
    var cardColor: UIColor = UIColor.black
    var cardOffSet: CGSize = CGSize(width: 0, height: 0.3)

    private var theShadowLayer: CAShapeLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initView() {
        addView(vBG, 0)
        vBG.bg = .white
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if theShadowLayer == nil {

            let shadowLayer = CAShapeLayer.init()
            self.theShadowLayer = shadowLayer
            shadowLayer.path = UIBezierPath.init(roundedRect: bounds, cornerRadius: cardConner).cgPath
            shadowLayer.fillColor = UIColor.clear.cgColor

            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowColor = cardColor.cgColor
            shadowLayer.shadowRadius = cardSize
            shadowLayer.shadowOpacity = Float.init(1)
            shadowLayer.shadowOffset = cardOffSet

            vBG.conner = cardConner

            self.layer.insertSublayer(shadowLayer, at: 0)
        }
    }


}

