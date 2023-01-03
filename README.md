# Delegate Design Pattern
Cocoa APIs often provide protocols that include delegate methods. Sean Allen breaks it down like the following.

<img src="https://github.com/Brian-McIntosh/Delegate-Design-Pattern/blob/main/Screen%20Shot%202022-12-28%20at%205.54.56%20PM.png" width="500"/>

* Big picture context: BOSS and INTERN
* Great for 1-to-1 communication
* A delegate sits back and waits to be told when and what to do
* You don't call delegate methods themselves
* They get called automatically when they're told what to do

### Creating the Job Description
```swift
protocol ProductSelectionDelegate {
    // think of this like the JOB DESCRIPTION
    // these are the things the INTERN will need to know how to do
    func didSelectProduct(name: String, imageName: String)
}
```
*This is like a .h in Objective-C. It's just a declaration, not the implementation.*

### The BOSS (which is unintuitive at first b/c this ModalVC is presented by the main VC)
```swift
class ProductSelectionVC: UIViewController {

    // let iPhoneButton = UIButton()
    // let iPadButton = UIButton()
    // let macBookButton = UIButton()

    // Now that we have our job description,
    // we need to have a product selection INTERN on our screen
    // the actual JOB POSITION
    // the INTERN will tell the BOSS, I'll do the work
    var delegate: ProductSelectionDelegate?
```

### The BOSS telling the INTERN what to do
```swift
  delegate?.didSelectProduct(name: "iPhone 14", imageName: "iphone")
  dismiss(animated: true)
```

### The INTERN
```swift
  // THE INTERN - sitting back and waiting to be told what to do
  class ViewController: UIViewController, ProductSelectionDelegate { //<- the intern has to apply for the job: ProductSelectionDelegate
  }
  
  // this INTERN needs to how to do this job from the JOB DESCRIPTION
  // this method will not be called in this VC!!
  func didSelectProduct(name: String, imageName: String) {
      productNameLabel.text = name
      productImageView.image = UIImage(named: imageName)
  }
  
  // when preparing to present...
  @objc func presentProductSelectionVC() {
    let destinationVC = ProductSelectionVC()

    // this is the INTERN telling the BOSS I'm signing up for the job
    destinationVC.delegate = self
```
