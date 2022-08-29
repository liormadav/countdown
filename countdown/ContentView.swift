//
//  ContentView.swift
//  countdown
//
//  Created by lior madav on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var countDownTimer = 5
    @State var lastCountDownTimer = 5
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    the timer variable is let type because its changing every second
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .opacity(0.95)
        
        VStack{
            Text("\(countDownTimer)")
                .onReceive(timer) { _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }
                .foregroundColor(.white)
                .font(.system(size: 80, weight: .bold))
                .opacity(0.80)
            
            HStack(spacing: 30){
                Button("Start"){
                    timerRunning = true
                }
                
                Button("Stop"){
                    timerRunning = false
                }

                Button("Reset"){
                    countDownTimer = 5
                    lastCountDownTimer = 5
                }.foregroundColor(.red)

                Button("Last count down"){
                    countDownTimer = lastCountDownTimer
                }.foregroundColor(.red)
                

            }
            HStack(spacing: 50){
                Button("+5"){
                    countDownTimer += 5
                    lastCountDownTimer = countDownTimer
                }
                .foregroundColor(.green)
                .padding()
                .font(.system(size: 23, weight: .bold))
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
