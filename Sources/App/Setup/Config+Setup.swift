import Bugsnag
import JWTKeychain
import LeafProvider
import MySQLProvider
import RedisProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [Row.self, JSON.self, Node.self]

        try setupProviders()
        try setupMiddlewares()
    }
    
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(MySQLProvider.Provider.self)
        try addProvider(RedisProvider.Provider.self)
        try addProvider(Bugsnag.Provider.self)
        try addProvider(JWTKeychain.Provider<JWTKeychain.User>.self)
        try addProvider(LeafProvider.Provider.self)
    }

    /// Configre middlewares
    private func setupMiddlewares() throws {
        addConfigurable(middleware: Bugsnag.Middleware.init, name: "bugsnag")
    }
}
