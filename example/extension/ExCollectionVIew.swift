//
//  ExCollectionView.swift
//  story
//
//  Created by Bùi Ngọc Hà on 01/04/2019.
//  Copyright © 2019 habn. All rights reserved.
//

import UIKit

class BaseCellCollection: UICollectionViewCell {


    override init(frame: CGRect) {
        super.init(frame: frame)
        onCreate()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        onCreate()
    }

    @objc func onCreate() {

    }
}



extension UICollectionView {

    func scrollToFirstRow() {
        let indexPath = IndexPath(row: 0, section: 0)
        scrollToItem(at: indexPath, at: .left, animated: true)

    }

    func scrollTo(_ index: Int, _ anim: Bool = true) {
        let indexPath = IndexPath(row: index, section: 0)
        scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: anim)
    }


    func reloadDataSmoothly() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()

        CATransaction.setCompletionBlock { () -> Void in
            UIView.setAnimationsEnabled(true)
        }

        reloadData()
//        beginUpdates()
//        endUpdates()

        CATransaction.commit()
    }

    func reloadDataTop(_ count: Int) {
        let currentVisibleIndexPaths = indexPathsForVisibleItems

        var updatedVisibleIndexPaths = [IndexPath]()
        for indexPath in currentVisibleIndexPaths {
            let newIndexPath = IndexPath(row: indexPath.row + count, section: indexPath.section)
            updatedVisibleIndexPaths.append(newIndexPath)
        }
        reloadData()
        scrollToItem(at: updatedVisibleIndexPaths[0], at: .top, animated: false)
    }

    func addCell(_ cell: AnyClass) {
        self.register(cell, forCellWithReuseIdentifier: String(describing: cell))
    }

    func getCell(_ cell: AnyClass, _ indexPath: IndexPath) -> Any {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath)
    }

//    func addAnim(_ cell: UICollectionViewCell, _ height: CGFloat, _ indexPath: IndexPath, _ column: Int = 1) {
//        if tag != 69 {
//            let when = DispatchTime.now() + 1
//            DispatchQueue.main.asyncAfter(deadline: when) {
//                self.tag = 69
//            }
//            let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: height, duration: 0.25, delayFactor: 0.05, column: column)
//            let animator = Animator(animation: animation)
//            animator.animate(cell: cell, at: indexPath, in: self)
//        }
//    }
//
//    func addAnimSlide(_ cell: UICollectionViewCell, _ width: CGFloat, _ indexPath: IndexPath) {
//        if tag != 69 {
//            let when = DispatchTime.now() + 1
//            DispatchQueue.main.asyncAfter(deadline: when) {
//                self.tag = 69
//            }
//            let animation = AnimationFactory.makeSlideIn(duration: 0.3, delayFactor: 0.06)
//            let animator = Animator(animation: animation)
//            animator.animate(cell: cell, at: indexPath, in: self)
//        }
//    }
}


class MyUICollectionView: UICollectionView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initView()
    }

    var margin: CGFloat = 0
    var itemSize: CGSize!

    init(margin: CGFloat = 0, itemWidth: CGFloat, itemHeight: CGFloat, scroll: UICollectionView.ScrollDirection = .vertical) {
        self.margin = margin
        self.itemSize = CGSize(width: itemWidth, height: itemHeight)

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
 
        if itemHeight > 0 {
            layout.itemSize = itemSize
        }
        layout.scrollDirection = scroll
        layout.minimumInteritemSpacing = margin / 2
        layout.minimumLineSpacing = margin


        super.init(frame: .zero, collectionViewLayout: layout)
        initView()
    }

    func initView() {
        background = .clear

        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
}
 
//
//class LoadingCell: BaseCellCollection {
//
//    static let heightCell: CGFloat = 50
//
//    var lblTryAgain: MyUILabel!
//    var lblLoading: MyUILabel!
//    var lblMessage: MyUILabel!
//
//    var progress: NVActivityIndicatorView!
//
//    static func initCell(_ mSelf: BaseController, _ tableView: UICollectionView, _ indexPath: IndexPath) -> LoadingCell {
//        let cell = tableView.getCell(LoadingCell.self, indexPath) as! LoadingCell
//        cell.initView(mSelf)
//        return cell
//    }
//
//    public func initView(_ mSelf: BaseController) {
//        self.mSelf = mSelf
//        onProgress()
//    }
//
//    func onProgress() {
//        progress.isHidden = false
//        lblLoading.isHidden = false
//        lblTryAgain.isHidden = true
//        lblMessage.isHidden = true
//    }
//
//    func onError() {
//        progress.isHidden = true
//        lblLoading.isHidden = true
//        lblTryAgain.isHidden = false
//        lblMessage.isHidden = true
//    }
//
//
//
//    func onNotify(_ mes: String) {
//        progress.isHidden = true
//        lblLoading.isHidden = true
//        lblTryAgain.isHidden = true
//        lblMessage.isHidden = false
//        lblMessage.text = mes
//    }
//
//    override func onCreate() {
//        backgroundColor = .clear
//
//        let content = UIView()
//        addView(content, [.centerX: 0, .centerY: 0, .height: 30])
//
//        progress = NVActivityIndicatorView(frame: .zero, type: .lineSpinFadeLoader, color: .cl_primary)
//        progress.startAnimating()
//        content.addView(progress, [.top: 0, .left: 0, .bottom: 0, .aspect: CGFloat(1)])
//
//        lblLoading = MyUILabel(.cl_primary)
//        lblLoading.text = "loading..."
//        content.addView(lblLoading, [.toRightOf: [progress!, 5], .top: 0, .minWidth: 30, .bottom: 0, .right: 0])
//
//        lblTryAgain = MyUILabel(.white, 16, .center)
//        lblTryAgain.isHidden = true
//        lblTryAgain.text = "Thử lại"
//        lblTryAgain.background = .cl_primary
//        lblTryAgain.conner = 3
//        lblTryAgain.setOnClickListener {
//            self.mSelf.onTryAgain()
//            self.onProgress()
//        }
//        content.addView(lblTryAgain, [.centerX: 0, .centerY: 0, .width: 86, .height: 30])
//
//        lblMessage = MyUILabel(.cl_primary)
//        lblMessage.text = ""
//        content.addView(lblMessage, [.centerX: 0, .centerY: 0, .width: 86, .height: 30])
//
//    }
//}
//
//

