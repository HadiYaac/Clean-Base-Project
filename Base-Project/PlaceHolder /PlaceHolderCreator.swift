//
//  PlaceHolderCreator.swift
//  Base-Project
//
//  Created by Mojtaba Almoussawi on 7/29/18.
//  Copyright © 2018 Tedmob. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UIGestureRecognizerDelegate{
    
    private
    struct AssociatedKeys {
        static var kPlaceHolderView = "placeHolderView"
        static var kConfigurePlaceHolderView = "configurePlaceHolderView"
    }
    
    
    private
    var configurePlaceHolderView: ((PlaceHolderView) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kConfigurePlaceHolderView) as? (PlaceHolderView) -> Void
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kConfigurePlaceHolderView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            reloadEmptyDataSet()
        }
    }
    
    private
    var placeHolderView : PlaceHolderView?{
        get {
            if let view = objc_getAssociatedObject(self, &AssociatedKeys.kPlaceHolderView) as? PlaceHolderView {
                return view
            } else {
                let view = PlaceHolderView.init(frame: self.view.frame)
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                view.isHidden = true
                let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapContentView(_:)))
                tapGesture.delegate = self
                view.addGestureRecognizer(tapGesture)
                view.button.addTarget(self, action: #selector(didTapDataButton(_:)), for: .touchUpInside)
                
                objc_setAssociatedObject(self, &AssociatedKeys.kPlaceHolderView, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return view
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kPlaceHolderView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc
    private
    func didTapContentView(_ sender: UITapGestureRecognizer) {
        placeHolderView?.didTapContentViewHandle?()
    }
    
    @objc
    private
    func didTapDataButton(_ sender: UIButton) {
        placeHolderView?.didTapDataButtonHandle?()
    }
    
    
    
    public
    func placeHolderView(_ closure: @escaping (PlaceHolderView) -> Void) {
        configurePlaceHolderView = closure
    }
    
    
    public
    var isPlaceHolderVisible: Bool {
        if let view = objc_getAssociatedObject(self, &AssociatedKeys.kPlaceHolderView) as? PlaceHolderView {
            return !view.isHidden
        }
        return false
    }
    
    public
    func reloadEmptyDataSet() {
        
        if let view = placeHolderView {
            
            if view.superview == nil {
                self.view.addSubview(view)
                self.view.bringSubview(toFront: view)
            }
            
            // Removing view resetting the view and its constraints it very important to guarantee a good state
            
            view.prepareForReuse()
            
            view.isHidden = false
            view.clipsToBounds = true
            
            if let config = configurePlaceHolderView {
                config(view)
            }
            
            view.setupConstraints()
            view.layoutIfNeeded()
            
        } else if isPlaceHolderVisible {
            removePlaceHolder()
        }
    }
    
    public
    func removePlaceHolder(){
        
        if let view = placeHolderView{
            view.prepareForReuse()
            placeHolderView = nil
            view.removeFromSuperview()
            self.view.layoutIfNeeded()
        }
        
    }
    
    public
    func hidePlaceHolder(){
        self.placeHolderView?.isHidden = true
    }
    
    
    func updatePlaceHolder(titleLabel title : NSAttributedString? = nil,
                           detailDescription  description : NSAttributedString? = nil,
                           placeHolderBackgroundColor backgroundColor : UIColor? = nil,
                           andImage image : UIImage? = nil,
                           scrollAllowed scroll: Bool? = nil,
                           touchEnabled touch : Bool? = nil,
                           shouldShowProgress progressMustShow : Bool? = nil
        ){
        if let view = placeHolderView{
            view.titleLabelString(title)
            view.detailLabelString(description)
            view.dataSetBackgroundColor(backgroundColor)
            view.image(image)
            view.isScrollAllowed(scroll ?? true)
            view.isTouchAllowed(touch ?? true)
            view.mustShowProgress(progressMustShow ?? false)
        }
    }
    
    
    
}