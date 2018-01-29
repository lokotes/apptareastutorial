//
//  ViewController.swift
//  apptareastuto
//
//  Created by MacAMP on 26/01/18.
//  Copyright © 2018 MacAMP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, ExerciseTableViewCellDelegate {
    
    
    func didPressHeartButton(sender: UIButton) {
        print("select")
        
    }
    var tareas = [Tarea]()
    @IBOutlet weak var tablatareas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablatareas.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTask(_ sender: Any) {
        //Creamos el UIAlertController
        let alert = UIAlertController(title: "Nueva Tarea",
                                      message: "Añade una nueva tarea",
                                      preferredStyle: .alert)
        
        //Creamos el UIAlertAction que nos permitirá guardar la tarea
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        //Guardamos el texto del textField en el array tasks y recargamos la table view
                                        let textField = alert.textFields!.first
                                        self.tareas.append(Tarea(1,textField!.text!,"Sin hacer"))
                                        //self.tasks.append(textField!.text!)
                                        self.tablatareas.reloadData()
        })
        //Creamos el UIAlertAction que nos permitirá cancelar
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default) { (action: UIAlertAction) -> Void in}
        
        alert.addTextField{
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablatareas.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell
        cell.nrofila = indexPath.row
        let tarea = tareas[indexPath.row]
        cell.labelCell.text = tarea.descripcion
        cell.labelestado.text = tarea.estado
        
        cell.delegate = self as? ExerciseTableViewCellDelegate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            
            // remove the item from the data model
            //let tarea = tareas[indexPath.row]
            tareas.remove(at: indexPath.row)
            //tasks.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }*/
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        /*let rateAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Rate") { (action , indexPath ) -> Void in
            self.isEditing = false
            print("Rate button pressed")
        }
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Share") { (action , indexPath) -> Void in
            self.isEditing = false
            print("Share button pressed")
        }
        return [rateAction, shareAction]*/
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Deletee" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
        })
        return [deleteAction]
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("select", indexPath.row)
    }*/
    /*func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        <#code#>
    }*/
    /*extension ViewController: ExerciseTableViewCellDelegate {
        func didPressHeartButton(sender: UIButton) {
            // Implementas tu código y la acción que desees realizar con el botón.
        }
    }*/
    
}

