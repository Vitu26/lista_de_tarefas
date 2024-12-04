
# Aplicativo de Lista de Tarefas em Flutter

Um aplicativo de lista de tarefas desenvolvido em Flutter que permite aos usuários adicionar, visualizar, atualizar e excluir tarefas. As tarefas podem ser marcadas como concluídas, e os dados são persistidos entre reinicializações do aplicativo usando SharedPreferences.

## Funcionalidades

- **Adicionar Tarefa:** Adicione novas tarefas com título, descrição e prioridade.
- **Visualizar Lista de Tarefas:** Exibe uma lista de tarefas com seu título, descrição e status (concluída ou não).
- **Editar Tarefa:** Edite o título, descrição e prioridade das tarefas existentes.
- **Excluir Tarefa:** Exclua tarefas da lista.
- **Marcar Tarefa como Concluída:** Os usuários podem marcar tarefas como concluídas ou não.
- **Filtrar Tarefas:** Filtre tarefas com base na prioridade ou status (Todas, Concluídas ou Pendentes).
- **Armazenamento Local:** Os dados são salvos localmente usando SharedPreferences, garantindo a persistência entre reinicializações do app.
- **Animações:** Transições suaves e animações são implementadas para ações de gerenciamento de tarefas (por exemplo, ao adicionar ou excluir uma tarefa).

## Funcionalidades Extras

- **Filtro de Tarefas:** Exibe tarefas com base no status (Todas, Concluídas ou Pendentes).
- **Animações:** Animações suaves ao adicionar ou excluir tarefas.
- **Testes Unitários:** Inclui testes básicos para adicionar, excluir e editar tarefas.

## Iniciando o Projeto

### Pré-requisitos

- **Flutter:** Certifique-se de que o Flutter está instalado na sua máquina. Siga o [guia oficial de instalação do Flutter](https://flutter.dev/docs/get-started/install).

### Instalação

#### Clone o Repositório

```bash
git clone https://github.com/Vitu26/lista_de_tarefas.git
cd lista_de_tarefas
```

#### Instale as Dependências

Rode o seguinte comando para instalar as dependências necessárias:

```bash
flutter pub get
```

#### Execute o Aplicativo

Use o comando abaixo para executar o app em modo debug:

```bash
flutter run
```

## Estrutura do Projeto

O aplicativo segue a arquitetura básica do Provider, com separação entre UI, lógica de negócios e persistência de dados.

```bash
lib/
├── models/
│   └── task.dart             
├── pages/
│   ├── home_page.dart        
│   ├── task_form_page.dart   
│   └── task_details_page.dart 
├── providers/
│   └── task_provider.dart     
├── widgets/
│   ├── custom_button.dart     
│   ├── custom_textfield.dart  
│   ├── filter_options.dart   
│   └── task_list.dart         
└── main.dart                  
```

## Modelo de Tarefa

O modelo de tarefa (task.dart) define a estrutura de uma tarefa, incluindo campos como title, description, priority, date e isCompleted.

## Provider de Tarefas

O TaskProvider gerencia o estado das tarefas, incluindo:

- Adicionar novas tarefas
- Atualizar tarefas existentes
- Excluir tarefas
- Marcar tarefas como concluídas
- Filtrar tarefas por prioridade ou status
- Persistir tarefas usando SharedPreferences

## Telas

- **Tela Inicial:** Exibe a lista de tarefas com opções de filtragem por prioridade e status.
- **Formulário de Tarefas:** Permite que os usuários adicionem ou editem tarefas.
- **Detalhes da Tarefa:** Mostra os detalhes de uma tarefa específica (título, descrição, prioridade e data).

## Animações

O aplicativo inclui animações como:

- Animação de Slide para transições ao adicionar novas tarefas.
- Animação de Slide para botões e interações para melhorar a experiência do usuário.

## Testes Unitários

Os testes unitários básicos estão incluídos para as seguintes funcionalidades:

- Adição de Tarefas
- Edição de Tarefas
- Exclusão de Tarefas

### Para executar os testes:

```bash
flutter test
```

## Como Contribuir

1. Faça um fork do repositório.
2. Crie uma branch para sua nova funcionalidade (`git checkout -b feature/nova-funcionalidade`).
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova funcionalidade'`).
4. Faça push para a branch (`git push origin feature/nova-funcionalidade`).
5. Abra um pull request.

---

# Flutter To-Do List App

A Flutter To-Do List application that allows users to add, view, update, and delete tasks. Tasks can be marked as completed, and data is persisted between app restarts using SharedPreferences.

## Features

- **Add Task:** Add new tasks with a title, description, and priority.
- **View Task List:** Display a list of tasks with their title, description, and status (completed or not).
- **Edit Task:** Edit the title, description, and priority of existing tasks.
- **Delete Task:** Delete tasks from the list.
- **Mark Task as Completed:** Users can mark tasks as completed or not.
- **Task Filtering:** Filter tasks based on priority or status (All, Completed, or Pending).
- **Local Storage:** Data is saved locally using SharedPreferences, ensuring persistence between app restarts.
- **Animations:** Smooth transitions and animations for task management actions (e.g., adding or deleting tasks).

## Bonus Features

- **Task Filtering:** Filter tasks based on their completion status (All, Completed, or Pending).
- **Animations:** Smooth animations when adding or deleting tasks.
- **Unit Testing:** Includes basic unit tests for task addition, deletion, and editing.

## Getting Started

### Prerequisites

- **Flutter:** Ensure Flutter is installed on your machine. Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

#### Clone the Repository

```bash
git clone https://github.com/Vitu26/lista_de_tarefas.git
cd lista_de_tarefas
```

#### Install Dependencies

Run the following command to install the necessary dependencies:

```bash
flutter pub get
```

#### Run the App

Use the following command to run the app in debug mode:

```bash
flutter run
```

## Project Structure

The app follows a basic Provider architecture with separation between UI, business logic, and data persistence.

```bash
lib/
├── models/
│   └── task.dart              
├── pages/
│   ├── home_page.dart         
│   ├── task_form_page.dart    
│   └── task_details_page.dart 
├── providers/
│   └── task_provider.dart     
├── widgets/
│   ├── custom_button.dart     
│   ├── custom_textfield.dart  
│   ├── filter_options.dart    
│   └── task_list.dart         
└── main.dart                 
```

## Task Model

The task model (task.dart) defines the structure of a task, including fields such as title, description, priority, date, and isCompleted.

## Task Provider

The TaskProvider manages the state for tasks, including:

- Adding new tasks
- Updating existing tasks
- Deleting tasks
- Marking tasks as completed
- Filtering tasks by priority or status
- Persisting tasks using SharedPreferences

## Screens

- **Home Screen:** Displays the task list with filtering options by priority and status.
- **Task Form:** Allows users to add or edit tasks.
- **Task Details:** Shows details of a specific task (title, description, priority, and date).

## Animations

The app includes animations such as:

- Slide Animation for transitions when adding new tasks.
- Slide Animation for buttons and interactions to enhance the user experience.

## Unit Testing

Basic unit tests are included for the following functionalities:

- Task Addition
- Task Editing
- Task Deletion

### To run the tests:

```bash
flutter test
```

## How to Contribute

1. Fork the repository.
2. Create a branch for your new feature (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a pull request.
