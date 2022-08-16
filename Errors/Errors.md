# Errores


### **⚠️ Node is not executable**
Ocurre por que la ruta que tiene *let g:coc_node_path* es incorrecta de acuerdo al sitio en donde su node se instalo, por lo tanto con el siguiente comando sabremos en que ruta se encuentra:
-   ```bash
    nvm which current
    ```
-   Dicha ruta del comando anterior la copiaremos y dentro de su archivo init.vim encontrará en la primera línea algo similar a:
    ```vim
    let g:coc_node_path = 'rutaEnDondeSeEncuentraNodeInstalado'
    ```
    En donde deberá reemplazar dicha ruta por la que recientemente acabo de copiar
    > En mi caso, sería lo siguiente:
    ```vim
    let g:coc_node_path = '/home/nativeinsect/.nvm/versions/node/v16.16.0/bin/node'
    ```
### ⚠️ No "python3" provider found. Run :checkhealth provider
En la terminal ingresaremos:
```bash
python3 -m pip install --user --upgrade pynvim
```
