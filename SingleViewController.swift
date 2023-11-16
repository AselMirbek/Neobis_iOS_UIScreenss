//
//  SingleViewController.swift
//  Neobis_iOS_UIScreenss
//
//  Created by Interlink on 15/11/23.
//

import UIKit

class SingleViewController: UIViewController {
   private let tableImageView: [UIImage] = [
        UIImage(named: "bookSingle")!,
        UIImage(named: "book1Single")!,
        UIImage(named: "bookSingle")!,
        UIImage(named: "book1Single")!
    ]

    // tableeView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(SingleTableViewCell.self, forCellReuseIdentifier: SingleTableViewCell.identifier)
        return tableView
    }()

    private lazy var customTabBar: BottomTabBar = {
            let tabBar = BottomTabBar()
            return tabBar
        }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()

    private lazy var topNavigationBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        return view
    }()

    private lazy var topBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.frame = CGRect(x: topNavigationBar.frame.width - 100, y: 0, width: 100, height: 44)
        button.addTarget(self, action: #selector(topBarButtonTapped), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        addCustomTabBar()
        self.setUpUITableView()
      self.tableView.delegate = self
       self.tableView.dataSource = self
    }
    private func addCustomTabBar() {
            // Добавьте таб-бар в иерархию представлений
            addChild(customTabBar)
            view.addSubview(customTabBar.view)
            customTabBar.view.translatesAutoresizingMaskIntoConstraints = false

            // Установите констрейнты для таб-бара (пример)
            NSLayoutConstraint.activate([
                customTabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customTabBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                customTabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                customTabBar.view.heightAnchor.constraint(equalToConstant: 100) // Регулируйте высоту по вашему желанию
            ])

            // Завершите добавление таб-бара
            customTabBar.didMove(toParent: self)
        }
    private func setupUI() {
        addBackgroundView()
        addTopNavigationBar()
       // addBottomBar()
    }

  private func setUpUITableView() {
        self.view.backgroundColor = .systemRed
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topNavigationBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

    private func addBackgroundView() {
        let parent = self.view!
        parent.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }

    private func addTopNavigationBar() {
        topNavigationBar.addSubview(topBarButton)
        view.addSubview(topNavigationBar)

        // Use safeAreaLayoutGuide to adjust the topNavigationBar
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        topNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        topNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        topNavigationBar.topAnchor.constraint(equalTo: view.topAnchor),
        topNavigationBar.heightAnchor.constraint(equalToConstant: 70)
       ])
    }

    private func createIconImageView(imageName: String, frame: CGRect) -> UIImageView {
        let iconImageView = UIImageView()
        let iconImage = UIImage(named: imageName)
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = frame
        iconImageView.layer.cornerRadius = 4
        return iconImageView
    }

    @objc private func topBarButtonTapped() {
        // Handle top bar button tap
    }
}

extension SingleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableImageView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SingleTableViewCell.identifier, for: indexPath) as? SingleTableViewCell else {
            fatalError("The TableView could not dequeue a SingleTableViewCell in SingleViewController.")
        }

        let image = self.tableImageView[indexPath.row]
            var title = ""
            var description = ""

            switch indexPath.row {
            case 0:
                title = "SOS"
                description = "Mini meltdown? Get some Headspace in a hurry"
            case 1:
                title = "ON the GO"
                description = "Mindful living? Get your Headspace to go"
            case 2:
                title = "Classic"
                description = "Like it simple? Get some extra Headspace"
            case 3:
                title = "SOS"
                description = "Mini meltdown? Get some Headspace in a hurry"
            default:
                break
            }
        cell.configure(with: image, title: title, description: description)
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

