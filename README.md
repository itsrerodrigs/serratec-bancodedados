# Ecommerce Tradicional 🛍️

> Projeto final da disciplina **Banco de Dados** da formação em Residência TIC no Serratec. O programa foi desenvolvido com **PostgreSQL** através do SGBD **PgAdmin4**.

## Descrição do Projeto

A proposta é desenvolver um sistema de ecommerce tradicional que consiga apresentar: cadastro de funcionários, clientes, produtos e categoria, atualização e estoque, criação de pedido e emissão de nota fiscal. 

## Diagrama de Entidade e Relacionamento (DER)

Antes de iniciar a construção das tabelas no PgAdmin4, foi necessário criar um primeiro diagrama ER para mapeamento de todas as tabelas necessárias para o projeto. Após essa etapa, realizamos a normalização das tabelas e o resultado está disponível via Whimsical. [Confira aqui o DER do projeto!](https://whimsical.com/projeto-bancodados-grupo6-HacpwNU2uigcWW8sVjEKCr)

## Funcionaliades do Projeto
_O sistema de Ecommerce Tradicional implementado permite:_

- **Informações sobre Produtos**: O sistema é capaz de armazenar as seguintes informações sobre os produtos da empresa: código, nome, descrição, quantidade em estoque, data de fabricação, valor unitário.
- **Cadastro e Atualização de Produtos**: Ao cadastrar um produto no sistema, os funcionários da empresa devem ser capazes de: <br> Associá-lo a uma categoria, considerando que cada produto só poderá pertencer a uma categoria; <br> Atualizar a quantidade de itens no estoque. Se o produto já estiver cadastrado no sistema, o colaborador deverá apenas atualizar a quantidade de itens no estoque.
- **Informações sobre Categorias de Produtos**: Para cada categoria de produto, é necessário registrar: código, nome e descrição.
- **Informações sobre Clientes** <br> O sistema deverá armazenar os seguintes dados dos clientes: código, nome completo, nome de usuário, e-mail, CPF, data de nascimento, endereço completo. 
- **Realização de Pedidos**: Através do sistema, os clientes podem realizar pedidos. Cada pedido deve conter: um ou mais produtos; data em que foi realizado; por quem foi realizado; quantidade de cada item, considerando que um pedido pode ter mais de um item de um mesmo produto, de acordo com a quantidade disponível em estoque.
- **Informações sobre Funcionários** <br> Sobre os funcionários, é necessário guardar apenas: código, nome, CPF e nome de usuário. 

### Como executar
`1.` Clone o repositório em sua máquina. <br>
`2.` Importe o arquivo .sql no PgAdmin4. <br>
`3.` Execute as Querys individualmente para salvá-las ao banco de dados. <br>
`4.` Realize os testes: inclusão ou exclusão de pedido, adição de produto ao estoque, cadastro de funcionários, clientes, produtos ou categoria, emissão de nota fiscal. <br>

### Observações
> Este projeto é um exercício acadêmico que tem objetivo de aprimorar as habilidades de programação dos alunos em **Banco de Dados** via **PostgreSQL** e **PgAdmin4**. Sugestões de melhorias são bem-vindas.

### Equipe de Desenvolvimento
_Este projeto foi desenvolvido pelo Grupo 6 da Turma 22 (Nova Friburgo/Teresópolis) do Serratec 2024.2 com os seguintes integrantes:_

* Andressa Jandre
* Athirson Mattos
* Gabriel Siqueira
* Milton Rodrigues
* Renata Rodrigues
* Samuel Oliveira
