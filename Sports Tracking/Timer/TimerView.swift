//
//  TimerView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 01.02.2024.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    @State private var timeRemaining = 60
    @State private var timeRemainingConstant = 60
    @State private var timer: Timer?
    @State private var isRunning: Bool = false
    @State private var isSound: Bool = true
    @State private var audioPlayer: AVAudioPlayer?
    @State private var hourglassRotation: Double = 0
    @State private var buttonStartIsActive = true
    
    let secondsArray = [10, 30, 60, 90, 120, 180]
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                Circle()
                    .trim(from: 0, to: (CGFloat(1.0 - (Double(timeRemaining) / Double(timeRemainingConstant)))))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .foregroundStyle(.white)
                Text(formattedTime())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                ZStack {
                    Image(systemName: "hourglass.bottomhalf.filled")
                        .opacity(hourglassRotation > 90 && hourglassRotation <= 270 ? 0 : 1)
                        .foregroundStyle(.white)
                    
                    Image(systemName: "hourglass.tophalf.filled")
                        .opacity(hourglassRotation > 90 && hourglassRotation <= 270 ? 1 : 0)
                        .foregroundStyle(.white)
                }
                .font(.title)
                .rotation3DEffect(.degrees(hourglassRotation), axis: (x: 0, y: 0, z: 180))
                .offset(y: 90)
            }
            .frame(maxWidth: 500)
            HStack {
                Button {
                    isRunning.toggle()
                    if isRunning {
                        startTimer()
                        startHourglassAnimation()
                    } else {
                        stopTimer()
                    }
                } label: {
                    Image(systemName: isRunning ? "stop.fill" : "play.fill")
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .font(.largeTitle)
                        .padding()
                }
            }
            Picker("How long?", selection: $timeRemainingConstant) {
                ForEach(secondsArray, id: \.self) { time in
                    Text("\(time)")
                }
            }
            .foregroundStyle(.white)
            .pickerStyle(.segmented)
            .onChange(of: timeRemainingConstant) {
                timeRemaining = timeRemainingConstant
            }
            .onChange(of: timeRemaining) {
                if timeRemaining == 0 {
                    compliteTimer()
                }
            }
        }
        .padding(.horizontal, 30)
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if isRunning {
                    Button {
                        isSound.toggle()
                        playAudio(shouldPlay: isSound)
                    } label: {
                        Image(systemName: isSound ? "speaker.wave.1.fill" : "speaker.slash.fill")
                            .foregroundStyle(.foreground)
                            .frame(width: 20, height: 20)
                    }
                } else {
                    Image(systemName: "speaker.slash.fill")
                        .foregroundStyle(.foreground)
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
    
    func formattedTime() -> String {
        let minutes = Int(timeRemaining) / 60
        let second = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    private func startHourglassAnimation() {
        if isRunning {
            withAnimation(.linear(duration: 1)) {
                hourglassRotation += 180
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                startHourglassAnimation()
            }
        }
    }
    private func startTimer() {
        playAudio(shouldPlay: isSound)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                playDone(shouldPlay: true)
            }
        }
    }
    private func stopTimer() {
        hourglassRotation = 0
        timer?.invalidate()
        isRunning = false
        audioPlayer?.stop()
    }
    private func compliteTimer() {
        hourglassRotation = 0
        timer?.invalidate()
        timeRemaining = timeRemainingConstant
        isRunning = false
        audioPlayer?.stop()
    }
    private func playAudio(shouldPlay: Bool) {
        if shouldPlay {
            if let url = Bundle.main.url(forResource: "music", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                } catch {
                    print("Не удалось воспроизвести аудио")
                }
            } else {
                print("Не удалось найти аудиофайл")
            }
        } else {
            audioPlayer?.pause()
        }
    }
    private func playDone(shouldPlay: Bool) {
        if shouldPlay {
            if let url = Bundle.main.url(forResource: "done_sound", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                } catch {
                    print("Не удалось воспроизвести аудио")
                }
            } else {
                print("Не удалось найти аудиофайл")
            }
        } else {
            audioPlayer?.stop()
        }
    }
}

#Preview {
    TimerView()
}
