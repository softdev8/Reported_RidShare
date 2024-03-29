//
//  ReportMainTableCell.swift
//  Reported
//
//  Created by Joshua Weitzman on 1/8/15.
//  Copyright (c) 2015 Joshua Weitzman. All rights reserved.
//

import UIKit
import MapKit

protocol DetailCellDelegate
{
    func detailforCell(indexPath:NSIndexPath )
}

class ReportMainTableCell: UITableViewCell ,MKMapViewDelegate{

    var anotation :MKPointAnnotation = MKPointAnnotation()
    
    var lbldate: UILabel = UILabel()
    var lbldescription: UILabel = UILabel()
    var lblstatus: UILabel = UILabel()
    var btnmore: UIButton = UIButton()
    var imgstatus: UIView  = UIView()
    var maplocation: MKMapView = MKMapView()

    var parentIndex: NSIndexPath!
    
    var delegate:DetailCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    func setupViews()
    {
        
        let screenwidth = UIScreen.mainScreen().bounds.size.width
        
        self.imgstatus.frame = CGRectMake(8, 10, 14, 14)
        
        self.lblstatus.frame = CGRectMake(30, 9, 284, 21)
        self.lblstatus.textColor = UIColor.darkGrayColor()
        
        self.lblstatus.font = UIFont(name: "GothamRounded-Medium", size:13.0);
        
        
        self.maplocation.frame = CGRectMake(0, 33, screenwidth-20, 107)
        
        self.lbldate.frame = CGRectMake(8, 148, screenwidth-40, 21)
        self.lbldate.font = UIFont(name: "GothamRounded-Medium", size:13.0);
        
        self.lbldescription.frame = CGRectMake(8, 167, screenwidth-40, 37)
        self.lbldescription.textColor = UIColor.darkGrayColor()
        self.lbldescription.font = UIFont(name: "GothamRounded-Book", size:13.0);
        self.lbldescription.numberOfLines = 0;
        
        self.btnmore.frame = CGRectMake(0, 205, screenwidth-20, 56)
        
        self.contentView.addSubview(self.imgstatus)
        self.contentView.addSubview(lblstatus)
        self.contentView.addSubview(maplocation)
        self.contentView.addSubview(lbldate)
        self.contentView.addSubview(lbldescription)
        self.contentView.addSubview(btnmore)
        
        //static views
        let imgmore = UIImageView(image: UIImage(named: "moredetail"))
        imgmore.frame = CGRectMake(8, 214, 25, 25)
        self.contentView.addSubview(imgmore)
        
        let lblmore = UILabel(frame: CGRectMake(40, 216, 223, 21))
        lblmore.text = "More Details"
        lblmore.textColor = UIColor(red: 0, green: 51.0/255.0 , blue: 153.0/255.0, alpha: 1.0)
        self.contentView.addSubview(lblmore)
        
        
        let imgright = UIImageView(image: UIImage(named: "blueright"))
        imgright.frame = CGRectMake(screenwidth-41, 221, 15, 22)
        self.contentView.addSubview(imgright)
        
        
        let lblseperate = UILabel(frame: CGRectMake(0, 205, screenwidth, 1))
        lblseperate.backgroundColor = UIColor.lightGrayColor()
        self.contentView.addSubview(lblseperate)
        
        self.btnmore.addTarget(self, action: "clickDetail:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
     
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        
        
        
        let reuseId = "test"
        
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        if anView == nil {
            
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            
            
            anView!.canShowCallout = true
            anView!.draggable = true
            
        }
            
        else {
            //we are re-using a view, update its annotation reference...
            
            anView!.annotation = annotation
            
        }
        
        
        return anView
        
    }
    
    func clickDetail(sender: AnyObject) {
        delegate?.detailforCell(parentIndex)
        
    }
}
