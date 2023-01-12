import UIKit

final class SecondViewController: UIViewController {

    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("X", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        dismissButton.layer.cornerRadius = dismissButton.frame.width / 2
    }

    private func setupViews() {
        title = "SecondViewController"
        view.backgroundColor = .red
        
        view.addView(dismissButton)
    }

    @objc private func dismissButtonPressed() {
        dismiss(animated: true)
    }
}

// MARK: - Set Constraints

extension SecondViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 60),
            dismissButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
