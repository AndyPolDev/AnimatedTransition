import UIKit

final class ViewController: UIViewController {
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentButton.layer.cornerRadius = presentButton.frame.width / 2
    }
    
    private func setupViews() {
        title = "FirstViewController"
        view.backgroundColor = .white
    }
    
    @objc private func presentButtonPressed() {
        print("presentButtonPressed")
    }
}
