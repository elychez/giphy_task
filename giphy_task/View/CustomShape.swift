//
//  CustomShape.swift
//  giphy_task
//
//  Created by Elcins on 11/01/2023.
//

import SwiftUI

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
