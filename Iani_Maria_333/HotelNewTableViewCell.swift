//
//  HotelNewTableViewCell.swift
//  Iani_Maria_333
//
//  Created by user216460 on 5/8/22.
//

import UIKit
import SDWebImage

final class HotelNewTableViewCell: UITableViewCell {
    static let cellId = "HotelNewTableViewCell"
    
    let hotel = UILabel()
    let best_price = UILabel()
    let accesrroyImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func setUp(with model: Comparison) {
            hotel.text = model.Hotel
            best_price.text = model.best_price
            //let url = URL(string: model.itemName)
            //accesrroyImageView.sd_setImage(with: url, completed: nil)
        }
    
    override var reuseIdentifier: String? {
        return HotelNewTableViewCell.cellId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HotelNewTableViewCell {
    func configure() {
        hotel.font = UIFont.systemFont(ofSize: 17)
        hotel.numberOfLines = 2
        best_price.font = UIFont.systemFont(ofSize: 12)
        best_price.numberOfLines = 1
        
        best_price.textColor = UIColor.secondaryLabel
        //accesrroyImageView.tintColor = UIColor.secondaryLabel
        //accesrroyImageView.contentMode = .scaleAspectFit
        //accesrroyImageView.image = UIImage(systemName: "arrowtriangle.right")
        //accesrroyImageView.clipsToBounds = true
        
        
        contentView.addSubview(hotel)
        contentView.addSubview(best_price)
        //contentView.addSubview(accesrroyImageView)
        
        hotel.translatesAutoresizingMaskIntoConstraints = false
        hotel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        hotel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        
        
        best_price.translatesAutoresizingMaskIntoConstraints = false
        best_price.topAnchor.constraint(equalTo: hotel.bottomAnchor, constant: 5).isActive = true
        best_price.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        best_price.rightAnchor.constraint(equalTo: hotel.rightAnchor, constant: -5).isActive = true
        best_price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        //accesrroyImageView.translatesAutoresizingMaskIntoConstraints = false
        //accesrroyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        //accesrroyImageView.leftAnchor.constraint(equalTo: hotel.rightAnchor, constant: 10).isActive = true
        //accesrroyImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        //accesrroyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        //accesrroyImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        //accesrroyImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}

