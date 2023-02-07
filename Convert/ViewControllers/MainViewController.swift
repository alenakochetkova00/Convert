
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    var flag = [String]()
    var name = [String]()
    var code = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStorage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func dataStorage() {
        if UserDefaults.standard.object(forKey: "flag") != nil {
            flag = UserDefaults.standard.object(forKey: "flag") as! [String]
        }
        if UserDefaults.standard.object(forKey: "name") != nil {
            name = UserDefaults.standard.object(forKey: "name") as! [String]
        }
        if UserDefaults.standard.object(forKey: "code") != nil {
            code = UserDefaults.standard.object(forKey: "code") as! [String]
        }
    }
    
    @IBAction func editButtonClick(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        if tableView.isEditing {
            editButton.title = "Ok"
        } else {
            editButton.title = "Edit"
        }
    }
    
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOnMainScreen", for: indexPath) as! MainTableViewCell
        
        cell.flag.text = flag[indexPath.row]
        cell.nameCountries.text = name[indexPath.row]
        cell.codeCountries.text = code[indexPath.row]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let selectedItemFlag = flag[sourceIndexPath.row]
        flag.remove(at: sourceIndexPath.row)
        flag.insert(selectedItemFlag, at: destinationIndexPath.row)
        
        let selectedItemName = name[sourceIndexPath.row]
        name.remove(at: sourceIndexPath.row)
        name.insert(selectedItemName, at: destinationIndexPath.row)
        
        let selectedItemCode = code[sourceIndexPath.row]
        code.remove(at: sourceIndexPath.row)
        code.insert(selectedItemCode, at: destinationIndexPath.row)
        
        UserDefaults.standard.setValue(flag, forKey: "flag")
        UserDefaults.standard.setValue(name, forKey: "name")
        UserDefaults.standard.setValue(code, forKey: "code")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        flag.remove(at: indexPath.row)
        name.remove(at: indexPath.row)
        code.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        UserDefaults.standard.setValue(flag, forKey: "flag")
        UserDefaults.standard.setValue(name, forKey: "name")
        UserDefaults.standard.setValue(code, forKey: "code")
    }

}
