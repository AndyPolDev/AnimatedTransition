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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        presentButton.layer.cornerRadius = presentButton.frame.width / 2
    }

    private func setupViews() {
        title = "FirstViewController"
        view.backgroundColor = .white
        
        view.addView(presentButton)
    }

    @objc private func presentButtonPressed() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
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
