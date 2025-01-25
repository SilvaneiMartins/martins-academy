<h1 align="center">
    Martins Academy
</h1>

<h2 align="center">
    🚀 PROJETO EM ANDAMENTO 🚀
</h2>

<h5 align="center">
    Projeto Martins Academy e construído com Swift e Vapor.
</h5>

## Sobre projeto

Bem-vindo à Martins Academy API, uma API REST desenvolvida utilizando o framework Vapor e a linguagem Swift. Esta API foi projetada para fornecer uma base robusta e escalável para a gestão de recursos relacionados à Martins Academy, permitindo operações eficientes e seguras.

## Clonar o repositório

```bash
    # Clonar o repositório
    git clone https://github.com/SilvaneiMartins/martins-academy

    # Acessar projeto
    cd martins-academy

    # Instalar dependências
    vapor build

    # Configure as variáveis de ambiente no arquivo .env:
    DATABASE_URL=postgresql://username:password@localhost:5432/martins-academy
    PORT=8080
    JWT_SECRET=supersecretkey

    # Execute o projeto:
    vapor run

    # Acesse a API via navegador ou Postman:
    http://localhost:8080
```

## Estrutura do projeto

```PlainText
    📂 martins-academy
    ├── 📁 Sources
    │   ├── 📁 App
    │   │   ├── 📁 Context
    │   │   ├── 📁 Controllers
    │   │   ├── 📁 DTO
    │   │   ├── 📁 Enums
    │   │   ├── 📁 Errors
    │   │   ├── 📁 FieldKeys
    │   │   ├── 📁 Middleware
    │   │   ├── 📁 Migrations
    │   │   ├── 📁 Models
    │   │   ├── 📁 Protocols
    │   │   ├── 📁 Seeds
    │   │   ├── 📁 Services
    │   ├── configure.swift
    │   ├── entrypoint.swift
    │   ├── routes.swift
    ├── 📁 Tests
    ├── .dockerignore
    ├── .gitignore
    ├── docker-compose.yml
    ├── Dockerfile
    ├── LICENSE
    ├── Package.resolved
    ├── Package.swift
    └── README.md
```

## Contribuição

🟢 Sinta-se à vontade para contribuir com melhorias e sugestões. Para contribuir:

❎ Faça um fork do repositório.
❎ Crie uma branch para a sua feature (git checkout -b minha-feature).
❎ Commit suas alterações (git commit -m 'Adicionar nova funcionalidade').
❎ Envie um pull request.

## Fonte de pesquisa

- [VAPOR](https://vapor.codes) - Vapor framework.
- [DOCKER](https://www.docker.com) - Docker container.
- [SWIFT](https://www.swift.org/documentation/) - Documentação swift.
- [FLUENT](https://docs.vapor.codes/fluent/overview/?h=fluent) - Fluent ORM.

## Licença

Este projeto é licenciado sob [CC0 1.0 Universal]. Consulte o arquivo [LICENÇA](https://github.com/SilvaneiMartins/martins-academy/blob/master/LICENSE) para obter detalhes.

## Doações

Se você achar este projeto útil e quiser apoiar seu desenvolvimento contínuo, você pode fazer uma doação via `PIX` para e-mail `silvaneimartins@hotmail.com`.

Muito ❤️ pelo apoio!

## Contato

<a href="https://github.com/SilvaneiMartins">
    <img
        style="border-radius:50%"
        src="https://github.com/SilvaneiMartins.png"
        width="100px;"
        alt="Silvanei Martins"
    />
    <br />
    <sub>
        <b>Silvanei de Almeida Martins</b>
    </sub>
</a>
     <a href="https://github.com/SilvaneiMartins" title="Silvanei martins" >
 </a>
<br />
🚀 Feito com ❤️ por Silvanei Martins
