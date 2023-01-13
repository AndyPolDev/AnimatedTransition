import UIKit

final class FirstViewController: UIViewController {
    
    private lazy var presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("GO", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(presentButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var transition = CircularTrancsition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        presentButton.layer.cornerRadius = presentButton.frame.width / 2
    }
        
    private func setupViews() {
        title = "FirstViewController"
        view.backgroundColor = .white
        
        view.addView(presentButton)
    }
    
    @objc private func presentButtonPressed() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .custom
        secondViewController.transitioningDelegate = self
        present(secondViewController, animated: true)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension FirstViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor ?? .red
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor ?? .red
        return transition
    }
}

// MARK: - Set Constraints

extension FirstViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 60),
            presentButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
