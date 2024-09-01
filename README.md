# Snake2D The Game

Un juego de Snake en 2D hecho en Ruby utilizando Ruby2D.

## Preview

![preview_snake2d](https://github.com/user-attachments/assets/1b9a0f60-6b8a-4ee4-81ce-400669b02f50)

## Instalación

1. Clona el repositorio
   ```bash
   git clone https://github.com/AntIns01/RubySnake.git

2. Instalar Ruby 3.3.4 de la pagina oficial   
   [Descarga Ruby](https://www.ruby-lang.org/es/downloads/)

3. Para Linux es necesario instalar las dependencias graficas
   ```bash
   sudo apt update
   sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev

4. Instalar bundler para ruby
   ```bash
   gem install bundler
   bundle init

5. Para ejecutar el juego
   ```bash
   bundle exec ruby src/app.rb

## Uso
### Como jugar
El juego es bastante simple, hay que guiar a la snake hacia la comida, mientras mas coma mayor sera el puntaje.

### Controles del juego
- **Mover hacia arriba**: Presiona la tecla `↑` (Flecha Arriba)
- **Mover hacia abajo**: Presiona la tecla `↓` (Flecha Abajo)
- **Mover hacia la izquierda**: Presiona la tecla `←` (Flecha Izquierda)
- **Mover hacia la derecha**: Presiona la tecla `→` (Flecha Derecha)

Tip: Evita chocar por las paredes o con tu propio cuerpo.

## Tecnologias usadas
Este proyecto fue desarrollado utilizando las siguientes tecnologías:

- **Ruby 3.3.4**: El lenguaje de programación principal utilizado para desarrollar el juego.
- **Ruby2D 0.12.1**: Biblioteca gráfica utilizada para manejar los gráficos 2D del juego.
- **Rufo 0.18.0**: Formateador de código para mantener un estilo de código consistente.
- **Minitest 5.20.0**: Biblioteca para realizar pruebas unitarias en Ruby.

### Entorno de Desarrollo

- **Visual Studio Code**: Editor de código utilizado para desarrollar el proyecto.
  - **Extensión Ruby LSP**: Extensión utilizada para mejorar la experiencia de desarrollo en Ruby dentro de VSCode.
