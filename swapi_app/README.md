# SWAPI — Star Wars (Flutter)

Aplicativo Flutter que consome a API pública [SWAPI](https://swapi.dev/).

O usuário informa um **id** em um campo de texto e escolhe em um **Radio** se
quer buscar **Pessoa**, **Planeta** ou **Nave**. O app exibe apenas os **cinco
primeiros dados** de cada categoria.

## Campos exibidos

| Pessoa (`/people/:id/`) | Planeta (`/planets/:id/`) | Nave (`/starships/:id/`) |
|---|---|---|
| Nome (`name`) | Nome (`name`) | Nome (`name`) |
| Altura (`height`) | Período de rotação (`rotation_period`) | Modelo (`model`) |
| Peso (`mass`) | Período orbital (`orbital_period`) | Fabricante (`manufacturer`) |
| Cor do cabelo (`hair_color`) | Diâmetro (`diameter`) | Custo em créditos (`cost_in_credits`) |
| Cor da pele (`skin_color`) | Clima (`climate`) | Comprimento (`length`) |

## Estrutura

```
lib/
├── main.dart                      # MaterialApp + tema
├── models/
│   ├── categoria.dart             # enum com endpoint e os 5 campos de cada categoria
│   └── resultado.dart             # modelo do resultado (rótulo + valor)
├── services/
│   └── swapi_service.dart         # requisição HTTP e tratamento de erros
├── screens/
│   └── busca_screen.dart          # campo de texto, Radio e botão Buscar
└── widgets/
    └── card_resultado.dart        # card com os 5 dados
```

## Como rodar

```bash
flutter create . --project-name swapi_app   # gera as pastas android/ios/web (só na 1ª vez)
flutter pub get
flutter run
```

> **Android:** garanta a permissão de internet em `android/app/src/main/AndroidManifest.xml`:
> `<uses-permission android:name="android.permission.INTERNET" />`

## Como funciona

1. O campo de texto aceita somente dígitos e valida id vazio ou menor/igual a zero.
2. O Radio define a categoria, que carrega o endpoint e a lista ordenada dos 5 campos.
3. `SwapiService.buscar()` monta a URL `https://swapi.dev/api/<endpoint>/<id>/`,
   faz o GET com timeout de 15s e converte a resposta em `Resultado`.
4. Erros (404, falha de rede, status inesperado) viram `SwapiException` com
   mensagem amigável exibida na tela.
