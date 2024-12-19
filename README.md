# Firebase Analytics e Debugging no Flutter

## Descrição do Projeto
Este projeto demonstra a implementação e configuração do Firebase Analytics (GA4) em uma aplicação Flutter, incluindo métodos de debugging e solução de problemas comuns.

## Pré-requisitos
- Flutter SDK (versão 2.0 ou superior)
- Conta no Firebase Console
- Xcode (para iOS)
- Android Studio (para Android)
- CocoaPods (para iOS)

## Passo a Passo de Instalação

### 1. Configuração do Firebase
1. Acesse o [Firebase Console](https://console.firebase.google.com/)
2. Crie um novo projeto ou selecione um existente
3. Adicione sua aplicação:
- Para iOS: registre o Bundle ID
- Para Android: registre o package name

### 2. Instalação das Dependências
Adicione as seguintes dependências ao seu `pubspec.yaml`:

```yaml
dependencies:
firebase_core: ^latest_version
firebase_analytics: ^latest_version
```

### 3. Configuração iOS
1. Adicione o arquivo `GoogleService-Info.plist` ao projeto iOS
2. No Xcode, adicione ao Runner → Info.plist

### 4. Configuração Android
1. Adicione o arquivo `google-services.json` em `android/app`
2. Configure o `build.gradle` do projeto

## Habilitando o Modo Debug do Firebase

### Método 1: Via Xcode
1. Abra o projeto no Xcode
2. Vá em Product > Scheme > Edit Scheme
3. Selecione "Run" e vá para "Arguments"
4. Em "Arguments" > "Arguments Passed On Launch", adicione:
- Name: `-FIRDebugEnabled`



## Solução de Problemas

### Problemas Comuns

1. **FIRDebugEnabled não funciona:**
- Verifique se as variáveis de ambiente estão configuradas corretamente
- Tente limpar a build: `flutter clean`
- Reinstale os pods: `cd ios && pod install`

2. **Eventos não aparecem no Debug View:**
- Certifique-se que o Analytics está habilitado no Firebase Console
- Aguarde alguns minutos para os eventos aparecerem
- Verifique se o dispositivo tem conexão com internet

3. **Erro de Compilação iOS:**
- Execute `pod repo update`
- Verifique se o `GoogleService-Info.plist` está no local correto
- Limpe a pasta DerivedData do Xcode

### Verificando a Instalação
Para verificar se o Firebase está configurado corretamente:

```dart
FirebaseAnalytics.instance
    .logEvent(name: 'test_event')
    .then((_) => print('Evento enviado com sucesso'))
    .catchError((error) => print('Erro ao enviar evento: $error'));
```

## Suporte

Para mais informações ou dúvidas:
- [Documentação oficial do Firebase](https://firebase.google.com/docs/flutter/setup)
- [Flutter Firebase Plugins](https://github.com/firebase/flutterfire)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/firebase+flutter)
