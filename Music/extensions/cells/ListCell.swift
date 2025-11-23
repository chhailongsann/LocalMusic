//
//  ListCell.swift
//  CamDigiKey
//
//  Created by Sann Chhailong on 4/26/19.
//  Copyright © 2019 Sann Chhailong. All rights reserved.
//

import UIKit

/// ListCell represents a cell that ListHeaderController registers and dequeues for list rendering. T represents the Class Type, usually a model or view model object, this cell should render visually.
@available(iOS 11.0, tvOS 11.0, *)
open class ListCell<T>: UITableViewCell {
    
    /// item is fed in automatically from ListHeaderController
    open var item: T!
    
    /// parentController is set to the ListHeaderController that is rendering this cell.  This is useful for scenarios where a cell contains a UIButton and you want to use addTarget(...) to trigger an action in the controller.
    open weak var parentController: UIViewController?
    
    /// 90% of lists need a separator line
    public let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    /// In your custom ListCell classes, just override setupViews() to provide custom behavior.  We do this to avoid overriding init methods.
    open func setupViews() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
