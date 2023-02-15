import UIKit

class LaunchScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
            self.present(nextVC, animated: true, completion: nil)
        }
    }
}
