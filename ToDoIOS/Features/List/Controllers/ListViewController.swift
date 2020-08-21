//
//  ListViewController.swift
//  ToDoIOS
//
//  Created by Marcus on 10/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

//Adicionar o final para dizer que a classe nao tem dependencia para o copilador buildar ela primeiros.
final class ListViewController: UIViewController {

    //weak = relacao fraca - pode vim nil sem impacto
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var fabButton: CircleButton!
    
    var isLandscape: Bool = false {
        didSet{
            animetedView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        isLandscape = traitCollection.horizontalSizeClass == .regular
        configureColletionView(isTransition: isLandscape)
        configureNavegationBar()
        fabButton.isHidden = traitCollection.horizontalSizeClass == .regular

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        //o regular landscape(deitado) & compact é portrait(em pe) para horizontal
        //if newCollection.horizontalSizeClass == .regular {
         //   fabButton.isHidden = true
        //}
        // melhor assim.
        isLandscape =  newCollection.horizontalSizeClass == .regular
        fabButton.isHidden =  isLandscape
        configureColletionView(isTransition: true)
        collectionView.reloadData()
        
    }

}
// MARK: Configuretion methods extension	
extension ListViewController {
        
    private func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        //instancia xib do table view cell
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCellID") // registrando a table view cell
    }
    private func configureColletionView(isTransition: Bool = false){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        var width = view.frame.size.width
        var height = view.frame.size.height
        
        if isTransition{
            width = view.frame.size.height
            height = view.frame.size.width
        }

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((width - 128)/3) , height: height * 0.7)
        collectionView.collectionViewLayout = layout
        
        
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCellID")
    }
    
    // configurar o navegationBar para nao ser exebido.
    private func configureNavegationBar(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func animetedView(){
        self.tableView.isHidden = self.isLandscape
        self.collectionView.isHidden = !self.isLandscape
    }

}

//MARK: Extension para configurar as acoes
extension ListViewController{
    
    @IBAction func buttonBarAdd(_ sender: UIButton) {
        //carregando o storybord
        guard let viewController = UIStoryboard(name: "Add", bundle: nil).instantiateInitialViewController() else {return}
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//MARK: Configuretion Table View Delegate and Data Source
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //inicializacao da table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoDateSource.shared.todos.count
    }
    //carrega dados na table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCellID") as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: TodoDateSource.shared.todos[indexPath.row])
        return cell
    }
    
}
//MARK: Configuretion Collection View Delegate and Data Source
extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TodoModel.ModelType.allTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCellID", for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = TodoModel.ModelType.allTypes[indexPath.row]
        cell.configureCell(model)
        return cell
    }
    
    
}
