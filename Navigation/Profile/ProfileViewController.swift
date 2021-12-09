
import UIKit


class ProfileViewController: UIViewController {
    
    
    private lazy var postsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    private lazy var headerView: UIView  = {
        let headerView = ProfileHeaderView().self
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    
        private func setupUI() {
        view.addSubview(headerView)
        view.addSubview(postsTableView)
            
        let constraints = [

            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            postsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}



extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { return .zero }
        return Post.samplePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0,
              let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: Post.samplePosts[indexPath.row])
        return cell
    }

}
/*
 // хедер скролится
 
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return headerView
    }

    */

 // тут пропадает фон на хедере
 /*
 extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if  section == 0 {
            let headerView = ProfileHeaderView(frame: .zero)
        return headerView
    }
        return nil
    }
*/
     // experiment'
     
     extension ProfileViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
             guard section == 0 else {return nil}
            let headerView = ProfileHeaderView(frame: .zero)
            return headerView
            }
            
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return .zero }
        return UITableView.automaticDimension
    }
    
    func tableView(_tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    



/*class ProfileViewController: UIViewController {
    let postOld: PostOld = PostOld(title: "Profile")
    private let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = postOld.title
        self.view.backgroundColor = .lightGray
        view.addSubview(headerView)
        setupBottomButton()
        }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        

    }
    private func newSubview() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    private func setupBottomButton() {

        let bottomButton = UIButton(type: .system)
        view.addSubview(bottomButton)
        
        bottomButton.backgroundColor = .darkGray
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.setTitle("My Posts", for: .normal)

        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}
*/
