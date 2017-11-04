//
//  ArcView.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 01/11/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

class ArcView: UIView {

    // MARK: View

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(Constants.lockBorderWidth)
        context?.setStrokeColor(.lockBorderColor)

        let bigRadius = CGFloat(39.5)

        let arcCenter = CGPoint(x: bigRadius + 1.0, y: bigRadius + 1.0)

        let path = CGMutablePath()

        let smallRadius = CGFloat(22.5)

        let delta = CGFloat(7.0)
        path.addArc(center: arcCenter, radius: bigRadius, startAngle: 0.0, endAngle: .pi, clockwise: true)
        path.addLine(to: CGPoint(x: arcCenter.x - bigRadius, y: arcCenter.y + delta))
        path.addLine(to: CGPoint(x: arcCenter.x - smallRadius, y: arcCenter.y + delta))
        path.addArc(center: arcCenter, radius: smallRadius, startAngle: .pi, endAngle: 0.0, clockwise: false)
        path.addLine(to: CGPoint(x: arcCenter.x + smallRadius, y: arcCenter.y + delta + 20.0))
        path.addLine(to: CGPoint(x: arcCenter.x + bigRadius, y: arcCenter.y + delta))
        path.closeSubpath()
        context?.addPath(path)
        context?.strokePath()
    }

}
