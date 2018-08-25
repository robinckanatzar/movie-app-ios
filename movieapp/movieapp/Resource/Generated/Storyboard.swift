// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum LaunchScreen: StoryboardType {
    static let storyboardName = "LaunchScreen"

    static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  enum Main: StoryboardType {
    static let storyboardName = "Main"

    static let forgotPasswordViewController = SceneType<movieapp.ForgotPasswordViewController>(storyboard: Main.self, identifier: "ForgotPasswordViewController")

    static let loginViewController = SceneType<movieapp.LoginViewController>(storyboard: Main.self, identifier: "LoginViewController")

    static let myFriendsViewController = SceneType<movieapp.MyFriendsViewController>(storyboard: Main.self, identifier: "MyFriendsViewController")

    static let myListsViewController = SceneType<movieapp.MyListsViewController>(storyboard: Main.self, identifier: "MyListsViewController")

    static let searchMoviesViewController = SceneType<movieapp.SearchMoviesViewController>(storyboard: Main.self, identifier: "SearchMoviesViewController")

    static let splashViewController = SceneType<movieapp.SplashViewController>(storyboard: Main.self, identifier: "SplashViewController")

    static let tabBarViewController = SceneType<movieapp.TabBarViewController>(storyboard: Main.self, identifier: "TabBarViewController")
  }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
