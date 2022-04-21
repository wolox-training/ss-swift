//
//  SuggestBookViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/04/2022.
//

import UIKit

final class SuggestBookViewController: UIViewController, UINavigationControllerDelegate {
    private let suggestBookView = SuggestBookView()
    private let imagePickerController = UIImagePickerController()
    private let suggestBookViewModel: SuggestBookViewProtocol
    
    init(suggestBookViewModel: SuggestBookViewModel) {
        self.suggestBookViewModel = suggestBookViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        suggestBookView.onAddNewButton = addImage
        suggestBookView.onSubmitButton = submitSuggestion
    }
    
    override func loadView() {
        view = suggestBookView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        suggestBookView.submitButton.applyGradient()
    }
    
    private func setUpNavBar() {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        title.text = "SUGGEST_BOOK_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = .backgroundNavBar

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
    
    func addImage() {
        chooseImageUbicationAlert()
    }
    
    func submitSuggestion() {
        if suggestBookView.checkFieldsNotEmpty() {
            suggestBookViewModel.getParametersBook(author: suggestBookView.bookAuthor.text!,
                                  title: suggestBookView.bookName.text!,
                                  genre: suggestBookView.bookGenre.text!,
                                  year: suggestBookView.bookYear.text!)
            suggestBookViewModel.suggestBook { error in
                if error != nil {
                    self.showAlertTextFields(title: "NEW_BOOK_SUGGESTED".localized(),
                                             message: "NEW_BOOK_SUGGESTED_MESSAGE".localized())
                    self.suggestBookView.resetForm()
                } else {
                    self.showAlertTextFields(title: "SOMETHING_WRONG".localized(),
                                             message: "SOMETHING_WRONG_MESSAGE".localized())
                    self.suggestBookView.resetForm()
                }
            }
        } else {
            showAlertTextFields(title: "INCOMPLETE_FORM".localized(), message: "INCOMPLETE_FORM_MESSAGE".localized())
        }
    }

    func showAlertTextFields(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK".localized(), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SuggestBookViewController: UIImagePickerControllerDelegate {
    
    func chooseImageUbicationAlert() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        let chooseAction = UIAlertAction(title: "GALLERY".localized(), style: .default) { _ in
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: "CAMERA".localized(), style: .default) {_ in
                self.imagePickerController.delegate = self
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }
        let cancelAction = UIAlertAction(title: "CANCEL".localized(), style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: .none)
    }
    
    func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                                  info: [ UIImagePickerController.InfoKey: Any ] ) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        suggestBookView.bookImage.image = image
    }
}
