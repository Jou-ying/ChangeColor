//
//  ViewController.swift
//  ChangeColor
//
//  Created by zoeli on 2020/5/8.
//  Copyright © 2020 zoeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var skyImageView: UIImageView!
    @IBOutlet weak var skyBackGroundView: UIView!
    
    
    @IBOutlet weak var trafficLightImageView: UIImageView!
    
    @IBOutlet weak var trafficLightView_red: UIView!
    @IBOutlet weak var trafficLightView_yellow: UIView!
    @IBOutlet weak var trafficLightView_green: UIView!
    
    
    @IBOutlet weak var roadImageView: UIImageView!
    @IBOutlet weak var roadBackGroundView: UIView!
    
    
    @IBOutlet weak var pigImageView: UIImageView!
    
    
    // changeColor
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // sky
    @IBOutlet weak var changeColorView_sky: UIView!
    @IBOutlet weak var skySlider_red: UISlider!
    @IBOutlet weak var skySlider_green: UISlider!
    @IBOutlet weak var skySlider_blue: UISlider!
    @IBOutlet weak var skySlider_alpha: UISlider!
    @IBOutlet weak var skyValue_red: UILabel!
    @IBOutlet weak var skyValue_green: UILabel!
    @IBOutlet weak var skyValue_blue: UILabel!
    @IBOutlet weak var skyValue_alpha: UILabel!
    
    
    // strafficLight
    @IBOutlet weak var changeColorView_strafficLight: UIView!
    @IBOutlet weak var strafficLight_randomColor: UIButton!
    

    // road
    @IBOutlet weak var changeColorView_road: UIView!
    @IBOutlet weak var roadSliderLeft_red: UISlider!
    @IBOutlet weak var roadSliderLeft_green: UISlider!
    @IBOutlet weak var roadSliderLeft_blue: UISlider!
    @IBOutlet weak var roadSliderLeft_alpha: UISlider!
    
    @IBOutlet weak var roadSliderRight_red: UISlider!
    @IBOutlet weak var roadSliderRight_green: UISlider!
    @IBOutlet weak var roadSliderRight_blue: UISlider!
    @IBOutlet weak var roadSliderRight_alpha: UISlider!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 顯示動畫
        let animatedImage = UIImage.animatedImageNamed("da83b9d6ff6c4cffc45a923a58fc31ecbTktmjPnuJdSKhG2-", duration: 3)
        pigImageView.image = animatedImage
        
        
    }
    
    
    
    
    // MARK: - 更換下方改變顏色區塊
    @IBAction func selectChangeColorView(_ sender: Any) {
        
        if self.segmentedControl.selectedSegmentIndex == 0 {
            
            self.changeColorView_sky.isHidden = false
            self.changeColorView_strafficLight.isHidden = true
            self.changeColorView_road.isHidden = true
            
        }else if self.segmentedControl.selectedSegmentIndex == 1 {
            
            self.changeColorView_sky.isHidden = true
            self.changeColorView_strafficLight.isHidden = false
            self.changeColorView_road.isHidden = true
            
        }else if self.segmentedControl.selectedSegmentIndex == 2 {
            
            self.changeColorView_sky.isHidden = true
            self.changeColorView_strafficLight.isHidden = true
            self.changeColorView_road.isHidden = false
            
        }
        
    }
    
    
    
    // MARK: - 更換天空顏色
    @IBAction func changeSkyColor(_ sender: UISlider) {
    
        // String(format: "%.f", colorValue) 取到小數第一位
        
        self.skyValue_red.text = String(format: "%.f", CGFloat(self.skySlider_red.value))
        self.skyValue_green.text = String(format: "%.f", CGFloat(self.skySlider_green.value))
        self.skyValue_blue.text = String(format: "%.f", CGFloat(self.skySlider_blue.value))
        self.skyValue_alpha.text = String(format: "%.f", CGFloat(self.skySlider_alpha.value))
        
        self.skyBackGroundView.backgroundColor = UIColor(red: CGFloat(self.skySlider_red.value), green: CGFloat(self.skySlider_green.value), blue: CGFloat(self.skySlider_blue.value), alpha: CGFloat(self.skySlider_alpha.value))
    }
    
    
    
    
    // MARK: - 更改紅綠燈顏色(亂數)
    @IBAction func changeTrafficLightColor(_ sender: UIButton) {
        
        self.trafficLightView_red.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        
         self.trafficLightView_yellow.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        
         self.trafficLightView_green.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        
    }
    
    
    
    // MARK: - 更改馬路顏色(漸層)
    
    @IBAction func changeRoadColor(_ sender: UISlider) {
        
        let leftColor = UIColor(red: CGFloat(self.roadSliderLeft_red.value), green: CGFloat(self.roadSliderLeft_green.value), blue: CGFloat(self.roadSliderLeft_blue.value), alpha: CGFloat(self.roadSliderLeft_alpha.value))
        
        let rightColor = UIColor(red: CGFloat(self.roadSliderRight_red.value), green: CGFloat(self.roadSliderRight_green.value), blue: CGFloat(self.roadSliderRight_blue.value), alpha: CGFloat(self.roadSliderRight_alpha.value))
        
        // 繪製漸層效果圖層
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.roadBackGroundView.bounds
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        
        //斜角漸層
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    
        self.roadBackGroundView.layer.addSublayer(gradientLayer)
        
    }
    
}

