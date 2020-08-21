//
//  CircleImageView.swift
//  ToDoIOS
//
//  Created by Marcus on 12/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

// Criar um class extend da UIImageView para criar o circulo na imagem
final class CircleImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.height / 2
    }
}
