
import UIKit

class InfoViewController: UIViewController {
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        
        button.backgroundColor = .systemTeal
        button.frame = CGRect (x: 40, y: 250, width: 200, height: 44)
        button.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.setTitle("ПРЕДУПРЕЖДЕНИЕ", for: .normal)
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Предупреждение", message: "Может возникнуть ошибка", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Продолжить", style: .destructive) { _ in
            print("Продолжить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func tap() {
        self.dismiss(animated: true, completion: nil)
        
    }

}
