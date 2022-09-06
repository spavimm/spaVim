# Documentación para instalar spaVim en Ubuntu
>Tome este manual como un complemento para que su editor funcione correctamente, ya que puede omitirlo pero a largo o corto plazo le va a pedir dependencias o requisitos adicionales que ni usted mismo logrará encontrar, o puede que si, pero mejor instalarlos ahora mismo.

1) **Actualizar el sistema** (Aparte de ser necesario, debería tenerlo en cuenta siempre que va a instalar algo)

2) **Instalar Neovim** (Visitando su página oficial para hacerlo de la manera correcta según el sistema operativo: https://neovim.io/ **o** visitando su repositorio: https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - **(Ubuntu)**:
    1)
        ```sh
        sudo apt install neovim
        ```
    2)
        **Instalar el soporte para Python**
        ```sh
        sudo apt install python3-neovim
        ```
    3)
        **Instalar el software para las propiedades:**
        Neovim se ha agregado a un "Archivo de paquete personal" PPA, que le permite escoger entre la version [estable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable) o la [inestable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)
        
        ```sh
        sudo apt-get install software-properties-common
        ```
        
        >En caso de que el comando anterior no funcione a causa de que su Ubuntu no esta en la última versión, entonces ingresé el siguiente:
        ```sh
        sudo apt-get install python-software-properties
        ```
    
    4)  **Ingrese los siguientes comandos:**
    
        -
            ```sh
            sudo add-apt-repository ppa:neovim-ppa/stable
            ```
        
        -   
            ```sh
            sudo apt-get update
            ```
        
        -   
            ```sh
            sudo apt-get install neovim
            ```
    4)
        **Instalar PIP/Los requisitos previos para los módulos de Python**
        *(python3)*
        
        ```sh
        sudo apt-get install python3-dev python3-pip
        ```
        
        *(python2)*
        
        ```sh
        sudo apt-get install python-dev python-pip
        ```
        
        >En caso de estar utilizando una version anterior de Ubuntu, entonces ingrese los siguientes comandos (**SOLO EN CASO DE QUE LOS ANTERIORES COMANDOS NO HAYAN FUNCIONADO**):
        
        -
            ```sh
            sudo apt-get install python-dev python-pip python3-dev
            ```
        
        -
            ```sh
            sudo apt-get install python3-setuptools
            ```
        
        -
            ```sh
            sudo easy_install3 pip
            ```
    5)
        >En lo posible queremos evitar esas líneas rojas feas que aparecen cuando hay errores, muchas veces me he encontrado con lo siguiente: **No "python3" provider found. Run :checkhealth provider**
        ######
        Asi que en la terminal ingresaremos:
        ```sh
        python3 -m pip install --user --upgrade pynvim
        ```
    6)  **Instalar curl**
        Puede que NO tenga instalado/actualizado curl, en ese caso ingresaremos lo siguiente en la terminal:
        ```sh
        sudo apt install curl
        ```
    
    7)  **Instalar NVM (Node Version Manager)**
        
        -
            ```sh
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | sh
            ```
        
        -   Ahora vamos a activar la variable de entorno para NVM con el siguiente comando:
            
            ```sh
            source ~/.shrc
            ```
        
        -   Verificamos que nvm este instalado:
            
            ```sh
            nvm --version
            ```
        
        - Instalaremos nodejs mediante nvm:
            ```sh
            nvm install node
            ```
            > **Pero** nos instalará la versión actual NO estable, asi que revisaremos que versión LTS es la última con el siguiente comando:
        
            ```sh
            nvm ls
            ```
            e instalaremos esa versión:
            ```sh
            nvm install <versionLTS>
            ```
        -   >💡 Al instalar de esta manera nodejs, tenemos dos versiones de el mismo (la actual NO estable, y la LTS) asi que debemos decirle a nvm en caso de no haberlo hecho antes; que usaremos la versión LTS:
            
            ```sh
            nvm use <versionLTS>
            ```
    8)  **Instalar Ripgrep**
        De seguro conoce TELESCOPE (un buscador difuso altamente extensible sobre listas. Según la descripción en su repositorio)
        ![ImageDeTelescope](https://camo.githubusercontent.com/3d59e34d1f406890adf620546d3d97017ce0aacda034b1788c66fa872f192134/68747470733a2f2f692e696d6775722e636f6d2f5454546a6136742e676966)
        Pues este Plugin necesita unas pocas dependencias:
        - [Ripgrep](https://github.com/BurntSushi/ripgrep):
            
            ```sh
            sudo apt install ripgrep
            ```
        
        - [fd](https://github.com/sharkdp/fd#installation):
            
            ```sh
            sudo apt install fd-find
            ```
        
        - [Tree-sitter](https://pypi.org/project/tree-sitter/):
            Mediante PIP
            
            ```sh
            pip3 install tree_sitter
            ```
    
    9)  **Instalar yarn**
        
        ```sh
        sudo apt install yarn
        ```
    
    10) **Instalar [Lazygit](https://github.com/jesseduffield/lazygit)** (Administrador de git)
        
        -
            ```sh
            LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
            ```


        -
            ```sh
            curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
            ```


        -
            ```sh
            sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
            ```


        -
            ```sh
            lazygit --version
            ```


        -
            ```sh
            rm -rf lazygit.tar.gz
            ```


        -
            ```sh
            lazygit
            ```


            En caso de querer desinstalar Lazygit:
        -
            ```sh
            sudo rm -rf /usr/local/bin/lazygit
            ```

            En esta **[API](https://api.github.com/repos/jesseduffield/lazygit/releases/latest)** se encontrará la última versión de Lazygit, en lo posible el Owner del repositorio se encargará de actualizarlo.
            
            <br>
        
    11) **Instalar [Glow](https://github.com/charmbracelet/glow)** (Markdown)
        ![gifRelacionadoConGlow](https://camo.githubusercontent.com/bd591b74af8a6991894c8a84ab8d48f05ce7f66975b325d31f6954c836ddab27/68747470733a2f2f73747566662e636861726d2e73682f676c6f772f676c6f772d312e332d747261696c65722d6769746875622e676966)
        
        -
            ```sh
            echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
            ```
        
        -
            ```sh
            sudo apt update && sudo apt install glow
            ```
        > Ingrese el comando glow dentro de la carpeta en donde se encuentran sus archivos .md para visualizarlos
    
    <br>

    12) **DAP - Debug Adapter Protocol**
    
    En el siguiente **[link](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)** encontrará lo necesario para instalar los depuradores de cada lenguaje de programación que necesita


### Clonar el [repositorio](https://github.com/spavim/spaVim)
- Vaya a su carpeta .config
    
    ```sh
    cd .config
    ```
- Ingrese a la carpeta nvim, si NO la tiene creada; pues créela
    ```sh
    cd nvim
    ```
- Clone el repositorio allí
    *Incluyendo el punto final*
    -   HTTPS
        ```sh
        https://github.com/spavim/spaVim.git .
        ```
    -   SSH
        ```sh
        git@github.com:spavim/spaVim.git .
        ```
- Ingrese mediante neovim a su archivo init.vim
    ```sh
    nvim init.vim
    ```
- En modo comandos, instale los plugins:
    ```sh
    :PlugInstall
    ```
- Salga del editor:
    ```sh
    :wq
    ```
>🎉 Ahora ingrese de nuevo al editor y disfrute de ***[spaVim](https://github.com/spavim/spaVim)*** 🎉

**Le recomiendo instalar la fuente [Cascadia Code](https://github.com/microsoft/cascadia-code/releases) (CascadiaCodePLBold) y un tamaño de 10px en la configuración de su terminal**

En caso de errores post-instalación vaya a **[errores](https://github.com/spavim/spaVim/blob/main/Errors/Errors.md)**, en donde posiblemente encontrará el suyo, en caso contrario **[formúlelo aquí](https://github.com/spavim/spaVim/discussions/categories/errors)** para que los demás o el propio owner del repositorio puedan ayudarlo
