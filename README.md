# tasks-checkpoints-ign

<!--
CRIANDO PROJETO

npm init -y

# Fastify: framework web para Node.js para construir aplicativos web e API's (mais performático que o Express)
npm i fastify

npm install typescript -D
npx tsc --init
### trocar "target: "es2016" para"target: "es2020"
npm i tsx -D

Colocar script no package.json - "dev": "tsx src/server.ts"
-->

<!--
INSTALANDO, modelando e rodando Prisma

npm i -D prisma
npm i @prisma/client

# Cria um DB local
npx prisma init --datasource-provider SQLite
npx prisma migrate dev

npx prisma studio

Gereador de diagramas para melhor visualizar as tabelas
npm i -D prisma-erd-generator @mermaid-js/mermaid-cli

No arquivo schema.prisma, incluir:
generator erd {
  provider = "prisma-erd-generator"
}

npx prisma generate
-->

<!--
INSTALANDO CORS

npm i @fastify/cors
-->

<!--
CRIAR SEED PARA PRÉ POPULAR O BANCO DE DADOS PARA TESTES EM DESENVOLVIMENTO
https://www.prisma.io/docs/guides/migrate/seed-database

Inserir no package.json:
"prisma": {
  "seed": "tsx prisma/seed.ts"
}
-->

<!--
Zod valida dados de entrada e maipula tipagem
npm i zod
-->

<!--
Biblioteca que permite várias operações com datas
npm i dayjs
-->
