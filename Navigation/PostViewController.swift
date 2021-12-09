

import UIKit

class PostViewController: UIViewController {
    var text: String?
    let button = UIButton()
    var postOld: PostOld?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = postOld?.title
        
        self.view.backgroundColor = .systemPink
        
        button.backgroundColor = .systemYellow
        button.frame = CGRect (x: 40, y: 250, width: 200, height: 44)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
        button.setTitle(text, for: .normal)
        
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Alert", style: UIBarButtonItem.Style.done, target: self, action: #selector(PostViewController.doneButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func tap() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func doneButtonClicked(_ button:UIBarButtonItem!){
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
        infoVC.modalPresentationStyle = .fullScreen
        infoVC.modalTransitionStyle = .flipHorizontal
    }

}
