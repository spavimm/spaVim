# Documentación para instalar spaVim en ArchLinux's
>Tome este manual como un complemento para que su editor funcione correctamente, ya que puede omitirlo pero a largo o corto plazo le va a pedir dependencias o requisitos adicionales que ni usted mismo logrará encontrar, o puede que si, pero mejor instalarlos ahora mismo.

>Si el proceso de instalación le parece muy tedioso, **no lo instale**. Las cosas no deberían de hacersen tan complicadas, pero en ocasiones como en nuestro caso debemos sentarnos a configurar todo nuestro entorno de trabajo por complejo o simple que parezca.

>No se abrume por la posible "complejidad" de información que encontrará.

1) **Actualizar el sistema** (Aparte de ser necesario, debería tenerlo en cuenta siempre que va a instalar algo)

2) **Instalar Neovim** (Visitando su página oficial para hacerlo de la manera correcta según el sistema operativo: https://neovim.io/ **o** visitando su repositorio: https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - **(ArchLinux)**:
    1)
        ```bash
        sudo pacman -S neovim
        ```
    2)
        **Instalar/Actualizar Python3 (A su última versión)**
        ```bash
        sudo pacman -S python3
        ```
    3)
        **Instalar el módulo de Python para Vim:**
        ```bash
        sudo pacman -S python-pynvim
        ```
    4)
        **Instalar PIP**
        *(python3)*
        ```bash
        sudo pacman -S python-pip
        ```
        *(python2)*
        ```bash
        sudo pacman -S python2-pip
        ```
    5)
        >En lo posible queremos evitar esas líneas rojas feas que aparecen cuando hay errores, muchas veces me he encontrado con lo siguiente: **No "python3" provider found. Run :checkhealth provider**
        ######
        Asi que en la terminal ingresaremos:
        ```bash
        python3 -m pip install --user --upgrade pynvim
        ```
    6)  **Instalar curl**
        Puede que NO tenga instalado/actualizado curl, aunque sería muy raro al ser un usuario de ArchLinux, en ese caso ingresaremos lo siguiente en la terminal:
        ```bash
        sudo pacman -S curl
        ```
    7)  **Instalar NVM (Node Version Manager)**
        - Instalaremos primero nodejs y npm:
            ```bash
            sudo pacman -S nodejs npm
            ```
        - Ahora revisaremos cual versión es la última de nodejs (LTS)
            ```bash
            nvm ls
            ```
        - Instalamos la última versión que nos aparece como la actual (LTS)
            ```bash
            nvm install <version>
            ```
            >💡 En caso de tener una versión actual no LTS en uso (la versión no estable) Instale la LTS y mediante el siguiente comando escoga la LTS
            ```bash
            nvm use <versionLTS>
            ```
    8)  **Instalar Ripgrep**
        De seguro conoce TELESCOPE (un buscador difuso altamente extensible sobre listas. Según la descripción en su repositorio)
        ![ImageDeTelescope](https://camo.githubusercontent.com/3d59e34d1f406890adf620546d3d97017ce0aacda034b1788c66fa872f192134/68747470733a2f2f692e696d6775722e636f6d2f5454546a6136742e676966)
        Pues este Plugin necesita unas pocas dependencias:
        - [Ripgrep](https://github.com/BurntSushi/ripgrep):
            ```bash
            sudo pacman -S ripgrep
            ```
        - [fd](https://github.com/sharkdp/fd#installation):
            ```bash
            sudo pacman -S fd
            ```
        - [Tree-sitter](https://pypi.org/project/tree-sitter/):
            Mediante PIP
            ```bash
            pip3 install tree_sitter
            ```
    9)  **Instalar yarn**
        ```bash
        sudo pacman -S yarn
        ```
    10) **Instalar [Lazygit](https://github.com/jesseduffield/lazygit)** (Administrador de git)
        ```bash
        sudo pacman -S lazygit
        ```
    11) **Instalar [Glow](https://github.com/charmbracelet/glow)** (Markdown)
        ![gifRelacionadoConGlow](https://camo.githubusercontent.com/bd591b74af8a6991894c8a84ab8d48f05ce7f66975b325d31f6954c836ddab27/68747470733a2f2f73747566662e636861726d2e73682f676c6f772f676c6f772d312e332d747261696c65722d6769746875622e676966)
        -   ```bash
            pacman -S glow
            ```
        > Ingrese el comando glow dentro de la carpeta en donde se encuentran sus archivos .md para visualizarlos 
 
#
## Clonar el [repositorio](https://github.com/spavim/spaVim)
- Vaya a su carpeta .config
    ```bash
    cd .config
    ```
- Ingrese a la carpeta nvim, si NO la tiene creada; pues créela
    ```bash
    cd nvim
    ```
- Clone el repositorio allí
    ```bash
    git clone https://github.com/spavim/spaVim.git
    ```
- Ingrese a la carpeta spaVim
    ```bash
    cd spaVim
    ```
- Ingrese mediante neovim a su archivo init.vim
    ```vim
    nvim init.vim
    ```
- En modo comandos, instale los plugins:
    ```bash
    :PlugInstall
    ```
- Salga del editor:
    ```bash
    :wq
    ```
>🎉 Ahora ingrese de nuevo al editor y disfrute de ***[spaVim](https://github.com/spavim/spaVim)*** 🎉

**Le recomiendo instalar la fuente [Cascadia Code](https://github.com/microsoft/cascadia-code/releases) (CascadiaCodePLBold) y un tamaño de 10px en la configuración de su terminal**
#
En caso de errores post-instalación vaya a **[errores](https://github.com/spavim/spaVim/blob/main/Errors/Errors.md)**, en donde posiblemente encontrará el suyo, en caso contrario **[formúlelo aquí](https://github.com/spavim/spaVim/discussions/categories/errors)** para que los demás o el propio owner del repositorio puedan ayudarlo
