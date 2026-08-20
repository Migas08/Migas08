# SWAPI - Star Wars (Flutter)

App que busca dados da API [SWAPI](https://swapi.dev/): o usuário digita um id,
escolhe no Radio se quer Pessoa, Planeta ou Nave, e o app mostra os cinco
primeiros dados retornados.

## Arquivos

- `lib/my_api.dart` - faz a requisição HTTP e devolve os 5 primeiros campos
- `lib/main.dart` - a tela (campo de texto, radios, botão e resultado)

## Como rodar

```
flutter create . --project-name swapi_app
flutter pub get
flutter run
```

No Android, confira a permissão de internet em
`android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```
