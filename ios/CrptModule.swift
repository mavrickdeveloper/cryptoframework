import CRPTFramework
import CRPTCommon

@objc(CrptModule)
class CrptModule: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    @objc(returning:withResolver:withRejecter:)
    func returning(a: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*a)
    }

    @objc(showExchangeFlow:)
    func showExchangeFlow(a: Float) {
        DispatchQueue.main.async { [weak self] in

            // Enable sandbox stand
            Crypterium.enableTestMode()
            Crypterium.configure(basePath: .sandbox)

            // Login framework
            CRPTFramework.CRPTSignManager.shared.signIn(
                with: "79267390111",
                access: AccessToken(
                    accessToken: "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3ZjJjYjcxZC03OWIwLTRlMTMtYTgwMC01OTZlNTQ0Yjc1MTMiLCJleHAiOjE1OTc2MDU5MTksImlhdCI6MTU5NzYwMjMxOTQ0MX0.J34hq00KNWMkmYjl0jXOqn6ur80IqtRco0Vbz1uk59I",
                    expiresIn: nil,
                    refreshToken: nil,
                    scope: nil,
                    tokenType: nil)) { error in
                        guard error == nil else { return print(error) }

                        // Start exchange
                        guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }

                        // Exchange
                        CRPTExchangeRouter(navigationController: navigationController).show()

                        // KYC
                        CRPTIdentityVerificationRouter(with: navigationController).show()

                        // Cards
                        navigationController.present(CRPTCardsRouter().start(), animated: true)
             }


        }
    }
}
