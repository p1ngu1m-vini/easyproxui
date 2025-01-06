# EasyUI

O EasyUI é uma biblioteca leve e fácil de usar para criação de interfaces de usuário (UI) na plataforma Multi Theft Auto (MTA). Ele simplifica a criação de elementos interativos, como botões, permitindo que desenvolvedores criem interfaces bonitas e interativas em seus recursos MTA.

## Funcionalidades

- **Criação de Botões**: Crie botões facilmente com propriedades personalizáveis.
- **Efeitos de Hover**: Os botões mudam de cor quando são sobrevoados.
- **Manipulação de Cliques**: Os botões acionam ações ao serem clicados.
- **Estado de Carregamento**: Os botões podem exibir um estado de carregamento.
- **Estados do Botão**: Botões podem ser habilitados ou desabilitados dinamicamente.
- **Estilização de Texto**: Personalize o texto do botão com tamanhos e estilos diferentes.
- **Suporte a Ícones**: Adicione ícones personalizados aos botões (removido na versão atual).

## Funções

### `EasyUI:createButton(propriedades)`
Cria um novo botão com as propriedades fornecidas.

**Parâmetros**:
- `x`: A posição X do botão.
- `y`: A posição Y do botão.
- `largura`: A largura do botão.
- `altura`: A altura do botão.
- `texto`: O texto exibido no botão.
- `corFundo`: A cor de fundo do botão.
- `corHover`: A cor do botão quando é sobrevoado.
- `corTexto`: A cor do texto.
- `bordaRadius`: O raio da borda para cantos arredondados.
- `onClick`: Uma função que é chamada quando o botão é clicado.
- `onMouseEnter`: Uma função que é chamada quando o mouse entra no botão.
- `onMouseLeave`: Uma função que é chamada quando o mouse sai do botão.
- `desabilitado`: Um valor booleano que define se o botão está desabilitado.
- `alpha`: O valor alpha da cor do botão.
- `corPress`: A cor do botão quando pressionado.
- `corSombra`: A cor da sombra quando o botão é sobrevoado.
- `isLoading`: Um valor booleano para especificar se o botão está em estado de carregamento.
- `corLoading`: A cor quando o botão está no estado de carregamento.

### `EasyUI:render()`
Renderiza todos os botões na tela. Esta função deve ser chamada a cada quadro (por exemplo, dentro de `onClientRender`).

### `EasyUI:handleClick(botao, estado)`
Manipula os eventos de clique dos botões. Esta função deve ser chamada nos eventos de clique (por exemplo, dentro de `onClientClick`).

**Parâmetros**:
- `botao`: O botão pressionado (ex: "left").
- `estado`: O estado do botão ("down" ou "up").

### `EasyUI:disableButton(indice)`
Desabilita um botão no índice especificado.

### `EasyUI:enableButton(indice)`
Habilita um botão no índice especificado.

### `EasyUI:setLoading(indice, estado)`
Define o estado de carregamento de um botão no índice especificado.

### `EasyUI:triggerMouseEnter(indice)`
Aciona o evento `onMouseEnter` para o botão no índice especificado.

### `EasyUI:triggerMouseLeave(indice)`
Aciona o evento `onMouseLeave` para o botão no índice especificado.

## Exemplo de Uso

```lua
EasyUI:createButton({
    x = 100,
    y = 100,
    largura = 200,
    altura = 50,
    texto = "Clique Aqui!",
    corFundo = tocolor(0, 128, 255),
    corHover = tocolor(0, 102, 204),
    corTexto = tocolor(255, 255, 255),
    bordaRadius = 10,
    onClick = function() 
        outputChatBox("Botão clicado!") 
    end
})

addEventHandler("onClientRender", root, function()
    EasyUI:render()
end)

addEventHandler("onClientClick", root, function(botao, estado)
    EasyUI:handleClick(botao, estado)
end)
