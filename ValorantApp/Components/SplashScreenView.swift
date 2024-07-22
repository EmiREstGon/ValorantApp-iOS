//
//  SplashScreenView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 22/7/24.
//

import SwiftUI
import AVKit

struct SplashScreenView: View {
    @State private var opacity: Double = 0.0

    var body: some View {
        SplashScreenPlayer()
            .edgesIgnoringSafeArea(.all)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.325)) {
                    opacity = 1.0
                }
            }
    }
}

struct SplashScreenPlayer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        SplashScreenViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No need to update anything
    }
}

class SplashScreenViewController: UIViewController {
    
    private var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoPlayer()
        player?.play()
    }
    
    private func setupVideoPlayer() {
        guard let videoPath = Bundle.main.path(forResource: "valorantSplash", ofType: "mp4") else {
            debugPrint("valorantSplash.mp4 not found")
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: videoPath))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinish(_:)),
                                               name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    @objc private func videoDidFinish(_ notification: Notification) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            let contentView = UIHostingController(rootView: ContentView()).view!
            contentView.alpha = 0
            window.addSubview(contentView)
            contentView.frame = window.bounds
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.view.alpha = 0
                contentView.alpha = 1
            }) { _ in
                window.rootViewController = UIHostingController(rootView: ContentView())
                window.makeKeyAndVisible()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
