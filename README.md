
<p align="center">
<img
  src="https://raw.githubusercontent.com/juliobissoli/RenterApp/msater/assets/images/logo_large_bgBlak_fgWight.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto; max-width: 300px">
</p>

# O que é Renter:
O Renter e uma plataforma que visa prover serviços de gerência e
administração de locação de imóveis pessoal, por meio de um aplicativo móvel.

# Funcionalidades:
- Crie uma conta offline para proteger as informações dos seus imóveis de curiosos;
- Cadastre imóveis para gerenciá-los;
- Adicione uma foto do imóvel;
- Selecione o estado atual do imóvel (Alugado, indisponível, em manutenção, etc...)
- Cadastre contrataçÕes de alugueis, adicionando o inquilino à contratação;
  - É possível alugar por diferentes períodos: Horas, dias, anos;

# Tecnologías utilizadas:

- Dart - Linguagem de progração
- Flutter - Framework para escrever aplicações mobile. 
- SQLite - Banco de dados relacional local
- Android Studio - Ambiente de desenvolvimento para building da versão Android
- Xcode - Ambiente de desenvolvimento para building da versão iOS

## Instalação / emulação

- Certifique-se que você possui Dart instalado no seu sistema.

- Instale `fvm`, que é um gerenciador de versões do Flutter:
```
dart pub global activate fvm
```
ou (macOS)
```
brew tap leoafarias/fvm
brew install fvm
```

- Instale a versão do Flutter utilizada neste projeto:
```
fvm install 2.10.4
```
- Instale as dependências do projeto:
```
fvm flutter pub get
```
- Emule o aplicativo:
```
fvm flutter run
```
- Para buildar o APK:
```
fvm flutter build apk
```
