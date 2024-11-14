import ExpoModulesCore

public class ExpoDynamicAppIconModule: Module {
  public func definition() -> ModuleDefinition {
    
    Name("ExpoDynamicAppIcon")

    Function("setAppIcon") { (name:String) -> String in
      self.setAppIcon(name)

      return name
    }

    Function("getAppIcon") { () -> String in
      return UIApplication.shared.alternateIconName ?? "DEFAULT"
    }
  }

  private func setAppIcon(_ iconName: String?) {
    if UIApplication.shared.responds(to: #selector(getter: UIApplication.supportsAlternateIcons)) && UIApplication.shared.supportsAlternateIcons {
      UIApplication.shared.setAlternateIconName(iconName)
    }
  }

}
