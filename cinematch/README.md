# 🎬 CineMatch — Projeto Integrador (Flutter)

Aplicativo de **recomendação de filmes e séries** desenvolvido em Flutter para o Projeto Integrador.

> Construído apenas com os recursos vistos em aula (DDM): StatefulWidget e `setState`,
> rotas nomeadas com `Navigator.pushNamed`/`pop`, `Form` + `TextFormField` com `validator`,
> `TextEditingController`, `CheckboxListTile`, `RadioListTile`, `SwitchListTile`,
> classe com construtor/get/set armazenada em `List`, `GestureDetector`, `Image.network`,
> `Container` com `BoxDecoration`/`DecorationImage`, `showDialog`/`AlertDialog` e `SnackBar`.

## 📱 Telas do aplicativo

| Tela | Descrição |
|------|-----------|
| **Home** | Tela inicial com cards/botões de navegação para todas as páginas |
| **Sobre o Projeto** | Descrição do CineMatch com banner, ícones, chips e formatação |
| **Login** | Valida os campos e procura o usuário/senha no vetor de cadastrados |
| **Cadastro** | Campos de texto, checkboxes (gêneros), radios (plataforma) e switches (preferências) — salva no vetor |
| **Busca** | Pesquisa usuários do vetor por nome, e-mail, gênero ou plataforma |
| **Sobre Nós** | Fotos (avatares) e informações dos desenvolvedores |

## 🚀 Como executar

1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install)
2. Na pasta do projeto, rode:

```bash
flutter create . --platforms=android,web   # gera as pastas android/web
flutter pub get
flutter run
```

> O comando `flutter create .` é necessário porque este repositório contém apenas
> o código-fonte (`lib/` e `pubspec.yaml`), sem as pastas de plataforma.

## 🔑 Usuário de teste

- **E-mail:** `admin@cinematch.com`
- **Senha:** `123456`

## ✏️ Personalização

- Edite `lib/screens/sobre_nos_screen.dart` com os nomes reais dos integrantes do grupo.
- Para usar fotos reais, crie a pasta `assets/images/`, adicione as fotos,
  declare no `pubspec.yaml` e troque o ícone do avatar por
  `backgroundImage: AssetImage('assets/images/foto.jpg')`.

## 🎨 Tema visual

Paleta inspirada nas salas de cinema: fundo escuro (`#0D0D14`), vermelho cinema (`#E50914`) e dourado premiação (`#FFC857`).
