# Sistema de Controle de Estoque

Sistema web completo para controle de estoque baseado em vendas, com integração de IA para análises inteligentes.

## 🚀 Tecnologias Utilizadas

### Frontend
- **React.js 18** com Vite para desenvolvimento rápido
- **Ant Design 5** para componentes UI responsivos
- **React Router 6** para navegação
- **React Query** para gerenciamento de estado e cache
- **Chart.js** para visualização de dados
- **Axios** para requisições HTTP

### Backend
- **Node.js** com Express.js para API RESTful
- **MongoDB Atlas** para banco de dados escalável
- **Mongoose** para modelagem de dados
- **JWT** para autenticação
- **Socket.io** para atualizações em tempo real
- **Winston** para logging

### Integrações
- **OpenAI API** (GPT-4o-mini) para análises inteligentes
- **Tesseract.js** para OCR de notas fiscais
- **xml2js** para parsing de XML
- **pdf-parse** para extração de dados de PDFs

## 📋 Funcionalidades

### Módulos Principais
- ✅ **Autenticação** - Login/registro com controle de roles (RBAC)
- ✅ **Dashboard** - Visão geral com gráficos e estatísticas
- ✅ **Produtos** - Cadastro, importação Excel, gerenciamento
- ✅ **Matéria-Prima** - Controle de insumos e fornecedores
- ✅ **Fichas Técnicas** - Cálculo de custos e composição de produtos
- ✅ **Estoque** - Movimentações, importação de NF, ajustes
- ✅ **Vendas** - Registro, importação, cancelamento
- ✅ **CRM (Sócios)** - Cadastro, análise de comportamento, segmentação
- ✅ **Assistente IA** - Análises inteligentes e recomendações

### Recursos Avançados
- 📊 **Análises Inteligentes** - ChatGPT integrado para insights
- 📈 **Gráficos Interativos** - Visualização de dados em tempo real
- 📱 **Design Responsivo** - Mobile-first e otimizado
- 🔒 **Segurança** - JWT, validação de inputs, RBAC
- 📤 **Importação/Exportação** - Excel, XML, PDF, OCR
- 🔄 **Atualizações em Tempo Real** - Socket.io para notificações

## 🛠️ Instalação

### Pré-requisitos
- Node.js 16+ 
- MongoDB Atlas (gratuito)
- Conta OpenAI (opcional, para IA)

### Passo a Passo

1. **Clone o repositório**
```bash
git clone https://github.com/seu-usuario/stock-control-system.git
cd stock-control-system
```

2. **Instale as dependências**
```bash
# Instalar dependências do projeto raiz
npm install

# Instalar dependências do backend
cd backend && npm install

# Instalar dependências do frontend
cd ../frontend && npm install
```

3. **Configure as variáveis de ambiente**

Crie os arquivos `.env` baseado nos exemplos:

**Backend (.env)**
```env
# Database
MONGODB_URI=mongodb+srv://usuario:senha@cluster.mongodb.net/stock-control

# JWT
JWT_SECRET=sua-chave-secreta-super-segura
JWT_EXPIRE=30d

# Server
PORT=5000
NODE_ENV=development

# OpenAI (opcional)
OPENAI_API_KEY=sua-chave-openai

# Email (opcional)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=seu-email@gmail.com
EMAIL_PASS=sua-senha

# Frontend URL
FRONTEND_URL=http://localhost:3000
```

**Frontend (.env)**
```env
VITE_API_URL=http://localhost:5000/api
```

4. **Inicie o servidor de desenvolvimento**

```bash
# Na raiz do projeto
npm run dev
```

O sistema estará disponível em:
- Frontend: http://localhost:3000
- Backend: http://localhost:5000

## 📖 Uso

### Primeiro Acesso
1. Acesse http://localhost:3000/register
2. Crie uma conta de administrador
3. Faça login e configure o sistema

### Configuração Inicial
1. **Cadastrar Fornecedores** - Essencial para matérias-primas
2. **Importar Produtos** - Use o template Excel fornecido
3. **Configurar Estoque** - Defina níveis mínimos e máximos
4. **Cadastrar Sócios** - Para controle de vendas e CRM

### Importação de Dados
- **Produtos**: Arquivo Excel com colunas (codigo, nome, categoria, unidade, preco_base)
- **Matérias-Primas**: Arquivo Excel com colunas (codigo, descricao, fornecedor, unidade, preco_unidade)
- **Notas Fiscais**: Upload de arquivos XML, PDF ou imagens (com OCR)

## 🤖 Assistente IA

O sistema integra ChatGPT para análises inteligentes:

### Comandos Úteis
- "Analise minhas vendas do último mês"
- "Quais produtos estão em estoque baixo?"
- "Sugira preços baseados no custo e margem"
- "Analise o churn dos meus sócios"
- "Preveja a demanda para próxima semana"

### Configuração da IA
1. Obtenha uma API Key da OpenAI
2. Configure no arquivo `.env` do backend
3. Acesse o módulo "Assistente IA" no menu

## 🔧 Desenvolvimento

### Estrutura do Projeto
```
stock-control-system/
├── backend/           # API Node.js
│   ├── controllers/   # Lógica de negócio
│   ├── models/       # Modelos MongoDB
│   ├── routes/       # Rotas da API
│   ├── middleware/   # Middlewares
│   └── uploads/      # Arquivos temporários
├── frontend/         # Aplicação React
│   ├── src/
│   │   ├── components/ # Componentes reutilizáveis
│   │   ├── pages/      # Páginas da aplicação
│   │   ├── services/   # Serviços de API
│   │   └── contexts/   # Contextos React
│   └── public/
└── docs/             # Documentação
```

### Scripts Disponíveis
```bash
# Desenvolvimento
npm run dev          # Inicia frontend e backend
npm run dev:frontend # Apenas frontend
npm run dev:backend  # Apenas backend

# Build
npm run build        # Build do frontend

# Produção
npm start           # Inicia o backend em produção
```

## 📱 Mobile

O sistema é totalmente responsivo e otimizado para dispositivos móveis:
- Design mobile-first
- Touch-friendly interface
- Otimização de performance
- Suporte para PWA

## 🔒 Segurança

- **Autenticação JWT** com refresh tokens
- **RBAC** (Role-Based Access Control)
- **Validação de inputs** no frontend e backend
- **CORS** configurado
- **Rate limiting** para prevenir ataques
- **Criptografia de senhas** com bcrypt

## 📊 Performance

- **Lazy loading** de componentes
- **Cache inteligente** com React Query
- **Compressão de arquivos** Gzip
- **Otimização de imagens**
- **Code splitting** automático

## 🚀 Deploy

### Deploy Frontend (Vercel)
1. Conecte seu repositório ao Vercel
2. Configure as variáveis de ambiente
3. Deploy automático a cada push

### Deploy Backend (Render/Heroku)
1. Configure o banco MongoDB Atlas
2. Defina as variáveis de ambiente
3. Deploy com Docker ou direto do Git

### Docker (Opcional)
```bash
# Construir imagens
docker-compose build

# Iniciar containers
docker-compose up -d
```

## 📄 Licença

Este projeto está licenciado sob a MIT License.

## 🤝 Contribuições

Contribuições são bem-vindas! Por favor:
1. Faça um Fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📞 Suporte

Para dúvidas e suporte:
- Crie uma Issue no GitHub
- Consulte a documentação em `/docs`
- Verifique os logs em `backend/logs/`

---

**Desenvolvido com ❤️ para controle de estoque inteligente**