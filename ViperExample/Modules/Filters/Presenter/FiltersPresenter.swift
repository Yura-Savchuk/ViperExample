//
//  FiltersPresenter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

class FiltersPresenter: AnyFiltersPresenter {
    
    weak var view: AnyFiltersView?
    weak var moduleOutput: AnyFiltersModuleOutput?
    var router: AnyFiltersRouter!
    var filters: Filters?
    
    func viewDidLoad() {
        view?.setManufacture(filters?.manufacture ?? "")
        view?.setMinPrice(filters?.minPrice)
        view?.setMaxPrice(filters?.maxPrice)
    }
    
    func didTapCancel() {
        router.close()
    }
    
    func didTapApply() {
        let filters = displayedFilters()
        moduleOutput?.filtersBeenChanged(filters)
        router.close()
    }

    private func displayedFilters() -> Filters {
        var filters = Filters()
        filters.manufacture = view?.manufacture()
        filters.maxPrice = view?.maxPrice()
        filters.minPrice = view?.minPrice()
        return filters
    }
    
}
