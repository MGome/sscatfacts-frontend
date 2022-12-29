# SSCatFacts Frontend
### by Mario Gómez - { bigMario } :ghost:
---
## Setup inicial :rocket:
1) Una vez clonado el repositorio, se deben instalar las dependencias del proyecto a través del comando:
```
bundle install
```
2) Luego se debe crear un archivo ```.env``` en la carpeta raíz, el cual debe contener las siguientes credenciales:
```
POSTGRESQL_USERNAME='your_username'
POSTGRESQL_PASSWORD='your_password'
BACKEND_URL='http://localhost:3001'
```
Notar que la variable ```BACKEND_URL``` puede variar en función del puerto en que estás ejecutando el backend.
3) Finalmente, ejecuta los comandos para la creación y migración de la base de datos:
```
rails db:create
rails db:migrate
```
4) Listo! Ya puedes ejecutar la aplicación.

---
## Decisiones de diseño
1) Cuando un usuario le da like a un Cat Fact se envía la request a backend, quedando el registro para futuras solicitudes. Esto implica que cuando vuelve a aparecer un Cat Fact al que el usuario ya le dio like previamente estará deshabilitado el botón de Me Gusta.
2) Un usuario puede dar like a un Cat Fact, pero no quitar un like.

---
## Metodología de trabajo
1) El diseño del software está basado en las prácticas de SOLID.
2) La convención de manejo de ramas se realizó a través de Git Flow siguiendo la convención de ramas y nombres de commits de [DeepSource](https://deepsource.io/blog/git-branch-naming-conventions/). El diagrama del flujo de ramas se puede encontrar en el siguiente [enlace](https://github.com/MGome/sscatfacts-frontend/network).


---
## Revisión de calidad de código
Para mantener correctas prácticas de desarrollo se integró rubocop al proyecto, para realizar la revisión de acuerdo a las reglas predefinidas debes ejecutar el comando:
```
rubocop
```

---
## Testing
Para la ejecución de los tests debes ejecutar el comando:
```
bundle exec rspec
```
Cabe mencionar que sólo se testearon dos requests de controlador, ya que el resto dependen de solicitudes al backend que ya fueron testeadas.

