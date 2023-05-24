import Foundation
import UIKit

final class ConnectView: UIView {
    let tableView = UITableView()

    let qrCodeView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()

    let copyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Copy", for: .normal)
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()

    let connectWalletButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Connect Trust Wallet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    let connectWallet2Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Connect Imtoken Wallet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    let connectWallet3Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Connect Rainbow Wallet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()

    let invisibleUriLabel: UILabel = { 
        let label = UILabel(frame: CGRect(origin: .zero, size: .init(width: 1, height: 1)))
        label.numberOfLines = 0
        label.textColor = .clear
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(qrCodeView)
        addSubview(invisibleUriLabel)
        addSubview(copyButton)
        addSubview(connectWalletButton)
        addSubview(connectWallet2Button)
        addSubview(connectWallet3Button)
        addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "pairing_cell")
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            qrCodeView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            qrCodeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            qrCodeView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            qrCodeView.widthAnchor.constraint(equalTo: qrCodeView.heightAnchor),

            copyButton.topAnchor.constraint(equalTo: qrCodeView.bottomAnchor, constant: 10),
            copyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            copyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            copyButton.heightAnchor.constraint(equalToConstant: 44),

            connectWalletButton.topAnchor.constraint(equalTo: copyButton.bottomAnchor, constant: 10),
            connectWalletButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            connectWalletButton.widthAnchor.constraint(equalTo: copyButton.widthAnchor),
            connectWalletButton.heightAnchor.constraint(equalToConstant: 44),
            
            connectWallet2Button.topAnchor.constraint(equalTo: connectWalletButton.bottomAnchor, constant: 10),
            connectWallet2Button.centerXAnchor.constraint(equalTo: centerXAnchor),
            connectWallet2Button.widthAnchor.constraint(equalTo: connectWalletButton.widthAnchor),
            connectWallet2Button.heightAnchor.constraint(equalToConstant: 44),
            
            connectWallet3Button.topAnchor.constraint(equalTo: connectWallet2Button.bottomAnchor, constant: 10),
            connectWallet3Button.centerXAnchor.constraint(equalTo: centerXAnchor),
            connectWallet3Button.widthAnchor.constraint(equalTo: connectWallet2Button.widthAnchor),
            connectWallet3Button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
