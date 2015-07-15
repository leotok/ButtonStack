## ButtonStack
A custom view for iOS developers that provides a stack with up to four buttons.

#### How to
Add the following delegate to your viewcontroller:

```swift
class ViewController: UIViewController, ButtonStackViewControllerDelegate
```
and call it inside an action:
```swift
  var stack = ButtonStackViewController(mainButton: button, numberOfButtons: 4)
  stack.delegate = self
  self.presentViewController(stack, animated: false, completion: nil)
```

#### Protocol
Use this protocol to manage the selected button from the stack:
```swift
  func buttonStack(buttonStack: ButtonStackViewController, didSelect button: UIButton, atIndexPath indexPath: NSIndexPath)
```
and this one to know when the cancel button is pressed:
```swift
  func buttonStackDidCancel(buttonStack: ButtonStackViewController)
  ```
