import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

@available(iOS 13.0.0, *)
public func configure(_ app: Application) async throws {

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    // MARK: Configuração da Migração
    app.migrations.add(UserModelMigration())
    app.migrations.add(CourseModelMigration())
    app.migrations.add(SessionModelMigratino())
    app.migrations.add(GuideModelMigration())
    app.migrations.add(ArticleModelMigration())

    try routes(app)
}
