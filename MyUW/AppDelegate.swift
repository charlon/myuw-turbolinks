import UIKit
import WebKit
import Turbolinks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!
    var thirdTabNavigationController : UINavigationController!
    var fourthTabNavigationControoller : UINavigationController!
    var fifthTabNavigationController : UINavigationController!
    var sixthTabNavigationControoller : UINavigationController!
    var seventhTabNavigationController : UINavigationController!
    var eighthTabNavigationControoller : UINavigationController!
    
    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // tabbar setup
        let tabBarController = UITabBarController()
        
        firstTabNavigationController = HomeViewController()
        secondTabNavigationControoller = AccountsViewController()
        thirdTabNavigationController = HomeViewController()
        fourthTabNavigationControoller = AccountsViewController()
        fifthTabNavigationController = HomeViewController()
        sixthTabNavigationControoller = AccountsViewController()
        seventhTabNavigationController = HomeViewController()
        eighthTabNavigationControoller = AccountsViewController()
        
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationControoller, thirdTabNavigationController,
        fourthTabNavigationControoller, fifthTabNavigationController, sixthTabNavigationControoller, seventhTabNavigationController,
        eighthTabNavigationControoller]
        
        tabBarController.selectedIndex = 0
        
        let item1 = UITabBarItem(title: "Home", image: UIImage(named: "ico-home"), tag: 0)
        let item2 = UITabBarItem(title: "Accounts", image:  UIImage(named: "ico-contest"), tag: 1)
        let item3 = UITabBarItem(title: "Teaching", image:  UIImage(named: "ico-contest"), tag: 2)
        let item4 = UITabBarItem(title: "Profile", image:  UIImage(named: "ico-contest"), tag: 3)
        let item5 = UITabBarItem(title: "Calendar", image:  UIImage(named: "ico-contest"), tag: 4)
        let item6 = UITabBarItem(title: "Resources", image:  UIImage(named: "ico-contest"), tag: 5)
        let item7 = UITabBarItem(title: "Staff", image:  UIImage(named: "ico-contest"), tag: 6)
        let item8 = UITabBarItem(title: "Academics", image:  UIImage(named: "ico-contest"), tag: 7)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        thirdTabNavigationController.tabBarItem = item3
        fourthTabNavigationControoller.tabBarItem = item4
        fifthTabNavigationController.tabBarItem = item5
        sixthTabNavigationControoller.tabBarItem = item6
        seventhTabNavigationController.tabBarItem = item7
        eighthTabNavigationControoller.tabBarItem = item8
        
        // Tabbaar setup
        UITabBar.appearance().tintColor = hexStringToUIColor("#4b2e83")
        
        self.window?.rootViewController = tabBarController
        
        // navbar setup
        UINavigationBar.appearance().barTintColor = hexStringToUIColor("#4b2e83")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = hexStringToUIColor("#ffffff")
        UINavigationBar.appearance().barStyle = .blackOpaque // statusbar icons and text color (theme)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : hexStringToUIColor("#ffffff")]
        
        // globally set tint color
        self.window!.tintColor = hexStringToUIColor("#514DA3")
        
        // globally set background to white
        self.window!.backgroundColor = hexStringToUIColor("#ffffff")
        
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // custom hex color function
    func hexStringToUIColor (_ hex:String) -> UIColor {
        
        //var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercased()
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
}
