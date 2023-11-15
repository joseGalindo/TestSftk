//
//  HomeViewControllerTest.swift
//  CoppelTests
//
//  Created by Jose Galindo Martinez on 11/14/23.
//

import XCTest
@testable import Coppel

class HomeViewControllerTest: XCTestCase {
    
    var sut: HomeViewController?

    override func setUpWithError() throws {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = stBoard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        let viewModel = HomeViewModel()
        sut?.viewModel = viewModel
        sut?.loadView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_viewDidLoad() {
        sut?.viewDidLoad()
        XCTAssertNotNil(sut)
    }
    
    func test_viewModelConnected() {
        let numMarcas: Int = sut?.viewModel.marcas.count ?? 0
        XCTAssertEqual(numMarcas, 4)
    }
    
    func test_destacadosConnected() {
        sut?.prepare(for: UIStoryboardSegue(identifier: "showDestacados", source: sut!, destination: DestacadosViewController()), sender: sut)
        XCTAssertNotNil(sut?.destacadosViewController)
    }

    func test_categoriasConnected() {
        sut?.prepare(for: UIStoryboardSegue(identifier: "showCategorias", source: sut!, destination: CategoriasViewController()), sender: sut)
        XCTAssertNotNil(sut?.categoriasViewController)
    }
    
}
