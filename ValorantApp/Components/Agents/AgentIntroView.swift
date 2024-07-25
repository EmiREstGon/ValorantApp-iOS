//
//  AgentIntroView.swift
//  ValorantApp
//
//  Created by Emilio Rafael Estévez González on 22/7/24.
//

import SwiftUI
import AVKit

struct AgentIntroView: View {
    @State private var opacity: Double = 0.0
    @Binding var agent: Agent

    var body: some View {
        AgentIntroPlayer(agent: agent)
            .edgesIgnoringSafeArea(.all)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.25)) {
                    opacity = 1.0
                }
            }
    }
}

struct AgentIntroPlayer: UIViewControllerRepresentable {
    var agent: Agent

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = AgentIntroViewController()
        viewController.agent = agent
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No need to update anything
    }
}

class AgentIntroViewController: UIViewController {
    
    var agent: Agent!
    var showIntro: Binding<Bool>!
    private var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoPlayer()
        player?.play()
    }
    
    private func setupVideoPlayer() {
        guard let videoPath = Bundle.main.path(forResource: "intro\(agent.displayName)", ofType: "mp4") else {
            debugPrint("intro\(agent.displayName).mp4 not found")
            transitionToMainView()
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
        transitionToMainView()
    }
    
    private func transitionToMainView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            let contentView = UIHostingController(rootView: AgentDetailView(agent: .constant(agent))).view!
            contentView.alpha = 0
            window.addSubview(contentView)
            contentView.frame = window.bounds
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.view.alpha = 0
                contentView.alpha = 1
            }) { _ in
                window.rootViewController = UIHostingController(rootView: AgentDetailView(agent: .constant(self.agent)))
                window.makeKeyAndVisible()
            }
        }
    }
}
