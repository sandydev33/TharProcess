//
//  ChartColCell.swift
//  TharTrack
//
//  Created by Esoft on 17/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit
import Charts
//import SwiftCharts
class ChartColCell: UICollectionViewCell {
   
  
    @IBOutlet weak var chartView: UIView!
    var numbers : [Double] = []
   @IBOutlet weak var chtChart: LineChartView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        numbers = [0,3,4,6,8,10]
       self.updateGraph()
    }


    
    

    
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.



        //here is the for loop
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry

            lineChartEntry.append(value) // here we add it to the data set
        }

        let line1 = LineChartDataSet(entries: lineChartEntry, label: "") //Here we convert lineChartEntry to a LineChartDataSet

        line1.mode = (line1.mode == .cubicBezier) ? .linear : .cubicBezier
        line1.drawIconsEnabled = false
        
        line1.lineDashLengths = [5, 2.5]
        line1.highlightLineDashLengths = [5, 2.5]
        line1.setColor(.black)
        line1.setCircleColor(.black)
        line1.lineWidth = 1
        line1.circleRadius = 3
        line1.drawCircleHoleEnabled = false
        line1.valueFont = .systemFont(ofSize: 9)
        line1.formLineDashLengths = [5, 2.5]
        line1.formLineWidth = 1
      //  line1.formSize = 15
        
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        line1.fillAlpha = 1
        line1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        line1.drawFilledEnabled = true
        
        
      //  line1.colors = [NSUIColor.blue] //Sets the colour to blue


        let data = LineChartData() //This is the object that will be added to the chart

        data.addDataSet(line1) //Adds the line to the dataSet

        chtChart.backgroundColor = UIColor.white
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update

       // chtChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph

    }
    
    
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
      //  label.text = "x: \(x)     y: \(yValues)"
    }
}
