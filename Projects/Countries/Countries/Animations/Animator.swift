//
//  Animator.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import UIKit

final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    static let duration: TimeInterval = 1.25
    
    private let type: PresentationType
    private let customCollectionViewController: CustomCollectionViewController
    private let productDetailViewController: ProductDetailViewController
    private var selectedCellImageViewSnapshot: UIView
    private let cellImageViewRect: CGRect
    private let cellLabelRect: CGRect
    
    init?(type: PresentationType, customCollectionViewController: CustomCollectionViewController, productDetailViewController: ProductDetailViewController, selectedCellImageViewSnapshot: UIView) {
        self.type = type
        self.customCollectionViewController = customCollectionViewController
        self.productDetailViewController = productDetailViewController
        self.selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        
        guard let window = customCollectionViewController.view.window ?? productDetailViewController.view.window,
              let selectedCell = customCollectionViewController.selectedCell
        else { return nil }
        
        self.cellLabelRect = selectedCell.productName.convert(selectedCell.productName.bounds, to: window)
        self.cellImageViewRect = selectedCell.productImage.convert(selectedCell.productImage.bounds, to: window)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toView = productDetailViewController.view
        else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(toView)
        
        //let closeButtonSnapshot = productDetailViewController.closeButton.snapshotView(afterScreenUpdates: true)
        guard let selectedCell = customCollectionViewController.selectedCell,
              let window = customCollectionViewController.view.window ?? productDetailViewController.view.window,
              let cellImageSnapshot = selectedCell.productImage.snapshotView(afterScreenUpdates: true),
              let controllerImageSnapshot = productDetailViewController.productImage.snapshotView(afterScreenUpdates: true),
              let cellLabelSnapshot = selectedCell.productName.snapshotView(afterScreenUpdates: true)
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let isPresenting = type.isPresenting
        let backgroundView: UIView
        let fadeView = UIView(frame: containerView.bounds)
        fadeView.backgroundColor = productDetailViewController.view.backgroundColor
        
        if isPresenting {
            selectedCellImageViewSnapshot = cellImageSnapshot
            
            backgroundView = UIView(frame: containerView.bounds)
            backgroundView.addSubview(fadeView)
            fadeView.alpha = 0
        } else {
            backgroundView = customCollectionViewController.view.snapshotView(afterScreenUpdates: true) ?? fadeView
            backgroundView.addSubview(fadeView)
        }
        
        toView.alpha = 0
        
        [backgroundView, selectedCellImageViewSnapshot, controllerImageSnapshot, cellLabelSnapshot].forEach { containerView.addSubview($0) }
        
        let controllerImageViewRect = productDetailViewController.productImage.convert(productDetailViewController.productImage.bounds, to: window)
        let controllerLabelRect = productDetailViewController.productName.convert(productDetailViewController.productName.bounds, to: window)
        //let closeButtonRect = productDetailViewController.closeButton.convert(secondViewController.closeButton.bounds, to: window)

        [selectedCellImageViewSnapshot, controllerImageSnapshot].forEach {
            $0.frame = isPresenting ? cellImageViewRect : controllerImageViewRect
            $0.layer.cornerRadius = isPresenting ? 12 : 0
            $0.layer.masksToBounds = true
        }
        
        controllerImageSnapshot.alpha = isPresenting ? 0 : 1
        selectedCellImageViewSnapshot.alpha = isPresenting ? 1 : 0
        cellLabelSnapshot.frame = isPresenting ? cellLabelRect : controllerLabelRect
        
        //closeButtonSnapshot.frame = closeButtonRect
        //closeButtonSnapshot.alpha = isPresenting ? 0 : 1
        
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.selectedCellImageViewSnapshot.frame =  isPresenting ? controllerImageViewRect : self.cellImageViewRect
                controllerImageSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
                
                fadeView.alpha = isPresenting ? 1 : 0
                
                cellLabelSnapshot.frame = isPresenting ? controllerLabelRect : self.cellLabelRect
                
                [controllerImageSnapshot, self.selectedCellImageViewSnapshot].forEach {
                            $0.layer.cornerRadius = isPresenting ? 0 : 12
                        }

            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                self.selectedCellImageViewSnapshot.alpha = isPresenting ? 0 : 1
                controllerImageSnapshot.alpha = isPresenting ? 1 : 0
            }
            
        } completion: { _ in
            self.selectedCellImageViewSnapshot.removeFromSuperview()
            controllerImageSnapshot.removeFromSuperview()
            backgroundView.removeFromSuperview()
            cellLabelSnapshot.removeFromSuperview()
            //closeButtonSnapshot.removeFromSuperview()

            toView.alpha = 1
            transitionContext.completeTransition(true)
        }

    }
}

enum PresentationType {
    case present
    case dismiss
    
    var isPresenting: Bool {
        return self == .present
    }
}
