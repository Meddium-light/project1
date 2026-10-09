
# Project1

Проект полного автоматизированного пайплайна (тесты, сборка, загрузка на ghrc, и деплой в k3s в моей хомлабе) сайта-визитки (https://github.com/tjaugust01/dotcv) которую я переделал под себя

![License](https://img.shields.io/badge/license-MIT-blue.svg) Узнать больше обо [мне](https://www.youtube.com/watch?v=pgiA3218snU)

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Configuration](#configuration)
- [Screenshots](#screenshots)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Running Tests](#running-tests)
- [Deployment](#deployment)
- [FAQ](#faq)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Что делает проект

- GitHub Actions прогоняет базовые тесты на пулл реквест в мастер
- Jenkins отслеживает изменение мастер ветки, прогоняет еще тесты, билдит докер образ и загружает в ghrc
- K3s при помощи Argo CD забирает докер образ с гитхаба и развертывает проект

### Tech Stack

- **Kubernetes**
- **Jenkins**
- **CICD**
- **Argo CD**
- **Docker**

## Дальнейшие планы

- [x] GitHub Action тесты на пулл реквесты 
- [x] Jenkins собирающий докер образ
- [x] Автоматическое развертывание проекта в кубер кластере
- [ ] Feature 4 (planned)

## Running Tests

```bash
npm test
```

## Deployment

```bash
npm run build
npm run deploy
```

## Acknowledgments

- [Resource 1](https://example.com)
- [Resource 2](https://example.com)