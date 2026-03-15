
# Modelo Formal — Transdutor Finito Determinístico

Queremos um Autômato Finito Determinístico:

- Reconhece números romanos válidos (≤ 3999)

- Converte para decimal

- Rejeita entradas inválidas
  


## 📔 Tipo de Transdutor: Mealy

👉 Usaremos Transdutor de Mealy, porque:

- A saída depende da transição (estado + símbolo lido)
- Precisamos somar/subtrair durante a leitura
- Moore exigiria estados demais (armazenando valores parciais)

### 💡 Exemplo:

Ler I → pode somar +1

Se depois vier V → corrigir para −1 e somar +5, retornando **IV = 4**

A emissão acontece durante a transição, não ao entrar no estado.


## Definição Formal

### Um transdutor Mealy é:

    𝑇 = (𝑄,Σ,Γ,𝛿,𝜆,𝑞0,𝐹) 


### 🔤 Alfabeto de Entrada
    Σ = {𝐼,𝑉,𝑋,𝐿,𝐶,𝐷,𝑀}
