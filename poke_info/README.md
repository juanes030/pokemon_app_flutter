# Anotaciones App - Flutter & Riverpod

## Descripción
Aplicación para gestionar anotaciones de manera eficiente en dispositivos móviles. Construida con **Flutter** para interfaces multiplataforma y **Riverpod** para la gestión de estado de forma reactiva y desacoplada.  

---

## Tecnologías utilizadas
- **Flutter & Dart**: Framework y lenguaje principal del proyecto.  
- **Riverpod**: Gestión de estado moderna y segura.  
- **Hive**: Base de datos local ligera para almacenamiento persistente.  
- **Flutter Secure Storage**: Para almacenar datos sensibles cifrados.  
- **Flutter Hooks**: Para optimizar la construcción de widgets reactivos.  

---

## Arquitectura
La aplicación sigue una **arquitectura en capas**:

1. **Capa de presentación**  
   - Widgets y pantallas que interactúan con el usuario.  
   - Consumo de estado mediante Riverpod.  

2. **Capa de dominio**  
   - Lógica de negocio y modelos de datos (anotaciones y reglas de validación).  

3. **Capa de datos**  
   - Acceso a la base de datos local (Hive) a través de repositorios.  
   - Mantiene la separación entre UI y almacenamiento.

> Esta arquitectura facilita mantenimiento, escalabilidad y pruebas unitarias.

---

## Seguridad
- **Almacenamiento seguro**: Datos sensibles cifrados en el dispositivo con Flutter Secure Storage.  
- **Validación de entradas**: Todos los campos del usuario se validan antes de almacenarse.  
- **Acceso controlado**: La UI no accede directamente a la base de datos; todo pasa por la capa de dominio y repositorios.  

---

## Instrucciones para correr el proyecto
1. Clonar el repositorio:  
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd nombre_del_proyecto
