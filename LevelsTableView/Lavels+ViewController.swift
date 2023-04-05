//
//  Lavels+ViewController.swift
//  LevelsTableView
//
//  Created by soliduSystem on 03/04/23.
//

import UIKit

class Lavels_ViewController: UIViewController {
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headers.append(contentsOf: self.NivelUno)
        
        tableView.register(UINib(nibName: "Lavels+TableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        tableView.rowHeight = 60
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public let / var
    private var nivel : Int = 1
    private var headers : [String] = ["Automoviles"]
    private var NivelUno : [String] = [1, 2, 3].compactMap({"Uno \($0)"})
    private var NivelDos : [String] = [1, 2, 3, 4].compactMap({"Dos \($0)"})
    private var NivelTres : [String] = [1, 2, 3, 5].compactMap({"Tres \($0)"})
    private var NivelCuatro : [String] = [1, 2, 3, 6, 7].compactMap({"Cuatro \($0)"})
    private var NivelCinco : [String] = [1, 2, 3, 4, 5].compactMap({"Cinco \($0)"})
    
    private var dataSourceColores = [UIColor]()
    
    // MARK: - Private let / var
    
    
    
    // MARK: - IBAction
    
}



// MARK: - Public Func
extension Lavels_ViewController : UITableViewDelegate {
    
}

// MARK: - Private Func
extension Lavels_ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! Lavels_TableViewCell
                
        cell.lable.text = self.headers[indexPath.row]
        let image = ["bmw", "ford", "mini", "nissan"].shuffled().last!
        cell.imageViewLaves.image = UIImage(named: image)
        cell.backgroundColor = .white
        cell.backgroundView?.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row < nivel {
            print(indexPath.row)
            
            
            if indexPath.row == 0 {
                self.headers.removeAll {
                    self.NivelUno.contains($0) ||
                    self.NivelDos.contains($0) ||
                    self.NivelTres.contains($0) ||
                    self.NivelCuatro.contains($0) ||
                    self.NivelCinco.contains($0)
                }
                
                self.headers.append(contentsOf: self.NivelUno)
                self.nivel = 1

                
            } else if indexPath.row == 1 {
                self.headers.removeAll {
                    self.NivelDos.contains($0) ||
                    self.NivelTres.contains($0) ||
                    self.NivelCuatro.contains($0) ||
                    self.NivelCinco.contains($0)
                }
                
                self.headers.append(contentsOf: self.NivelDos)
                self.nivel = 2
            } else if indexPath.row == 2 {
                self.headers.removeAll {
                    self.NivelTres.contains($0) ||
                    self.NivelCuatro.contains($0) ||
                    self.NivelCinco.contains($0)
                }
                
                self.headers.append(contentsOf: self.NivelTres)
                self.nivel = 3
            } else if indexPath.row == 3 {
                self.headers.removeAll {
                    self.NivelCuatro.contains($0) ||
                    self.NivelCinco.contains($0)
                }
                
                self.headers.append(contentsOf: self.NivelCuatro)
                self.nivel = 4
            } else if indexPath.row == 4 {
                self.headers.removeAll {
                    self.NivelCinco.contains($0)
                }
                
                self.headers.append(contentsOf: self.NivelCinco)
                self.nivel = 5
            } else {
                return
            }
            
            tableView.beginUpdates()
            
            tableView.reloadSections(IndexSet(integer: 0), with: .fade)
            
            tableView.endUpdates()
            
            for idx in 1..<self.nivel{
                print(idx)
                if let cell = self.tableView.cellForRow(at: IndexPath(row: idx, section: 0)) {
                    self.dataSourceColores.append(UIColor.random())
                    cell.contentView.backgroundColor = self.dataSourceColores[idx - 1]
                }
            }
            
            
        } else {
            
            if indexPath.row == 0 {
                return
            }
            
            
            
            var array = [String]()
            
            if self.nivel == 1 {
                array = self.NivelUno
            } else if self.nivel == 2 {
                array = self.NivelDos
            } else if self.nivel == 3 {
                array = self.NivelTres
            } else if self.nivel == 4 {
                array = self.NivelCuatro
            } else if self.nivel == 5 {
                array = self.NivelCinco
            } else {
                return
            }
            
            let indexPathsToDelete = self.headers.enumerated().filter { idx, element in
                
                if  array[indexPath.row - self.nivel] == element {
                    return false
                }
                
                return array.contains(element)
            }.compactMap { idx, element in
                return IndexPath(row: idx, section: indexPath.section)
            }
            
            self.headers.removeAll { String in
                if  array[indexPath.row - self.nivel] == String {
                    return false
                }
                
                return array.contains(String)
            }
            
            
            UIView.animate(withDuration: 0.5) {
                tableView.beginUpdates()
                
                tableView.deleteRows(at: indexPathsToDelete, with: .top)

                tableView.endUpdates()
            } completion: { Bool in
                
                self.nivel += 1

                if self.nivel == 1 {
                    array = self.NivelUno
                } else if self.nivel == 2 {
                    array = self.NivelDos
                } else if self.nivel == 3 {
                    array = self.NivelTres
                } else if self.nivel == 4 {
                    array = self.NivelCuatro
                } else if self.nivel == 5 {
                    array = self.NivelCinco
                }

                self.headers.append(contentsOf: array)
                
                let indexPathsToInsert = array.enumerated().compactMap({ idx, elemetn in
                    return IndexPath(row: (self.nivel + idx), section: 0)
                })
                
                UIView.animate(withDuration: 0.5) {
                    tableView.beginUpdates()
                    
                    tableView.insertRows(at: indexPathsToInsert, with: .fade)
                    
                    tableView.endUpdates()
                    
                    for idx in 1..<self.nivel{
                        print(idx)
                        if let cell = self.tableView.cellForRow(at: IndexPath(row: idx, section: 0)) {
                            self.dataSourceColores.append(UIColor.random())
                            cell.contentView.backgroundColor = self.dataSourceColores[idx - 1]
                        }
                    }
                }
            }

            
            
        


            
            
            
            
        }
        
        
    }
    
    
}

// MARK: - Services
extension Lavels_ViewController {
    
}

// MARK: - Other
extension Lavels_ViewController {
    
}


extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
