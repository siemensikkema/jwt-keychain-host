import Authentication
import BCrypt
import Fluent
import JSON
import JWT
import JWTKeychain
import JWTProvider
import SMTP

internal final class User {
    let storage = Storage()

    internal init() {

    }
}

// MARK: EmailAddressRepresentable

extension User: EmailAddressRepresentable {
    var emailAddress: EmailAddress {
        return EmailAddress(address: "a@b.com")
    }
}

// MARK: Entity

extension User: Entity {

}

// MARK: JSONRepresentable

extension User: JSONRepresentable {
    func makeJSON() throws -> JSON {
        return [:]
    }
}

// MARK: JWTKeychainAuthenticatable

extension User: JWTKeychainAuthenticatable {

}

// MARK: P

extension User: P {
    convenience init(email: Valid<UniqueEmail>, name: Valid<Name>?, password: HashedPassword) throws {
        self.init()
    }

    func update(email: Valid<UniqueEmail>?, name: Valid<Name>?, password: HashedPassword?) throws {

    }

    static let passwordHasher: HashProtocol = BCryptHasher(cost: 5)
}

// MARK: NodeRepresentable

extension User: NodeRepresentable {
    func makeNode(in context: Context?) throws -> Node {
        return [:]
    }
}

// MARK: PasswordAuthenticatable

extension User: PasswordAuthenticatable {

}

// MARK: PayloadAuthenticatable

extension User: PayloadAuthenticatable {
    public struct UserIdentifier: JSONInitializable {
        let id: Identifier

        public init(json: JSON) throws {
            id = Identifier(try json.get(SubjectClaim.name) as Node)
        }
    }

    public typealias PayloadType = UserIdentifier

    public static func authenticate(_ payload: PayloadType) throws -> User {
        guard let user = try User.find(payload.id) else {
            throw Abort.notFound
        }

        return user
    }
}

// MARK: Preparation

extension User: Preparation {
    static func prepare(_ database: Database) throws {

    }

    static func revert(_ database: Database) throws {

    }
}

// MARK: RowInitializable

extension User: RowInitializable {
    convenience init(row: Row) throws {
        self.init()
    }
}

// MARK: RowRepresentable

extension User: RowRepresentable {
    func makeRow() throws -> Row {
        return Row()
    }
}
